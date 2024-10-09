using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class User_controls_PageLoadTime : System.Web.UI.UserControl
{
    private DateTime _start;
    private DateTime _end;

    protected void Page_Init(object sender, System.EventArgs e)
    {
        _start = DateTime.Now;
    }

    protected void Page_PreRender(object sender, System.EventArgs e)
    {
        _end = DateTime.Now;
        TimeSpan time = _end.Subtract(_start);
        lblPageLoadTime.Text = string.Format("Sayfa {0} saniyede yüklendi.", time.TotalSeconds.ToString());
    }
}
