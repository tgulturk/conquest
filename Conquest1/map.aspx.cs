using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Conquest1
{
    public partial class map : System.Web.UI.Page
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
                    string userID = con.getuserID(Session["KULLANICI"].ToString()).ToString();
                    string villageID = Session["VillageID"].ToString();
                    HaritaCiz();

                    string vID = Session["vID"].ToString();
                    string uID = con.getvillageuserID(vID);
                    lblVillageName.Text = con.getvillagename(vID);
                    lbUsername.Text = con.getUsername(uID);
                    lblPuan.Text = con.getvillagePoint(vID).ToString();
                    lblCoordinates.Text = con.getvillagecoordinates(vID);

                    if (vID != villageID)
                    {
                        lbSendResources.Visible = true;
                        lbSendTroops.Visible = true;
                    }
                    else
                    {
                        lbSendResources.Visible = false;
                        lbSendTroops.Visible = false;
                    }
                }

            }
        }

        public string ReturnImage(String vID)
        {
            if (vID == "0") return "images/gras1.png";
            else
            {
                string uID = con.getvillageuserID(vID);
                if (uID == "1") return "images/bandit.png";
                else return "images/vimage.png";
            }             
        }

        protected void HaritaCiz()
        {
            int x = Convert.ToInt32(Session["x"].ToString());
            int y = Convert.ToInt32(Session["y"].ToString());
            rep.DataSource = con.Maps(x, y);
            rep.DataBind();
            Duzenle();
            Kontrol();
        }

        protected void ibalt_Click(object sender, ImageClickEventArgs e)
        {
            Session["y"] = Convert.ToInt32(Session["y"].ToString()) + 10;
            HaritaCiz();
        }

        protected void ibust_Click(object sender, ImageClickEventArgs e)
        {
            Session["y"] = Convert.ToInt32(Session["y"].ToString()) - 10;
            HaritaCiz();
        }

        protected void ibsag_Click(object sender, ImageClickEventArgs e)
        {
            Session["x"] = Convert.ToInt32(Session["x"].ToString()) + 10;
            HaritaCiz();
        }

        protected void ibsol_Click(object sender, ImageClickEventArgs e)
        {
            Session["x"] = Convert.ToInt32(Session["x"].ToString()) - 10;
            HaritaCiz();
        }

        protected void Kontrol()
        {
            int x = Convert.ToInt32(Session["x"].ToString());
            int y = Convert.ToInt32(Session["y"].ToString());

            if (y > 39)
            {
                ibalt.Visible = false;
                ibust.Visible = true;
            }
            else ibalt.Visible = true;

            if (y < 10)
            {
                ibust.Visible = false;
                ibalt.Visible = true;
            }
            else ibust.Visible = true;

            if (x > 39)
            { 
                ibsag.Visible = false;
                ibsol.Visible = true;
            }
            else ibsag.Visible = true;

            if (x < 10) 
            { 
                ibsol.Visible = false;
                ibsag.Visible = true;
            }
            else ibsol.Visible = true;
        }

        protected void Duzenle()
        {
            int a = Convert.ToInt32(Session["x"].ToString());
            int b = Convert.ToInt32(Session["y"].ToString());
            lbl1.Text = a.ToString();
            lbl2.Text = (a + 1).ToString();
            lbl3.Text = (a + 2).ToString();
            lbl4.Text = (a + 3).ToString();
            lbl5.Text = (a + 4).ToString();
            lbl6.Text = (a + 5).ToString();
            lbl7.Text = (a + 6).ToString();
            lbl8.Text = (a + 7).ToString();
            lbl9.Text = (a + 8).ToString();
            lbl10.Text = (a + 9).ToString();

            Label1.Text = b.ToString();
            Label2.Text = (b + 1).ToString();
            Label3.Text = (b + 2).ToString();
            Label4.Text = (b + 3).ToString();
            Label5.Text = (b + 4).ToString();
            Label6.Text = (b + 5).ToString();
            Label7.Text = (b + 6).ToString();
            Label8.Text = (b + 7).ToString();
            Label9.Text = (b + 8).ToString();
            Label10.Text = (b + 9).ToString();
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

        protected string BackColor(string vID)
        {
            string villageID = Session["VillageID"].ToString();

            if (vID == villageID)
                return "style=\"max-width:51px; max-height:36px; min-width:51px; min-height:36px; float:left; border:1px solid grey; background-color:White;\"";

            else if(vID!="0")
                return "style=\"max-width:51px; max-height:36px; min-width:51px; min-height:36px; float:left; border:1px solid grey; background-color:Red;\"";
            
            else
                return "style=\"max-width:51px; max-height:36px; min-width:51px; min-height:36px; float:left; border:1px solid grey;\""; 
        }

        protected string Cursor(string vID)
        {
            if (vID == "0") return "cursor:default";
            else return "cursor:pointer";
        }

        protected void rep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string vID = (e.Item.FindControl("vID") as Label).Text;
            string uID = con.getvillageuserID(vID);
            Session["mvID"] = vID;

            lblVillageName.Text = con.getvillagename(vID);
            lbUsername.Text = con.getUsername(uID);
            lblPuan.Text = con.getvillagePoint(vID).ToString();
            lblCoordinates.Text = con.getvillagecoordinates(vID);

            string villageID = Session["VillageID"].ToString();

            if (vID != villageID)
            {
                lbSendResources.Visible = true;
                lbSendTroops.Visible = true;
            }
            else
            {
                lbSendResources.Visible = false;
                lbSendTroops.Visible = false;
            }
        }

        protected void lbUsername_Click(object sender, EventArgs e)
        {
            Session["user"] = lbUsername.Text;
            Response.Redirect("rankings.aspx");
        }

        protected void lbSendResources_Click(object sender, EventArgs e)
        {
            String vID = Session["mvID"].ToString();
            Session["sX"] = con.getvillageX(vID);
            Session["sY"] = con.getvillageY(vID);
            Response.Redirect("market.aspx");
        }

        protected void lbSendTroops_Click(object sender, EventArgs e)
        {
            String vID = Session["mvID"].ToString();
            Session["sX"] = con.getvillageX(vID);
            Session["sY"] = con.getvillageY(vID);
            Response.Redirect("commandcenter.aspx");
        }
    }
}