namespace RaceMng.Models.VM
{ 
  public class RaceVM
  {
    public int Id { get; set; }
    public string Name { get; set; }
    public DateOnly Date { get; set; }
    public bool IsValid { get; set; }
  }
}
