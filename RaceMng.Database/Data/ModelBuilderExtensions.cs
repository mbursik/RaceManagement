using Microsoft.EntityFrameworkCore;
using RaceMng.Database.Models.Bos;

namespace Apollo.SmartFleet.Database.Data
{
  public static class ModelBuilderExtensions
  {

    public static void Seed(this ModelBuilder modelBuilder)
    {
      modelBuilder.Entity<Sex>().HasData(
           new Sex { Id = 1, Name = "Muž" },
           new Sex { Id = 2, Name = "Žena" }
      );

    }

  }
}
