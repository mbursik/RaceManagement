using Microsoft.Extensions.Logging;
using RaceMng.Database.Context;
using RaceMng.Database.Models.Bos;
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
  public class CategoryService
  {
    private readonly RaceMngContext _context;
    private readonly ILogger<CategoryService> _logger;
    public CategoryService(RaceMngContext context, ILogger<CategoryService> logger) 
    { 
      _context = context;
      _logger = logger;
    }

    public List<CategoryVM?> GetValidCategories() 
    {
      return _context.Categories.Where(x => x.IsValid && x.Race.IsValid).Select(x => x.MapVM()).ToList();
    }

    public List<CategoryVM?> GetCategories(Expression<Func<Category, bool>> expression)
    {
      return _context.Categories.Where(expression).Select(x => x.MapVM()).ToList();
    }


  }
}
