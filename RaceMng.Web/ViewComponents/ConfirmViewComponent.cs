using Microsoft.AspNetCore.Mvc;

namespace RaceMng.Web.ViewComponents
{
    [ViewComponent(Name = "Confirm")]
    public class ConfirmViewComponent : ViewComponent
    {

        public ConfirmViewComponent()
        {
         
        }
                                                                                                                                                                                
        public Task<IViewComponentResult> InvokeAsync(string action, string message = "Do you really want to delete this record?", bool hideConfirmButton=false, string confirmButtonName="Delete", string cancelButtonName = "Cancel", string icon = "ccwt_remove_cross.png")
        {
            ViewData["VC_Action"] = action;
            ViewData["VC_Message"] = message;
            ViewData["VC_Icon"] = icon;
            ViewData["VC_HideConfirmButton"] = hideConfirmButton;
            ViewData["VC_ConfirmButtonName"] = confirmButtonName;
            ViewData["VC_CancelButtonName"] = cancelButtonName;

            return Task.FromResult<IViewComponentResult>(View("Default"));
        }
    }
}
