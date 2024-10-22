using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Runtime.InteropServices;

namespace Conquest1
{
    public partial class report : System.Web.UI.Page
    {
        DbConnection con = new DbConnection();
        int viewindex;
        public string reportid, userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KULLANICI"] == null)
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                userID = con.getuserID(Session["KULLANICI"].ToString()).ToString();
                if (!IsPostBack)
                {
                    if (Session["rvi"] != null) viewindex = Convert.ToInt32(Session["rvi"].ToString());
                    else Session["rvi"] = 0;
                    if (Session["rID"] != null) reportid = Session["rID"].ToString();

                    rep.DataSource = con.SaldırıRapor(userID);
                    rep.DataBind();
                    Menu1.Items[0].Selected = true;

                }
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            string text = e.Item.Text;
            btnSil.Visible = true;
            btnOkundu.Visible = true;

            switch (text)
            {
                case "Saldırı":
                    MultiView1.ActiveViewIndex = 0;
                    viewindex = 0;
                    Session["rvi"] = 0;
                    rep.DataSource = con.SaldırıRapor(userID);
                    rep.DataBind();
                    break;
                case "Savunma":
                    MultiView1.ActiveViewIndex = 0;
                    viewindex = 1;
                    Session["rvi"] = 1;
                    rep.DataSource = con.SavunmaRapor(userID);
                    rep.DataBind();
                    break;
                case "Ticaret":
                    MultiView1.ActiveViewIndex = 0;
                    viewindex = 2;
                    Session["rvi"] = 2;
                    rep.DataSource = con.MadenRapor(userID);
                    rep.DataBind();
                    break;
            }
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {
            if (MultiView1.ActiveViewIndex == 0)
            {
                try
                {
                    if (Session["rvi"] != null) viewindex = Convert.ToInt32(Session["rvi"].ToString());
                    if (viewindex == 0)
                    {
                        rep.DataSource = con.SaldırıRapor(userID);
                        rep.DataBind();
                    }
                    else if (viewindex == 1)
                    {
                        rep.DataSource = con.SavunmaRapor(userID);
                        rep.DataBind();
                    }
                    else if (viewindex == 2)
                    {
                        rep.DataSource = con.MadenRapor(userID);
                        rep.DataBind();
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("default.aspx");
                }
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            try
            {
                viewindex = Convert.ToInt32(Session["rvi"].ToString());
            }
            catch
            {
                viewindex = 0;
            }
            for (int i = 0; i < rep.Items.Count; i++)
            {
                if ((rep.Items[i].FindControl("cb") is CheckBox))
                {
                    if ((rep.Items[i].FindControl("cb") as CheckBox).Checked)
                    {
                        if (viewindex == 0) con.deleteSaldırıReport((rep.Items[i].FindControl("id") as Label).Text);
                        else if (viewindex == 1) con.deleteSavunmaReport((rep.Items[i].FindControl("id") as Label).Text);
                        else if (viewindex == 2) con.deleteMadenReport((rep.Items[i].FindControl("id") as Label).Text,userID);

                    }

                }
            }

            switch (viewindex)
            {
                case 0:
                    rep.DataSource = con.SaldırıRapor(userID);
                    rep.DataBind();
                    break;
                case 1:
                    rep.DataSource = con.SavunmaRapor(userID);
                    rep.DataBind();
                    break;
                case 2:
                    rep.DataSource = con.MadenRapor(userID);
                    rep.DataBind();
                    break;
            }
        }

        protected string FormatColorRow(string okundumu)
        {
            try
            {
                if (okundumu == "0")
                {
                    return "style=\"backGround-color:#E1C3AA\"";
                }
                else
                {
                    return "style='backGround-color:transparent'";
                }
            }
            catch
            {
                return "style='backGround-color:transparent'";
            }
        }

        protected void rep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            reportid = (e.Item.FindControl("id") as Label).Text;
            Session["rID"] = reportid;
            viewindex = Convert.ToInt32(Session["rvi"].ToString());

            if (viewindex == 0) con.setSaldirirepreaded(reportid);
            else if (viewindex == 1) con.setSavunmarepreaded(reportid);

            btnSil.Visible = false;
            btnOkundu.Visible = false;

            if (viewindex==0 || viewindex==1)
            {
                lblRkonu.Text = (e.Item.FindControl("lbMessage") as LinkButton).Text;
                DataTable dt = con.RaporIcerik(reportid);
                lblSonuc.Text = dt.Rows[0]["winner"].ToString();
                lblRtarih.Text = dt.Rows[0]["senddate"].ToString();
                lbRgonderen.Text = dt.Rows[0]["userName"].ToString();
                lbRgkoy.Text = dt.Rows[0]["vName"].ToString() + "(" + dt.Rows[0]["vACoordinate"].ToString() + ")";
                lbRalici.Text = dt.Rows[0]["userName2"].ToString();
                lbRakoy.Text = dt.Rows[0]["vName2"].ToString() + "(" + dt.Rows[0]["vDCoordinate"].ToString() + ")";
                lblBdurum.Text = dt.Rows[0]["durum"].ToString();
                lblRodun.Text = dt.Rows[0]["odun"].ToString();
                lblRkil.Text = dt.Rows[0]["kil"].ToString();
                lblRdemir.Text = dt.Rows[0]["demir"].ToString();
                lblCodun.Text = dt.Rows[0]["wodun"].ToString();
                lblCkil.Text = dt.Rows[0]["wkil"].ToString();
                lblCdemir.Text = dt.Rows[0]["wdemir"].ToString();
                lblCduvar.Text = dt.Rows[0]["walllevel"].ToString();

                Session["vACoordinate"] = dt.Rows[0]["vACoordinate"].ToString();
                Session["vDCoordinate"] = dt.Rows[0]["vDCoordinate"].ToString();

                DataTable dt2 = con.RaporOrduIcerik(reportid);
                lblSMmizrak.Text = dt2.Rows[0]["sCount"].ToString();
                lblSKmizrak.Text = dt2.Rows[0]["skCount"].ToString();
                lblDMmizrak.Text = dt2.Rows[0]["dCount"].ToString();
                lblDKmizrak.Text = dt2.Rows[0]["dkCount"].ToString();
                lblSMkilic.Text = dt2.Rows[1]["sCount"].ToString();
                lblSKkilic.Text = dt2.Rows[1]["skCount"].ToString();
                lblDMkilic.Text = dt2.Rows[1]["dCount"].ToString();
                lblDKkilic.Text = dt2.Rows[1]["dkCount"].ToString();
                lblSMbaltaci.Text = dt2.Rows[2]["sCount"].ToString();
                lblSKbaltaci.Text = dt2.Rows[2]["skCount"].ToString();
                lblDMbaltaci.Text = dt2.Rows[2]["dCount"].ToString();
                lblDKbaltaci.Text = dt2.Rows[2]["dkCount"].ToString();
                lblSMcasus.Text = dt2.Rows[3]["sCount"].ToString();
                lblSKcasus.Text = dt2.Rows[3]["skCount"].ToString();
                lblDMcasus.Text = dt2.Rows[3]["dCount"].ToString();
                lblDKcasus.Text = dt2.Rows[3]["dkCount"].ToString();
                lblSMhafif.Text = dt2.Rows[4]["sCount"].ToString();
                lblSKhafif.Text = dt2.Rows[4]["skCount"].ToString();
                lblDMhafif.Text = dt2.Rows[4]["dCount"].ToString();
                lblDKhafif.Text = dt2.Rows[4]["dkCount"].ToString();
                lblSMagir.Text = dt2.Rows[5]["sCount"].ToString();
                lblSKagir.Text = dt2.Rows[5]["skCount"].ToString();
                lblDMagir.Text = dt2.Rows[5]["dCount"].ToString();
                lblDKagir.Text = dt2.Rows[5]["dkCount"].ToString();
                lblSMmisyoner.Text = dt2.Rows[6]["sCount"].ToString();
                lblSKmisyoner.Text = dt2.Rows[6]["skCount"].ToString();
                lblDMmisyoner.Text = dt2.Rows[6]["dCount"].ToString();
                lblDKmisyoner.Text = dt2.Rows[6]["dkCount"].ToString();
                MultiView1.ActiveViewIndex = 2;
            }
            else
            {
                lblkonu.Text = (e.Item.FindControl("lbMessage") as LinkButton).Text;
                DataTable dt = con.MadenRaporIcerik(reportid);
                lbltarih.Text = dt.Rows[0]["senddate"].ToString();
                lblOdun.Text = dt.Rows[0]["odun"].ToString();
                lblKil.Text = dt.Rows[0]["kil"].ToString();
                lblDemir.Text = dt.Rows[0]["demir"].ToString();
                lbGonderen.Text = dt.Rows[0]["GonU"].ToString();
                lbKoy.Text = dt.Rows[0]["GonV"].ToString();
                lbAlici.Text = dt.Rows[0]["AlU"].ToString();
                lblAköy.Text = dt.Rows[0]["AlV"].ToString();
                MultiView1.ActiveViewIndex = 1;
            }

            if (Session["rvi"] != null) viewindex = Convert.ToInt32(Session["rvi"].ToString());
        }

        protected void lbKoy_Click(object sender, EventArgs e)
        {
            String vID = con.getvillageID(lbKoy.Text).ToString();
            Session["vID"] = vID;
            string x = con.getvillageX(vID);
            string y = con.getvillageY(vID);
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

        protected void lblAköy_Click(object sender, EventArgs e)
        {
            String vID = con.getvillageID(lblAköy.Text).ToString();
            Session["vID"] = vID;
            string x = con.getvillageX(vID);
            string y = con.getvillageY(vID);
            Session["x"] = Aralik(Convert.ToInt32(x));
            Session["y"] = Aralik(Convert.ToInt32(y));
            Response.Redirect("map.aspx");
        }

        protected void lbGonderen_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(lbGonderen.Text))
            {
                return;
            }

            Session["user"] = lbGonderen.Text;
            Response.Redirect("rankings.aspx");
        }

        protected void lbAlici_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(lbAlici.Text))
            {
                return;
            }

            Session["user"] = lbAlici.Text;
            Response.Redirect("rankings.aspx");
        }

        protected void lbRgonderen_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(lbRgonderen.Text))
            {
                return;
            }

            Session["user"] = lbRgonderen.Text;
            Response.Redirect("rankings.aspx");
        }

        protected void lbRgkoy_Click(object sender, EventArgs e)
        {
            var coordinate = Session["vACoordinate"].ToString().Split('|');
            string vID = con.getvillageID(Convert.ToInt32(coordinate[0]), Convert.ToInt32(coordinate[1])).ToString();
            Session["vID"] = vID;
            Session["mvID"] = vID;
            Session["x"] = Aralik(Convert.ToInt32(coordinate[0]));
            Session["y"] = Aralik(Convert.ToInt32(coordinate[1]));
            Response.Redirect("map.aspx");
        }

        protected void lbRalici_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(lbRalici.Text))
            {
                return;
            }

            Session["user"] = lbRalici.Text;
            Response.Redirect("rankings.aspx");
        }

        protected void lbRakoy_Click(object sender, EventArgs e)
        {
            var coordinate = Session["vDCoordinate"].ToString().Split('|');
            string vID = con.getvillageID(Convert.ToInt32(coordinate[0]), Convert.ToInt32(coordinate[1])).ToString();
            Session["vID"] = vID;
            Session["mvID"] = vID; 
            Session["x"] = Aralik(Convert.ToInt32(coordinate[0]));
            Session["y"] = Aralik(Convert.ToInt32(coordinate[1]));
            Response.Redirect("map.aspx");
        }

        protected void btnOkundu_Click(object sender, EventArgs e)
        {
            try
            {
                viewindex = Convert.ToInt32(Session["rvi"].ToString());
            }
            catch
            {
                viewindex = 0;
            }
            for (int i = 0; i < rep.Items.Count; i++)
            {
                if ((rep.Items[i].FindControl("cb") is CheckBox))
                {
                    if ((rep.Items[i].FindControl("cb") as CheckBox).Checked)
                    {
                        if (viewindex == 0) con.setSaldirirepreaded((rep.Items[i].FindControl("id") as Label).Text);
                        else if (viewindex == 1) con.setSavunmarepreaded((rep.Items[i].FindControl("id") as Label).Text);

                    }

                }
            }

            switch (viewindex)
            {
                case 0:
                    rep.DataSource = con.SaldırıRapor(userID);
                    rep.DataBind();
                    break;
                case 1:
                    rep.DataSource = con.SavunmaRapor(userID);
                    rep.DataBind();
                    break;
                case 2:
                    rep.DataSource = con.MadenRapor(userID);
                    rep.DataBind();
                    break;
            }
        }
    }
}