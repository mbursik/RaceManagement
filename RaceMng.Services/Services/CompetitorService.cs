using Microsoft.EntityFrameworkCore;
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
  public class CompetitorService
  {
    private readonly RaceMngContext _context;
    private readonly ILogger<CompetitorService> _logger;
    public CompetitorService(RaceMngContext context, ILogger<CompetitorService> logger) 
    { 
      _context = context;
      _logger = logger;
    }

    public List<string> GetCompetitorAutocomplete(Expression<Func<Competitor, bool>> expression, Expression<Func<Competitor, string>> selector)
    { 
      return _context.Competitors.Where(expression).Select(selector).Distinct().ToList();
    }



  }
}
