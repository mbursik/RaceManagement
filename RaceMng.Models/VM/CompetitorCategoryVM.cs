using System.ComponentModel.DataAnnotations;
using System.Security.AccessControl;
using System.Xml.Linq;
using static RaceMng.Models.Classes.Constants;

namespace RaceMng.Models.VM
{
  public class CompetitorCategoryVM
  {
    public FormMode FormMode { get; set; }
    public int CategoryId { get; set; }
    public int CompetitorId { get; set; }
    [Required]
    [Range(1, 999)]//, ErrorMessage = "Value Must Bigger Than {1}")]
    [Display(Name = nameof(Number), ResourceType = typeof(Resources.CompetitorCategoryResource))]
    public int? Number { get; set; }
    [Display(Name = nameof(Time), ResourceType = typeof(Resources.CompetitorCategoryResource))]
    [DisplayFormat(DataFormatString = "{0:HH:mm:ss}")]
    public TimeOnly? Time { get; set; }

    [RegularExpression(@"^([01]?[0-9]|2[0-3]):[012345]?[0-9]:[012345]?([0-9][.]\d{0,7}|[0-9])$", ErrorMessage = "Invalid Time.")]
    [Display(Name = nameof(Time), ResourceType = typeof(Resources.CompetitorCategoryResource))]
    public string? TimeString
    {
      get
      {
        return Time.HasValue ? Time.Value.ToString("HH:mm:ss.fff") : null;
      }

      set
      {
        Time = (value == null) ? null : TimeOnly.Parse(value);
      }
    }
    public DateTime Created { get; set; }

    public virtual CompetitorVM? Competitor { get; set; }
    public virtual CategoryVM? Category { get; set; }


  }
}
