namespace RaceMng.Models.VM
{
  public class StartListVM
  {
    public CategoryVM Category { get; set; }

    public List<CompetitorCategoryVM>? CompetitorCategories { get; set; }
  }
}
