using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Conquest1
{
    public partial class overwiev : System.Web.UI.Page
    {
        DbConnection con = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KULLANICI"] == null)
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                string villageID = Session["VillageID"].ToString();
                if (!IsPostBack)
                {
                    int userID = con.getuserID(Session["KULLANICI"].ToString());
                    rep.DataSource = con.overview(userID);
                    rep.DataBind();
                }
            }
        }

        protected void rep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["VillageID"] = (e.Item.FindControl("vID") as Label).Text;
            Response.Redirect("village.aspx");
        }
    }
}