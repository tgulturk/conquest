using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Conquest1
{
    public partial class market : System.Web.UI.Page
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
                string userID = con.getuserID(Session["KULLANICI"].ToString()).ToString();
                string villageID = Session["VillageID"].ToString();

                String lvl = con.getBuildingLevel(villageID, "12");

                if (lvl == "0")
                {
                    Response.Redirect("village.aspx");
                }

                if (!IsPostBack)
                {

                    if (Session["mX"] != null)
                    {
                        tbX.Text = Session["mX"].ToString();
                    }
                    if (Session["mY"] != null)
                    {
                        tbY.Text = Session["mY"].ToString();
                    }
                }
                
                DataTable dt = new DataTable();
                dt = con.PazarBilgi(villageID);
                lbltuccar.Text = dt.Rows[0]["durum"].ToString();
                Label6.Text = dt.Rows[0]["azami"].ToString();
                lbOdun.Text = lbKil.Text = lbDemir.Text = Label6.Text;
                rep1.DataSource = con.GidenMaden(villageID);
                rep1.DataBind();
                rep2.DataSource = con.GelenMaden(villageID);
                rep2.DataBind();
                rep3.DataSource = con.DonenMaden(villageID);
                rep3.DataBind();
            }
        }

        protected void tbOdun_TextChanged(object sender, EventArgs e)
        {
            int j = Convert.ToInt32(Label6.Text);
            int o = tbOdun.Text == "" ? 0 : Convert.ToInt32(tbOdun.Text);
            int k = tbKil.Text == "" ? 0 : Convert.ToInt32(tbKil.Text);
            int d = tbDemir.Text == "" ? 0 : Convert.ToInt32(tbDemir.Text);

            lbOdun.Text = lbKil.Text = lbDemir.Text = (j - (o + k + d)) < 0 ? "0" : (j - (o + k + d)).ToString();
            lbOdun.Text = lbKil.Text = lbDemir.Text = (j - (o + k + d)) > j ? j.ToString() : (j - (o + k + d)).ToString();
        }

        protected void tbKil_TextChanged(object sender, EventArgs e)
        {
            int j = Convert.ToInt32(Label6.Text);
            int o = tbOdun.Text == "" ? 0 : Convert.ToInt32(tbOdun.Text);
            int k = tbKil.Text == "" ? 0 : Convert.ToInt32(tbKil.Text);
            int d = tbDemir.Text == "" ? 0 : Convert.ToInt32(tbDemir.Text);

            lbOdun.Text = lbKil.Text = lbDemir.Text = (j - (o + k + d)) < 0 ? "0" : (j - (o + k + d)).ToString();
            lbOdun.Text = lbKil.Text = lbDemir.Text = (j - (o + k + d)) > j ? j.ToString() : (j - (o + k + d)).ToString();
        }

        protected void tbDemir_TextChanged(object sender, EventArgs e)
        {
            int j = Convert.ToInt32(Label6.Text);
            int o = tbOdun.Text == "" ? 0 : Convert.ToInt32(tbOdun.Text);
            int k = tbKil.Text == "" ? 0 : Convert.ToInt32(tbKil.Text);
            int d = tbDemir.Text == "" ? 0 : Convert.ToInt32(tbDemir.Text);

            lbOdun.Text = lbKil.Text = lbDemir.Text = (j - (o + k + d)) < 0 ? "0" : (j - (o + k + d)).ToString();
            lbOdun.Text = lbKil.Text = lbDemir.Text = (j - (o + k + d)) > j ? j.ToString() : (j - (o + k + d)).ToString();
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            String villageID = Session["VillageID"].ToString();
            DataTable dt = con.Madenler(villageID);

            int kil = tbKil.Text == "" ? 0 : Convert.ToInt32(tbKil.Text);
            int odun = tbOdun.Text == "" ? 0 : Convert.ToInt32(tbOdun.Text);
            int demir = tbDemir.Text == "" ? 0 : Convert.ToInt32(tbDemir.Text);

            if (odun <= Convert.ToInt32(dt.Rows[0]["Miktar"].ToString()) && odun >= 0 
                && kil <= Convert.ToInt32(dt.Rows[1]["Miktar"].ToString()) && kil >= 0 
                && demir <= Convert.ToInt32(dt.Rows[2]["Miktar"].ToString()) && demir >= 0)
            {
                int vID = con.getvillageID(tbX.Text, tbY.Text);

                if (vID!=-1)
                {
                    int x1 = Convert.ToInt32(tbX.Text);
                    int y1 = Convert.ToInt32(tbY.Text);
                    int x2 = Convert.ToInt32(con.getvillageX(villageID));
                    int y2 = Convert.ToInt32(con.getvillageY(villageID));
                    int x = Math.Abs(x1 - x2);
                    int y = Math.Abs(y1 - y2);
                    double toplam = odun + kil + demir;

                    if (x1 == x2 && y1 == y2)
                    {
                        lblHata.Text = "Aynı köye maden gönderemezsin.";
                        return;
                    }

                    int saniye = Convert.ToInt32(Math.Ceiling(Math.Sqrt((x * x) + (y * y))*90));
                    int mCount = Convert.ToInt32(Math.Ceiling(toplam / 1000));
                    int TSayi = con.getMerInVillage(villageID);
                    if (mCount <= TSayi)
                    {
                        String donen = con.MadenAzalt(villageID, kil.ToString(), odun.ToString(), demir.ToString());
                        String dönen = con.addMarketIslem(villageID, vID, kil, odun, demir, mCount, saniye);
                        Session["mX"] = null;
                        Session["mY"] = null;
                        Response.Redirect("market.aspx");
                    }
                    else
                    {
                        lblHata.Text = "Yetersiz Tüccar Sayısı";
                    }
                }
                else
                {
                    lblHata.Text = "Girilen Koordinatlar Geçersiz";
                }
            }
            else
            {
                lblHata.Text = "Girilen Madenler Hatalı";
            }
        }

        protected void rep1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            String islemID = (e.Item.FindControl("id") as Label).Text;
            String temp = con.DeleteMarketIslem(islemID);
        }
    }
}