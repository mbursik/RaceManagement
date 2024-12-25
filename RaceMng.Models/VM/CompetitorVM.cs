using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Resources;
using System.Security.AccessControl;
using System.Xml.Linq;

namespace RaceMng.Models.VM
{
  public class CompetitorVM
  {
    public int Id { get; set; }
    [MaxLength(50)]
    [Display(Name = nameof(FirstName), ResourceType = typeof(Resources.CompetitorResource))]
    public string FirstName { get; set; }

    [MaxLength(50)]
    [Display(Name = nameof(LastName), ResourceType = typeof(Resources.CompetitorResource))]
    public string LastName { get; set; }
    [Range(1920, 2099)]
    [Display(Name = nameof(BirthYear), ResourceType = typeof(Resources.CompetitorResource))]
    public int BirthYear { get; set; }
    [MaxLength(50)]
    [Display(Name = nameof(Team), ResourceType = typeof(Resources.CompetitorResource))]
    public string Team { get; set; }
    [Display(Name = nameof(SexId), ResourceType = typeof(Resources.CompetitorResource))]
    public int SexId { get; set; }

    public virtual SexVM? Sex { get; set; }


  }
}
