using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data;
/*using System.Security.Cryptography.X509Certificates;
using System.Net.Security;*/

namespace Conquest1
{
    public partial class _default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KULLANICI"] != null)
            {
                Response.Redirect("village.aspx");
            }

            Panel_Modal_Forgot.Visible = false;
            lblhata.Text = "";
            DbConnection db = new DbConnection();
            rep.DataSource = db.news();
            rep.DataBind();
        }

        public string IP()
        {
            string ip = "";
            if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            {
                ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (!string.IsNullOrEmpty(ip))
                {
                    string[] ipRange = ip.Split(",".ToCharArray());
                    ip = ipRange[0];
                }
            }
            if (string.IsNullOrEmpty(ip))
                if (HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] != null)
                    ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            ip = ip.Trim();
            return ip;
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            DbConnection db = new DbConnection();
            String username = tbUsername.Text;
            String password = tbPassword.Text;
            String kontrol = db.loginvalid(username, password);

            if (kontrol == "0")
            {
                lblhata.Text = "Bilgiler Hatalı";
            }
            else if (kontrol == "1")
            {
                lblhata.Text = "Giris Basarili";
                Session["KULLANICI"] = username;
                Session["vi"] = 0;
                db.addLoginLog(username,IP());
                int userID = db.getuserID(username);
                int villageID = db.getfirstvillageid(username);
                if (villageID == 0)
                {
                    String dönen = db.addvillage(userID);
                    villageID = db.getfirstvillageid(username);
                }
                Session["VillageID"] = villageID;
                String temp = db.BinaKontrolProc();
                Response.Redirect("village.aspx");
            }
            else
            {
                lblhata.Text = "Sistem Hatası";
            }
            
            
        }

        protected void btnButton1_Click(object sender, EventArgs e)
        {
            DbConnection db = new DbConnection();
            String mailaddress = tbMail.Text;
            String kontrol = db.mailvalid(mailaddress);

            if (kontrol == "1")
            {
                
                String sifre = db.getmailpassword(mailaddress);
                String userName = db.getmailusername(mailaddress);
                SmtpClient istemci = new SmtpClient("mail.conquestgame.tk", 26);
                istemci.EnableSsl = false;
                NetworkCredential cred = new NetworkCredential("noreply@conquestgame.tk", "conquest1991");
                istemci.Credentials = cred;
                //ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
                istemci.Send("noreply@conquestgame.tk", mailaddress, "Kullanıcı Adı: "+userName+"  Conquest Şifreniz", "Şifreniz: " + sifre);
            }

            Panel_Modal_Forgot.Visible = false;
            tbMail.Text = "";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Panel_Modal_Forgot.Visible = true;
        }

        protected void btnPIptal_Click(object sender, EventArgs e)
        {
            Panel_Modal_Forgot.Visible = false;
        }
    }
}