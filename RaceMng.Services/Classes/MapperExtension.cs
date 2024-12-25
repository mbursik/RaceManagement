using RaceMng.Database.Models.Bos;
using RaceMng.Models.VM;


namespace RaceMng.Services.Classes
{
  public static class MapperExtension
  {
    #region Category
    public static Category? MapDB(this CategoryVM vm)
    {
      if (vm != null)
      {
        return new Category
        {
          Id = vm.Id,
          RaceId = vm.RaceId,
          Name = vm.Name,
          BirthYearFrom = vm.BirthYearFrom,
          BirthYearTo = vm.BirthYearTo,
          Distance = vm.Distance,
          Position = vm.Position,
          SexId = vm.RaceId,
          IsValid = vm.IsValid
        };
      }

      return null;
    }

    public static CategoryVM? MapVM(this Category db)
    {
      if (db != null)
      {
        return new CategoryVM
        {
          Id = db.Id,
          RaceId = db.RaceId,
          Name = db.Name,
          BirthYearFrom = db.BirthYearFrom,
          BirthYearTo = db.BirthYearTo,
          Distance = db.Distance,
          Position = db.Position,
          SexId = db.RaceId,
          IsValid = db.IsValid,
          Sex = db.Sex.MapVM()
          
        };
      }

      return null;
    }
    #endregion


    #region Race
    public static Race? MapDB(this RaceVM vm)
    {
      if (vm != null)
      {
        return new Race
        {
          Id = vm.Id,
          Name = vm.Name,
          Date = vm.Date,
          IsValid = vm.IsValid
        };
      }

      return null;
    }

    public static RaceVM? MapVM(this Race db)
    {
      if (db != null)
      {
        return new RaceVM
        {
          Id = db.Id,
          Name = db.Name,
          Date = db.Date,
          IsValid = db.IsValid
        };
      }

      return null;
    }
    #endregion

    #region Sex
    public static Sex? MapDB(this SexVM vm)
    {
      if (vm != null)
      {
        return new Sex
        {
          Id = vm.Id,
          Name = vm.Name
        };
      }

      return null;
    }

    public static SexVM? MapVM(this Sex db)
    {
      if (db != null)
      {
        return new SexVM
        {
          Id = db.Id,
          Name= db.Name
        };
      }

      return null;
    }
    #endregion

    #region Competitor
    public static Competitor? MapDB(this CompetitorVM vm)
    {
      if (vm != null)
      {
        return new Competitor
        {
          Id=vm.Id,
          FirstName=vm.FirstName,  
          LastName=vm.LastName,
          BirthYear=vm.BirthYear,
          Team=vm.Team,
          SexId=vm.SexId
        };
      }

      return null;
    }

    public static CompetitorVM? MapVM(this Competitor db)
    {
      if (db != null)
      {
        return new CompetitorVM
        {
          Id = db.Id,
          FirstName = db.FirstName,
          LastName = db.LastName,
          BirthYear = db.BirthYear,
          Team = db.Team,
          SexId = db.SexId,
          Sex = db.Sex.MapVM()!
          
        };
      }

      return null;
    }

    #endregion


    #region CompetitorCategory
    public static CompetitorCategory? MapDB(this CompetitorCategoryVM vm)
    {
      if (vm != null)
      {
        return new CompetitorCategory
        {
          CategoryId = vm.CategoryId,
          CompetitorId = vm.CompetitorId,
          Number = vm.Number,
          Time = vm.Time,
          Created = vm.Created
        };
      }

      return null;
    }

    public static CompetitorCategoryVM? MapVM(this CompetitorCategory db)
    {
      if (db != null)
      {
        return new CompetitorCategoryVM
        {
          CategoryId = db.CategoryId,
          CompetitorId = db.CompetitorId,
          Number = db.Number,
          Time = db.Time,
          Created = db.Created,
          Competitor = db.Competitor.MapVM()!,
          Category = db.Category.MapVM()!
        };
      }

      return null;
    }

    #endregion


  }
}
