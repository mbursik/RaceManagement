using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using RaceMng.Models.VM;
using RaceMng.Models.Classes;
using System.Data;
using System.Xml.Linq;
using System.Transactions;
using System.Data.Common;
using Microsoft.EntityFrameworkCore;
using RaceMng.Database.Context;
using RaceMng.Services.Classes;
using RaceMng.Database.Models.Bos;
using RaceMng.Services.Services;
using System.Linq.Expressions;
using RaceMng.Web.Classes;
using System.Globalization;


namespace RaceMng.Web.Controllers
{
  public class RaceController : Controller
  {
    private readonly ILogger<RaceController> _logger;
    private readonly CategoryService _categoryService;
    private readonly CompetitorCategoryService _competitorCategoryService;
    private readonly CompetitorService _competitorService;
    private readonly SexService _sexService;
    private readonly RaceService _raceService;

    public RaceController(ILogger<RaceController> logger, CategoryService categoryService, CompetitorCategoryService competitorCategoryService, CompetitorService competitorService, SexService sexService, RaceService raceService)
    {
      _logger = logger;
      _categoryService = categoryService;
      _competitorCategoryService = competitorCategoryService;
      _competitorService = competitorService;
      _sexService = sexService;
      _raceService = raceService;
    }
    // GET: RaceController
    public ActionResult Index(RaceListVM model)
    {

      var xxx = CultureInfo.CurrentUICulture.Name;

      ViewData["Categories"] = new SelectList(_categoryService.GetValidCategories(), "Id", "Name");

      Expression<Func<CompetitorCategory, bool>> filter = x => x.Category.Race.IsValid && x.Category.IsValid;
      //var cc = _context.CompetitorCategories
      //  .Include(x => x.Competitor).ThenInclude(x => x.Sex)
      //  .Include(x => x.Category).ThenInclude(x => x.Race).Where(x => x.Category.Race.IsValid && x.Category.IsValid);


      if (model.CategoryId != null)
      {
        //cc = cc.Where(x => x.CategoryId == model.CategoryId);
        filter = filter.AndAlso(x => x.CategoryId == model.CategoryId);
      }


      Expression<Func<CompetitorCategory, object>>? sort = null;
      switch (model.SortField)
      {
        case "FirstName":
          sort = x => x.Competitor.FirstName;
          break;
        case "LastName":
          sort = x => x.Competitor.LastName;
          break;
        case "Number":
          sort = x => x.Number;
          break;
        case "BirthYear":
          sort = x => x.Competitor.BirthYear;
          break;
        case "Team":
          sort = x => x.Competitor.Team;
          break;
        case "CategoryName":
          sort = x => x.Category.Name;
          break;
        case "Time":
          sort = x => x.Time;
          break;
        default:
          sort = x => x.Created;
          break;
      }

      model.CompetitorCategories = _competitorCategoryService.GetCompetitorCategories(filter, sort, model.SortDirection);
      return View(model);
    }

    // GET: RaceController/Details/5
    public ActionResult Details(int id)
    {
      return View();
    }

    // GET: RaceController/Create
    public ActionResult CreateCompetitorCategory()
    {
      ViewData["Sex"] = new SelectList(_sexService.GetSexes(), "Id", "Name");

      CompetitorCategoryVM cc = new();
      cc.FormMode = Constants.FormMode.New;
      //cc.Number = 222;
      //cc.Competitor = new CompetitorVM { FirstName="Aaa", LastName="Bbb", BirthYear = 1984, SexId=1, Team= "TJ Sokol Valcha"};
      return PartialView("_CreateCompetitorCategoryPartial", cc);
    }


    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult SaveCompetitorCategory(CompetitorCategoryVM cc)
    {
      if (ModelState.IsValid)
      {

        var retVal = _competitorCategoryService.SaveCompetitorCategory(cc);

        if (retVal.errNumber == 0)
          return Ok("Ok");
        else
          return ViewComponent("Confirm", new { action = "", message = retVal.errMessage, hideConfirmButton = true, icon = "warning-48.png" });

      }
      else
      {
        return StatusCode(StatusCodes.Status501NotImplemented, "Model is not valid");// PartialView("_AnnualDemandPartial", annualDemandVM);
      }
      
    }


    public ActionResult EditCompetitorCategory(int categoryId, int competitorId)
    {
      ViewData["Sex"] = new SelectList(_sexService.GetSexes(), "Id", "Name");

      var cc = _competitorCategoryService.GetCompetitorCategory(categoryId, competitorId);

      if (cc == null)
      {
        return NotFound();
      }

      cc.FormMode = Constants.FormMode.Edit;
 
      return PartialView("_CreateCompetitorCategoryPartial", cc);
    }

    //[HttpPost]
    //[ValidateAntiForgeryToken]
    //public ActionResult EditCompetitorCategory(CompetitorCategory cc)
    //{
    //  return PartialView("_CreateCompetitorCategoryPartial", cc);

    //}

    public ActionResult DeleteCompetitorCategory(int categoryId, int competitorId)
    {
      return ViewComponent("Confirm", new { action = Url.Action("DeleteCompetitorCategory", "Race", new { categoryId=categoryId, competitorId=competitorId }), message="Opravdu chcete smazat tento záznam?", confirmButtonName = "Smazat", cancelButtonName = "Zrušit", icon = "cancel-48.png" });
    }


    [HttpPost, ActionName("DeleteCompetitorCategory")]
    //[ValidateAntiForgeryToken]
    public ActionResult DeleteCompetitorCategoryConfirmed(int categoryId, int competitorId)
    {
      _competitorCategoryService.DeleteCompetitorCategory(categoryId, competitorId);
      return Ok("Ok");
    }


    [HttpPost]
    public JsonResult AutocompleteFirstName(string term)
    {
      List<string> names = _competitorService.GetCompetitorAutocomplete(x => x.FirstName.Contains(term), x => x.FirstName); //.Competitors.Where(x => x.FirstName.Contains(term)).Select(x => x.FirstName).Distinct().ToList();
      return Json(names);
    }

    [HttpPost]
    public JsonResult AutocompleteLastName(string term)
    {
      List<string> names = _competitorService.GetCompetitorAutocomplete(x => x.LastName.Contains(term), x => x.LastName);
      return Json(names);
    }

    [HttpPost]
    public JsonResult AutocompleteTeam(string term)
    {
      List<string> names = _competitorService.GetCompetitorAutocomplete(x => x.Team.Contains(term), x => x.Team); //_context.Competitors.Where(x => x.Team.Contains(term)).Select(x => x.Team).Distinct().ToList();
      return Json(names);
    }


    public ActionResult StartList(int? categoryId)
    {
      List<StartListVM> model = _categoryService.GetCategories(x => x.IsValid && x.Race.IsValid && (x.Id == categoryId || categoryId == null))
      .OrderBy(x => x.Distance).ThenBy(x => x.SexId)
      .Select(category => new StartListVM
        {
          Category = category,
          CompetitorCategories = _competitorCategoryService.GetCompetitorCategories(x => x.CategoryId == category.Id, x => x.Number, "asc")
        })
      .ToList();

      return View(model);
    }


    public ActionResult Results(int? categoryId)
    {
      ViewData["Race"] = _raceService.GetValidRace();

      List<ResultsVM> model = _categoryService.GetCategories(x => x.IsValid && x.Race.IsValid && (x.Id == categoryId || categoryId == null))
      .OrderBy(x => x.Position)/*.ThenBy(x => x.SexId)*/
      .Select(category => new ResultsVM
      {
        Category = category,
        CompetitorCategories = _competitorCategoryService.GetCompetitorCategories(x => x.CategoryId == category.Id, x => x.Time ?? new TimeOnly(23,59,59), "asc")
      })
      .ToList();


      return View(model);
    }


    public ActionResult AddTimes()
    {
      return PartialView("_AddTimesPartial");
    }


    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult SaveTimes(FormAddTimesVM model)
    {
      if (ModelState.IsValid)
      {
        var retVal = _competitorCategoryService.EditTimes(model.Times);

        if (retVal.errNumber == 0)
          return Ok("Ok");
        else
          return ViewComponent("Confirm", new { action = "", message = retVal.errMessage, hideConfirmButton = true, icon = "warning-48.png" });
      }
      else
      {
        return StatusCode(StatusCodes.Status501NotImplemented, "Model is not valid");// PartialView("_AnnualDemandPartial", annualDemandVM);
      }

    }


    // POST: RaceController/Create
    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Create(IFormCollection collection)
    {
      try
      {
        return RedirectToAction(nameof(Index));
      }
      catch
      {
        return View();
      }
    }

    // GET: RaceController/Edit/5
    public ActionResult Edit(int id)
    {
      return View();
    }

    // POST: RaceController/Edit/5
    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Edit(int id, IFormCollection collection)
    {
      try
      {
        return RedirectToAction(nameof(Index));
      }
      catch
      {
        return View();
      }
    }

    // GET: RaceController/Delete/5
    public ActionResult Delete(int id)
    {
      return View();
    }

    // POST: RaceController/Delete/5
    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Delete(int id, IFormCollection collection)
    {
      try
      {
        return RedirectToAction(nameof(Index));
      }
      catch
      {
        return View();
      }
    }
  }
}
