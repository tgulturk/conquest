using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Conquest1
{
    public partial class village : System.Web.UI.MasterPage
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
                //lbProfil.Text = Session["KULLANICI"].ToString();
                String villageID = Session["VillageID"].ToString();
                if (!IsPostBack)
                {
                    int userID = con.getuserID(Session["KULLANICI"].ToString());
                    string newmescount = con.getnewmailcount(userID.ToString());
                    lbMesajlar.Text += newmescount;
                    string newrepcount = con.getnewreportcount(userID.ToString());
                    lbRaporlar.Text += newrepcount;

                    DataTable dt = con.Madenler(villageID);
                    lblOdun.Text = dt.Rows[0]["Miktar"].ToString();
                    lblKil.Text = dt.Rows[1]["Miktar"].ToString();
                    lblDemir.Text = dt.Rows[2]["Miktar"].ToString();

                    lblPopused.Text = con.getusedpop(villageID)+" / ";
                    lblPoptotal.Text = con.gettotalpop(villageID);
                    LbKoyAdi.Text = con.getvillagename(villageID);
                    lblCoordinate.Text = con.getvillagecoordinates(villageID);
                    Page.Header.Title = LbKoyAdi.Text + " " + lblCoordinate.Text + " - Conquest";
                    lblCapacity.Text = con.getrescapacity(villageID);
                    lblTime.Text = "Sunucu Saati: " + DateTime.Now.ToString();

                }
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            String villageID = Session["VillageID"].ToString();

            DataTable dt = con.Madenler(villageID);
            lblOdun.Text = dt.Rows[0]["Miktar"].ToString();
            lblKil.Text = dt.Rows[1]["Miktar"].ToString();
            lblDemir.Text = dt.Rows[2]["Miktar"].ToString();
            lblCapacity.Text = con.getrescapacity(villageID);
            lblPopused.Text = con.getusedpop(villageID) + " / ";
            lblPoptotal.Text = con.gettotalpop(villageID);
            lblTime.Text = "Sunucu Saati: " + DateTime.Now.ToString();
            //UpdatePanel1.Update();
        }
        protected void lbCikis1_Click(object sender, EventArgs e)
        {
            Session.Remove("KULLANICI");
            Session.Abandon();
            Session.Clear();
            Response.Redirect("default.aspx");
        }

        protected void lbTopluBakis_Click(object sender, EventArgs e)
        {
            Response.Redirect("overview.aspx");
        }

        protected void LbKoyAdi_Click(object sender, EventArgs e)
        {
            Response.Redirect("village.aspx");
        }

        protected void lbMesajlar_Click(object sender, EventArgs e)
        {
            Response.Redirect("messages.aspx");
        }

        protected void lbAyarlar_Click(object sender, EventArgs e)
        {
            Response.Redirect("settings.aspx");
        }

        protected void lbSiralama_Click(object sender, EventArgs e)
        {
            Session["user"] = Session["KULLANICI"].ToString();
            Response.Redirect("rankings.aspx");
        }

        protected int Aralik(int a)
        {
            if (a < 10) return 0;
            else if (a < 20) return 10;
            else if (a < 30) return 20;
            else if (a < 40) return 30;
            else if (a < 50) return 40;
            else return 40;
        }

        protected void lbMaps_Click(object sender, EventArgs e)
        {
            String villageID = Session["VillageID"].ToString();

            Session["vID"] = villageID;
            string x = con.getvillageX(villageID);
            string y = con.getvillageY(villageID);
            Session["x"] = Aralik(Convert.ToInt32(x));
            Session["y"] = Aralik(Convert.ToInt32(y));
            Response.Redirect("map.aspx");
        }

        protected void lbRaporlar_Click(object sender, EventArgs e)
        {
            Response.Redirect("report.aspx");
        }
    }
}