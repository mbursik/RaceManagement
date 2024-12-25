using System.ComponentModel.DataAnnotations;

namespace RaceMng.Models.VM
{
  public class FormAddTimesVM
  {
    [Required]
    [Display(Name = "Časy")]
    public string Times { get; set; }

  }
}
