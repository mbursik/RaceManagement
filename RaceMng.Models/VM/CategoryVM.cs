using System.ComponentModel.DataAnnotations;
using System.Security.AccessControl;
using System.Xml.Linq;

namespace RaceMng.Models.VM
{
  public class CategoryVM
  {
    public int Id { get; set; }
    public int RaceId { get; set; }
    [Display(Name = nameof(Name), ResourceType = typeof(Resources.CategoryResource))]
    public string Name { get; set; }
    public int BirthYearFrom { get; set; }
    public int BirthYearTo { get; set; }
    public int Distance { get; set; }
    public int Position { get; set; }
    public int SexId { get; set; }
    public bool IsValid { get; set; }

    public virtual SexVM Sex { get; set; }


  }
}
