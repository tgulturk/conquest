using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Conquest1
{
    public partial class rankings : System.Web.UI.Page
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
                if (!IsPostBack)
                {
                    lbMesajYaz.Visible = false;
                    lbArkadasEkle.Visible = false;
                    int userID = con.getuserID(Session["user"].ToString());
                    lblUsername.Text = Session["user"].ToString();
                    lblEposta.Text = con.getemail(Session["user"].ToString());
                    lblPuan.Text = con.getuserPoint(userID).ToString();
                    lblSiralama.Text = con.getuserRank(userID);
                    lblKoySayisi.Text = con.getVillageCount(userID).ToString();
                    rep.DataSource = con.getrankings(1);
                    rep.DataBind();
                    rep1.DataSource = con.getuservillages(userID);
                    rep1.DataBind();
                }
            }
        }

        protected string FormatColorRow(string userName)
        {

            if (userName == Session["user"].ToString())
            {
                return "style=\"backGround-color:#E1C3AA\"";
            }
            {
                return "style='backGround-color:#F4E4BC'";
            }
        }

        protected void rep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string user = (e.Item.FindControl("lbProfil") as LinkButton).Text;
            Session["user"] = user;
            if (user == Session["KULLANICI"].ToString()) 
            {
                lbMesajYaz.Visible = false;
                lbArkadasEkle.Visible = false;
            }
            else
            {
                lbMesajYaz.Visible = true;
                lbArkadasEkle.Visible = true;
            }
            int userID = con.getuserID(user);
            lblUsername.Text = user;
            lblEposta.Text = con.getemail(user);
            lblPuan.Text = con.getuserPoint(userID).ToString();
            lblSiralama.Text = con.getuserRank(userID);
            lblKoySayisi.Text = con.getVillageCount(userID).ToString();
            rep1.DataSource = con.getuservillages(userID);
            rep1.DataBind();
        }

        protected void lbMesajYaz_Click(object sender, EventArgs e)
        {
            Session["send"] = lblUsername.Text;
            Response.Redirect("messages.aspx");
        }

        protected void rep1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string villageID = (e.Item.FindControl("id") as Label).Text;
            Session["mvID"] = villageID;
            Session["vID"] = villageID;
            string x = con.getvillageX(villageID);
            string y = con.getvillageY(villageID);
            Session["x"] = Aralik(Convert.ToInt32(x));
            Session["y"] = Aralik(Convert.ToInt32(y));
            Response.Redirect("map.aspx");
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
    }
}