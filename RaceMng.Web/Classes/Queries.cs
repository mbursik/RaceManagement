using SokolDily.Web.Models;

namespace SokolDily.Web.Classes
{
  public static class Queries
  {
    public const string CompetitorCategoryAll = "select cc.*, " +
        "\r\nco.Id as Competitor#Id, " +
        "\r\nco.FirstName as Competitor#FirstName, " +
        "\r\nco.LastName as Competitor#LastName, " +
        "\r\nco.BirthYear as Competitor#BirthYear, " +
        "\r\nco.Team as Competitor#Team, " +
        "\r\nco.Sex_Id as Competitor#Sex_Id, " +
        "\r\nca.Id as Category#Id," +
        "\r\nca.Race_Id as Category#Race_Id, " +
        "\r\nca.[Name] as Category#Name, " +
        "\r\nca.BirthYearFrom as Category#BirthYearFrom, " +
        "\r\nca.BirthYearTo as Category#BirthYearTo, " +
        "\r\nca.Sex_Id as Category#Sex_Id, " +
        "\r\nca.IsValid as Category#IsValid," +
        "\r\nse.Id as Sex#Id, " +
        "\r\nse.[Name] as Sex#Name" +
        "\r\nfrom [CompetitorCategory] cc" +
        "\r\ninner join [Competitor] co on cc.Competitor_Id = co.Id " +
        "\r\ninner join [Category] ca on cc.Category_Id = ca.Id and ca.IsValid=1 " +
        "\r\ninner join [Race] ra on ca.Race_Id = ra.Id and ra.IsValid=1" +
        "\r\ninner join [Sex] se on co.[Sex_Id]=se.Id ";

  }
}
