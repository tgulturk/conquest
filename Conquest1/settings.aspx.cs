using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Conquest1
{
    public partial class settings : System.Web.UI.Page
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
                    Menu1.Items[0].Selected = true;
                    lblUsername.Text = Session["KULLANICI"].ToString();
                    lblEposta.Text = con.getemail(Session["KULLANICI"].ToString());
                    int userID = con.getuserID(Session["KULLANICI"].ToString());
                    lblKoySayisi.Text = con.getVillageCount(userID).ToString();
                    lblPuan.Text = con.getuserPoint(userID).ToString();
                    lblSiralama.Text = con.getuserRank(userID).ToString();
                }
            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            String password = tbPassword.Text;
            String mail = tbEposta.Text;
            String kontrol = con.loginvalid(Session["KULLANICI"].ToString(), password);

            if (kontrol == "0")
            {
                lblhata.Text = "Yanlış Şifre Girdiniz";
            }
            else if (kontrol == "1")
            {
                try
                {                    
                    String temp = con.mailvalid(mail);
                    if (temp == "0")
                    {
                        con.setemail(mail, Session["KULLANICI"].ToString());
                        tbEposta.Text = "";
                        tbEpostatekrar.Text = "";
                        tbPassword.Text = "";
                        lblhata.Text = "E-Posta Adresi Değiştirildi.";
                    }
                    else
                    {
                        lblhata.Text = "Bu E-Posta Sistemde Mevcut";
                    }
                }
                catch 
                {
                    lblhata.Text = "E-Posta Değiştirilemedi";
                }
            }
            else
            {
                lblhata.Text = "Sistem Hatası";
            }
        }

        protected void btnKaydetP_Click(object sender, EventArgs e)
        {
            String password = tbPassword2.Text;
            String kontrol = con.loginvalid(Session["KULLANICI"].ToString(), password);

            if (kontrol == "0")
            {
                lblhataP.Text = "Yanlış Şifre Girdiniz";
            }
            else if (kontrol == "1")
            {
                if (tbNewPassword.Text.Length < 6) lblhataP.Text = "Şifre En Az 6 Karakter Olmalı";
                else
                {
                    try
                    {
                        con.changepassword(Session["KULLANICI"].ToString(), tbNewPassword.Text);
                        tbNewPassword.Text = "";
                        tbNewPassAgain.Text = "";
                        tbPassword2.Text = "";
                        lblhataP.Text = "Şifre Değiştirildi.";
                    }
                    catch
                    {
                        lblhataP.Text = "Şifre Değiştirilemedi";
                    }
                }
            }
            else
            {
                lblhataP.Text = "Sistem Hatası";
            }
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            string text = e.Item.Text;
            switch (text)
            {
                case "Profil Bilgileri":
                    lblUsername.Text = Session["KULLANICI"].ToString();
                    lblEposta.Text = con.getemail(Session["KULLANICI"].ToString());
                    int userID = con.getuserID(Session["KULLANICI"].ToString());
                    lblKoySayisi.Text = con.getVillageCount(userID).ToString();
                    lblPuan.Text = con.getuserPoint(userID).ToString();
                    lblSiralama.Text = con.getuserRank(userID).ToString();
                    MultiView1.ActiveViewIndex = 0;
                    break;
                case "EPosta Adresi":
                    tbEposta.Text = "";
                    tbEpostatekrar.Text = "";
                    tbPassword.Text = "";
                    lblhata.Text = "";
                    MultiView1.ActiveViewIndex = 5;
                    break;
                case "Şifreyi Değiştir":
                    tbNewPassAgain.Text = "";
                    tbNewPassword.Text = "";
                    tbPassword2.Text = "";
                    lblhataP.Text = "";
                    MultiView1.ActiveViewIndex = 1;
                    break;
                case "Baştan Başla":
                    MultiView1.ActiveViewIndex = 2;
                    break;
                case "Hesabı Sil":
                    MultiView1.ActiveViewIndex = 3;
                    break;
                case "Girişler":
                    MultiView1.ActiveViewIndex = 4;
                    int uID = con.getuserID(Session["KULLANICI"].ToString());
                    rep.DataSource = con.getlast10login(uID);
                    rep.DataBind();
                    
                    break;
            }
        }
    }
}