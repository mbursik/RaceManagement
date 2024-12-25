using Microsoft.AspNetCore.Mvc;
using RaceMng.Web.Models;
using RaceMng.Web.Services;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Reflection.PortableExecutable;

namespace RaceMng.Web.Controllers
{
  public class HomeController : Controller
  {
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
      _logger = logger;
    }

    public IActionResult Index()
    {
      /*
      List<UserViewModel> result = new();
      string query = "SELECT * FROM [User];";
      _sql.ConnectionOpen();
      result = _sql.ExecuteToList<UserViewModel>(query);
      _sql.ConnectionClose();


      query = "INSERT INTO Emps VALUES('Ivana','Stočesová');SELECT * FROM Emps WHERE Id = scope_identity()";
      _sql.ConnectionOpen();
      var xxx = _sql.ExecuteFirstOrEmpty<UserViewModel>(query);
      _sql.ConnectionClose();


      query = "UPDATE Emps SET LastName='Chytrá' where LastName = 'Blbá'";
      _sql.ConnectionOpen();
      var rows = _sql.Execute(query);
      _sql.ConnectionClose();



      return View(result);
      */
      return View();
    }

    //private List<T> GetList<T>(IDataReader reader)
    //{
    //  List<T> list = new List<T>();
    //  while (reader.Read())
    //  {
    //    var type = typeof(T);
    //    T obj = (T)Activator.CreateInstance(type)!;
    //    foreach (var prop in type.GetProperties())
    //    { 
    //      var propType = prop.PropertyType;
    //      prop.SetValue(obj, Convert.ChangeType(reader[prop.Name].ToString(),propType));
    //    }
    //    list.Add(obj);
    //  }
    //  return list;
    //}



    public IActionResult Privacy()
    {
      return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
      return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
  }
}