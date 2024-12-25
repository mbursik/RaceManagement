using System.ComponentModel.DataAnnotations;

namespace RaceMng.Models.VM
{
  public class SexVM
  {
    public int Id { get; set; }
    [Display(Name = nameof(Name), ResourceType = typeof(Resources.SexResource))]
    public string Name { get; set; }

  }
}
