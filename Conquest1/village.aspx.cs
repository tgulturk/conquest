using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Conquest1
{
    public partial class village1 : System.Web.UI.Page
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
                String temp = con.BinaKontrolProc();
                string villageID = Session["VillageID"].ToString();
                if (!IsPostBack)
                {
                    rep.DataSource = con.Binalar(villageID);
                    rep.DataBind();
                    rep1.DataSource = con.Askerler(villageID);
                    rep1.DataBind();

                    DataTable dt1 = con.MadenArtis(villageID);
                    lblOduninc.Text = dt1.Rows[0]["Miktar"].ToString();
                    lblKilinc.Text = dt1.Rows[1]["Miktar"].ToString();
                    lblDemirinc.Text = dt1.Rows[2]["Miktar"].ToString();
                }
                repe.DataSource = con.GelenSaldiriDef(villageID);
                repe.DataBind();
                repe2.DataSource = con.GidenSaldiriDef(villageID);
                repe2.DataBind();
                repe3.DataSource = con.DonenSaldiriDef(villageID);
                repe3.DataBind();
            }
        }

        protected void rep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string bID = (e.Item.FindControl("id") as Label).Text;

            switch (bID)
            {
                case "1": Response.Redirect("main.aspx"); break;
                case "2": Response.Redirect("wood.aspx"); break;
                case "3": Response.Redirect("clay.aspx"); break;
                case "4": Response.Redirect("iron.aspx"); break;
                case "5": Response.Redirect("farm.aspx"); break;
                case "6": Response.Redirect("commandcenter.aspx"); break;
                case "7": Response.Redirect("warehouse.aspx"); break;
                case "8": Response.Redirect("barracks.aspx"); break;
                case "9": Response.Redirect("stable.aspx"); break;
                case "10": Response.Redirect("smithy.aspx"); break;
                case "11": Response.Redirect("wall.aspx"); break;
                case "12": Response.Redirect("market.aspx"); break;
                case "13": Response.Redirect("palace.aspx"); break;
                default:
                    break;
            }
        }
    }
}