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
  public class RaceService
  {
    private readonly RaceMngContext _context;
    private readonly ILogger<SexService> _logger;
    public RaceService(RaceMngContext context, ILogger<SexService> logger) 
    { 
      _context = context;
      _logger = logger;
    }


    public RaceVM? GetValidRace()
    { 
      return _context.Races.FirstOrDefault(x => x.IsValid)?.MapVM();
    }



  }
}
