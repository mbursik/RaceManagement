using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using RaceMng.Database.Context;
using RaceMng.Database.Models.Bos;
using RaceMng.Models.Classes;
using RaceMng.Models.VM;
using RaceMng.Services.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace RaceMng.Services.Services
{
  public class CompetitorCategoryService
  {
    private readonly RaceMngContext _context;
    private readonly ILogger<CategoryService> _logger;
    public CompetitorCategoryService(RaceMngContext context, ILogger<CategoryService> logger) 
    { 
      _context = context;
      _logger = logger;
    }

    public List<CompetitorCategoryVM> GetCompetitorCategories(Expression<Func<CompetitorCategory, bool>> expression, Expression<Func<CompetitorCategory, object>> sortBy, string sortDirection ) 
    {

      if (sortDirection == "asc" )
        return _context.CompetitorCategories.Include(x => x.Category).Include(x => x.Competitor).ThenInclude(x => x.Sex).Where(expression).OrderBy(sortBy).Select(x => x.MapVM()!).ToList();
      else
        return _context.CompetitorCategories.Include(x => x.Category).Include(x => x.Competitor).ThenInclude(x => x.Sex).Where(expression).OrderByDescending(sortBy).Select(x => x.MapVM()!).ToList();
    }


    public CompetitorCategoryVM? GetCompetitorCategorySimple(int categoryId, int competitorId)
    {
      return _context.CompetitorCategories.FirstOrDefault(x => x.CategoryId == categoryId && x.CompetitorId == competitorId)?.MapVM();
    }


    public CompetitorCategoryVM? GetCompetitorCategory(int categoryId, int competitorId)
    {
      var cc = _context.CompetitorCategories
        .Include(x => x.Competitor).ThenInclude(x => x.Sex)
        .Include(x => x.Category)
        .FirstOrDefault(x => x.CategoryId == categoryId && x.CompetitorId == competitorId)?.MapVM();

      return cc;
    }


    public void DeleteCompetitorCategory(CompetitorCategoryVM cc)
    {
      _context.Remove(cc.MapDB()!);
      _context.SaveChanges();
    }

    public void DeleteCompetitorCategory(int categoryId, int competitorId)
    {
      var cc = _context.CompetitorCategories.FirstOrDefault(x => x.CategoryId == categoryId && x.CompetitorId == competitorId);
      if (cc != null)
      {
        _context.CompetitorCategories.Remove(cc);
        _context.SaveChanges();
      }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="cc"></param>
    /// <returns>
    /// 0 - Ok <br/>
    /// 101 - Neexistuje platný/aktivní závod! <br/>
    /// 102 - Duplicitní startovní číslo! <br/>
    /// 103 - Neexistuje platná kategorie pro vybraný závod, ročník a pohlaví! <br/>
    /// 104 - Účastník již byl přihlášen!
    /// </returns>
    public (int errNumber, string errMessage) SaveCompetitorCategory(CompetitorCategoryVM cc)
    {

      using (var transaction = _context.Database.BeginTransaction())
      {
        try
        {

          if (cc.FormMode == Constants.FormMode.Edit)
          {
            //remove previous record
            var ccRemove = _context.CompetitorCategories.FirstOrDefault(x => x.CategoryId == cc.CategoryId && x.CompetitorId == cc.CompetitorId);
            if (ccRemove != null)
            {
              _context.Remove(ccRemove);
              _context.SaveChanges();
            }
          }

          //find valid race
          var race = _context.Races.FirstOrDefault(x => x.IsValid);
          if (race == null)
          {
            transaction.Rollback();
            return (101, "Neexistuje platný/aktivní závod!");
          }

          //duplicate start number check
          var isDuplicateNumber = _context.CompetitorCategories.Any(x => x.Category.RaceId == race.Id && x.Category.IsValid && x.Number == cc.Number);
          if (isDuplicateNumber)
          {
            transaction.Rollback();
            return (102, "Duplicitní startovní číslo!");
          }

          //Competitor
          Competitor? competitor = _context.Competitors.FirstOrDefault(x => x.FirstName == cc.Competitor.FirstName
          && x.LastName == cc.Competitor.LastName
          && x.BirthYear == cc.Competitor.BirthYear
          && x.SexId == cc.Competitor.SexId);

          if (competitor == null)
          {
            competitor = cc.Competitor.MapDB();
            _context.Competitors.Add(competitor);
            _context.SaveChanges();
          }

          //find proper category
          Category? category = _context.Categories.FirstOrDefault(x => x.RaceId == race.Id
          && x.SexId == cc.Competitor.SexId
          && x.BirthYearFrom <= cc.Competitor.BirthYear && cc.Competitor.BirthYear <= x.BirthYearTo
          && x.IsValid);

          if (category == null)
          {
            transaction.Rollback();
            return (103, "Neexistuje platná kategorie pro vybraný závod, ročník a pohlaví!");
          }


          var isCompetitorCategory = _context.CompetitorCategories.Any(x => x.CategoryId == category.Id && x.CompetitorId == competitor.Id);
          if (isCompetitorCategory)
          {
            transaction.Rollback();
            return (104, "Účastník již byl přihlášen!");
          }

          var competitorCategory = new CompetitorCategory
          {
            CategoryId = category.Id,
            CompetitorId = competitor.Id,
            Number = cc.Number,
            Time = cc.Time,
            Created = DateTime.Now
          };

          _context.CompetitorCategories.Add(competitorCategory);
          _context.SaveChanges();

          transaction.Commit();
        }
        catch (Exception ex)
        {
          transaction.Rollback();
          _logger.LogError(ex, ex.Message);
          throw;

        }

        return (0,"");
      }

    }



    public (int errNumber, string errMessage) EditTimes(string times)
    {
      var timeItems = times.Split(Environment.NewLine);
      var race = _context.Races.First(x => x.IsValid);

      using (var transaction = _context.Database.BeginTransaction())
      {
        try
        {
          foreach (var item in timeItems)
          {
            var num_time = item.Split('-');
            if (num_time.Length == 2)
            {
              int number = int.Parse(num_time[0]);
              TimeOnly time = TimeOnly.Parse(num_time[1]);

              var cc = _context.CompetitorCategories.FirstOrDefault(x => x.Category.RaceId == race.Id && x.Number == number);
              if (cc != null)
              {
                cc.Time = time;
                _context.SaveChanges();
              }
              else
              {
                transaction.Rollback();
                return (101, $"Číslo {number} nebylo nalezeno v aktuálním závodě!");// throw new Exception("Císlo neexistuje!");
              }
            }
          }
          transaction.Commit();
        }
        catch (Exception ex)
        {
          transaction.Rollback();
          _logger.LogError(ex, ex.Message);
          throw;
        }
      }
      return (0, "");
    }


  }
}
