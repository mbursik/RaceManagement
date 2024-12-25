namespace RaceMng.Models.VM
{
  public class RaceListVM
  {
    public int? CategoryId { get; set; }

    public string SortField { get; set; }
    public string SortDirection { get; set; }

    public List<CompetitorCategoryVM>? CompetitorCategories { get; set; }
  }
}
