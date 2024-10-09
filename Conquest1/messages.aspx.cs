using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Conquest1
{
    public partial class messages : System.Web.UI.Page
    {
        DbConnection con = new DbConnection();
        int viewindex;
        string messageid;
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
                    if (Session["vi"] != null) viewindex = Convert.ToInt32(Session["vi"].ToString());
                    if (Session["mID"] != null) messageid = Session["mID"].ToString();
                    if (Session["send"] != null)
                    {
                        btnforward.Visible = false;
                        btngiveback.Visible = false;
                        btngiveback2.Visible = false;
                        btnreply.Visible = false;
                        btnSil2.Visible = false;
                        btnSil.Visible = false;
                        tbsendto.Text = Session["send"].ToString();
                        MultiView1.ActiveViewIndex = 2;
                    }
                    else
                    {
                        lblKisi.Text = "Gönderen";
                        btnforward.Visible = false;
                        btngiveback.Visible = false;
                        btnreply.Visible = false;
                        rep.DataSource = con.inbox(Session["KULLANICI"].ToString());
                        rep.DataBind();
                        Menu1.Items[1].Selected = true;
                    }
                }
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            string text = e.Item.Text;
            
            switch (text)
            {
                case "Gelen Kutusu":
                    MultiView1.ActiveViewIndex = 0;
                    viewindex = 0;
                    Session["vi"] = 0;
                    btnforward.Visible = false;
                    btngiveback.Visible = false;
                    btngiveback2.Visible = false;
                    btnreply.Visible = false;
                    btnSil2.Visible = false;
                    btnSil.Visible = true;
                    lblKisi.Text = "Gönderen";
                    rep.DataSource = con.inbox(Session["KULLANICI"].ToString());
                    rep.DataBind();
                    break;
                case "Giden Kutusu":
                    MultiView1.ActiveViewIndex = 0;
                    viewindex = 1;
                    Session["vi"] = 1;
                    btnforward.Visible = false;
                    btngiveback.Visible = false;
                    btngiveback2.Visible = false;
                    btnreply.Visible = false;
                    btnSil2.Visible = false;
                    btnSil.Visible = true;
                    lblKisi.Text = "Alan";
                    rep.DataSource = con.outbox(Session["KULLANICI"].ToString());
                    rep.DataBind();
                    break;
                case "Çöp Kutusu":
                    MultiView1.ActiveViewIndex = 0;
                    viewindex = 2;
                    Session["vi"] = 2;
                    btnforward.Visible = false;
                    btngiveback.Visible = false;
                    btngiveback2.Visible = true;
                    btnreply.Visible = false;
                    btnSil2.Visible = false;
                    btnSil.Visible = true;
                    lblKisi.Text = "Gönderen";
                    rep.DataSource = con.trashcan(Session["KULLANICI"].ToString());
                    rep.DataBind();
                    break;
                case "Mesaj Yaz":
                    btnforward.Visible = false;
                    btngiveback.Visible = false;
                    btngiveback2.Visible = false;
                    btnreply.Visible = false;
                    btnSil2.Visible = false;
                    btnSil.Visible = false;
                    MultiView1.ActiveViewIndex = 2;
                    break;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                viewindex = Convert.ToInt32(Session["vi"].ToString());
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
                        if (viewindex == 0) con.deletemail((rep.Items[i].FindControl("id") as Label).Text);
                        else if (viewindex == 1) con.sendendeletemail((rep.Items[i].FindControl("id") as Label).Text);
                        else if (viewindex == 2) con.permdeletemail((rep.Items[i].FindControl("id") as Label).Text);

                    }

                }
            }

            switch (viewindex)
            {
                case 0:
                    rep.DataSource = con.inbox(Session["KULLANICI"].ToString());
                    rep.DataBind();
                    break;
                case 1:
                    rep.DataSource = con.outbox(Session["KULLANICI"].ToString());
                    rep.DataBind();
                    break;
                case 2:
                    rep.DataSource = con.trashcan(Session["KULLANICI"].ToString());
                    rep.DataBind();
                    break;
            }
        }

        protected void rep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            messageid = (e.Item.FindControl("id") as Label).Text;
            Session["mID"] = messageid;

            string kimden = con.getsendername(messageid);
            string konu = con.getsubject(messageid);
            string mail = con.getmail(messageid);

            if (viewindex == 0) con.setreaded(messageid);

            else if (viewindex == 1) btnreply.Visible = false;

            else if (viewindex == 2)
            {
                btngiveback.Visible = true;
            }

            lblkimden.Text = kimden;
            lblkonu.Text = konu;
            tbmail.Text = mail;

            if (lblkimden.Text == "###BOŞ DÖNDÜ###" && lblkonu.Text == "###BOŞ DÖNDÜ###" && tbmail.Text == "###BOŞ DÖNDÜ###")
            {
                MultiView1.ActiveViewIndex = 0;
            }
            if (Session["vi"] != null) viewindex = Convert.ToInt32(Session["vi"].ToString());
            if (viewindex == 0)
            {
                btnforward.Visible = true;
                btngiveback.Visible = false;
                btngiveback2.Visible = false;
                btnreply.Visible = true;
                btnSil2.Visible = true;
                btnSil.Visible = false;
            }
            else if (viewindex == 1)
            {
                btnforward.Visible = false;
                btngiveback.Visible = false;
                btngiveback2.Visible = false;
                btnreply.Visible = false;
                btnSil2.Visible = true;
                btnSil.Visible = false;
            }
            else if (viewindex == 2)
            {
                btnforward.Visible = false;
                btngiveback.Visible = true;
                btngiveback2.Visible = false;
                btnreply.Visible = false;
                btnSil2.Visible = true;
                btnSil.Visible = false;
            }

            MultiView1.ActiveViewIndex = 1;
        }

        protected void btngiveback_Click(object sender, EventArgs e)
        {
            con.undeletemail(Session["mID"].ToString());
            MultiView1.ActiveViewIndex = 0;
            rep.DataSource = con.trashcan(Session["KULLANICI"].ToString());
            rep.DataBind();
            viewindex = 2;
            Session["vi"] = 2;
        }

        protected void btnreply_Click(object sender, EventArgs e)
        {
            btnforward.Visible = false;
            btngiveback.Visible = false;
            btngiveback2.Visible = false;
            btnreply.Visible = false;
            btnSil2.Visible = false;
            btnSil.Visible = false;
            tbsendto.Text = lblkimden.Text;
            tbsubject.Text = "[RE:] " + lblkonu.Text;
            MultiView1.ActiveViewIndex = 2;
        }

        protected void btnforward_Click(object sender, EventArgs e)
        {
            btnforward.Visible = false;
            btngiveback.Visible = false;
            btngiveback2.Visible = false;
            btnreply.Visible = false;
            btnSil2.Visible = false;
            btnSil.Visible = false;
            tbsubject.Text = "[FWD:] " + lblkonu.Text;
            tbSendMessage.Text = tbmail.Text;
            MultiView1.ActiveViewIndex = 2;
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {
            if (MultiView1.ActiveViewIndex == 0)
            {
                try
                {
                    if (Session["vi"] != null) viewindex = Convert.ToInt32(Session["vi"].ToString());
                    if (viewindex == 0)
                    {
                        btnforward.Visible = false;
                        btngiveback.Visible = false;
                        btngiveback2.Visible = false;
                        btnreply.Visible = false;
                        btnSil2.Visible = false;
                        btnSil.Visible = true;
                        rep.DataSource = con.inbox(Session["KULLANICI"].ToString());
                        rep.DataBind();
                    }
                    else if (viewindex == 1)
                    {
                        btnforward.Visible = false;
                        btngiveback.Visible = false;
                        btngiveback2.Visible = false;
                        btnreply.Visible = false;
                        btnSil2.Visible = false;
                        btnSil.Visible = true;
                        rep.DataSource = con.outbox(Session["KULLANICI"].ToString());
                        rep.DataBind();
                    }
                    else if (viewindex == 2)
                    {
                        btnforward.Visible = false;
                        btngiveback.Visible = false;
                        btngiveback2.Visible = true;
                        btnreply.Visible = false;
                        btnSil2.Visible = false;
                        btnSil.Visible = false;
                        rep.DataSource = con.trashcan(Session["KULLANICI"].ToString());
                        rep.DataBind();
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("default.aspx");
                }
            }
            else if (MultiView1.ActiveViewIndex == 1) 
            {
                if (Session["vi"] != null) viewindex = Convert.ToInt32(Session["vi"].ToString());
                if (viewindex == 0)
                {
                    btnforward.Visible = true;
                    btngiveback.Visible = false;
                    btngiveback2.Visible = false;
                    btnreply.Visible = true;
                    btnSil2.Visible = true;
                    btnSil.Visible = false;
                    rep.DataSource = con.inbox(Session["KULLANICI"].ToString());
                    rep.DataBind();
                }
                else if (viewindex == 1)
                {
                    btnforward.Visible = false;
                    btngiveback.Visible = false;
                    btngiveback2.Visible = false;
                    btnreply.Visible = false;
                    btnSil2.Visible = true;
                    btnSil.Visible = false;
                    rep.DataSource = con.outbox(Session["KULLANICI"].ToString());
                    rep.DataBind();
                }
                else if (viewindex == 2)
                {
                    btnforward.Visible = false;
                    btngiveback.Visible = true;
                    btngiveback2.Visible = false;
                    btnreply.Visible = false;
                    btnSil2.Visible = true;
                    btnSil.Visible = false;
                    rep.DataSource = con.trashcan(Session["KULLANICI"].ToString());
                    rep.DataBind();
                }
                
            }
        }

        protected void btnSil2_Click(object sender, EventArgs e)
        {
            if (viewindex == 0) con.deletemail(Session["mID"].ToString());
            else if (viewindex == 1) con.sendendeletemail(Session["mID"].ToString());
            else if (viewindex == 2) con.permdeletemail(Session["mID"].ToString());

            MultiView1.ActiveViewIndex = 0;
        }

        protected void btngiveback2_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < rep.Items.Count; i++)
            {
                if ((rep.Items[i].FindControl("cb") is CheckBox))
                {
                    if ((rep.Items[i].FindControl("cb") as CheckBox).Checked)
                    {
                        con.undeletemail((rep.Items[i].FindControl("id") as Label).Text);
                    }

                }
            }
            if (Session["vi"] != null) viewindex = Convert.ToInt32(Session["vi"].ToString());
            switch (viewindex)
            {
                case 0:
                    rep.DataSource = con.inbox(Session["KULLANICI"].ToString());
                    rep.DataBind();
                    break;
                case 1:
                    rep.DataSource = con.outbox(Session["KULLANICI"].ToString());
                    rep.DataBind();
                    break;
                case 2:
                    rep.DataSource = con.trashcan(Session["KULLANICI"].ToString());
                    rep.DataBind();
                    break;
            }
        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            String kontrol = con.usernamevalid(tbsendto.Text);

            if (kontrol == "1")
            {
                int senderID = con.getuserID(Session["KULLANICI"].ToString());
                int getterID = con.getuserID(tbsendto.Text);
                con.sendmail(senderID, getterID, tbsubject.Text, tbSendMessage.Text);
                tbSendMessage.Text = "";
                tbsendto.Text = "";
                tbsubject.Text = "";
                lblhata.Text = "Mesaj Gönderildi";

            }
            else if (kontrol == "0")
            {

                lblhata.Visible = true;
            }
            else
            {
                lblhata.Text = kontrol;
                lblhata.Visible = true;
            }
        }

        protected string FormatColorRow(string okundumu)
        {
            try
            {
                if (okundumu == "0" && Session["vi"].ToString() == "0")
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
    }
}