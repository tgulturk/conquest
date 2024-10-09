using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Conquest1
{
    public partial class warehouse : System.Web.UI.Page
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
                DataTable dt1 = con.CapBilgi(villageID);
                lblseviye.Text = con.getBuildingLevel(villageID, "7");
                lblguncel.Text = dt1.Rows[0]["Capacity"].ToString();

                if (lblseviye.Text == "30")
                {
                    lblsonraki.Text = "-";
                }
                else
                {
                    lblsonraki.Text = dt1.Rows[1]["Capacity"].ToString();
                }

            }
        }
    }
}