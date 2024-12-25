using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RaceMng.Database.Context
{
  public class RaceMngContextDesignTimeFactory : IDesignTimeDbContextFactory<RaceMngContext>
  {

    public RaceMngContext CreateDbContext(string[] args)
    {

      IConfigurationRoot configuration = new ConfigurationBuilder()
          .SetBasePath(Directory.GetCurrentDirectory())
          .AddJsonFile("appsettings.json")
          .Build();

      var connectionString = configuration.GetConnectionString("RaceMngConnection");/*Environment.GetEnvironmentVariable("ConnectionStrings.RaceMngConnection") ??*/
      var builder = new DbContextOptionsBuilder<RaceMngContext>();
      builder.UseSqlServer(connectionString, x => x.UseDateOnlyTimeOnly());
      return new RaceMngContext(builder.Options);
    }
  }
}
