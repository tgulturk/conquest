using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Conquest1
{
    public partial class register : System.Web.UI.Page
    {
        DbConnection db = new DbConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblhata.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (tbPassword.Text != tbPasswordAgain.Text)
            {
                lblhata.Text = "Parolalar Eşleşmiyor";
                lblhata.Visible = true;
            }

            else if (tbPassword.Text.Length < 6)
            {
                lblhata.Text = "Minimum 6 karakter";
                lblhata.Visible = true;
            }

            else
            {
                String kontrol = db.usernamevalid(tbUsername.Text);
                String mailkontrol = db.mailvalid(tbEmail.Text);
                if (kontrol == "0" && mailkontrol=="0")
                {
                    String kontrol2 = db.adduser(tbUsername.Text, tbPassword.Text, tbEmail.Text);
                    
                    if (kontrol2 == "1") { Response.Redirect("default.aspx"); /*Response.Write("Hesabınız Oluşturuldu");*/ }
                    else
                    {
                        lblhata.Text = kontrol2;
                        lblhata.Visible = true;
                    }
                }
                else if (kontrol == "1")
                {
                    lblhata.Text = "Kullanıcı Adı Kullanımda";
                    lblhata.Visible = true;
                }
                else if (mailkontrol == "1")
                {
                    lblhata.Text = "Mail Adresi Kullanımda";
                }
                else
                {
                    lblhata.Text = kontrol;
                    lblhata.Visible = true;
                }
            }
            
        }
    }
}