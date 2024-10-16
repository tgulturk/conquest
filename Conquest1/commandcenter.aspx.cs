using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Conquest1
{
    public partial class commandcenter : System.Web.UI.Page
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

                String lvl = con.getBuildingLevel(villageID, "6");

                if (lvl == "0")
                {
                    Response.Redirect("village.aspx");
                }

                if (!IsPostBack)
                {

                    if (Session["sX"] != null)
                    {
                        tbX.Text = Session["sX"].ToString();
                    }
                    if (Session["sY"] != null)
                    {
                        tbY.Text = Session["sY"].ToString();
                    }
                }

                DataTable dt = new DataTable();
                DataTable dt2 = new DataTable();
                dt = con.KomutaBilgi(villageID);
                dt2 = con.DKomutaBilgi(villageID);
                lblMizrak.Text = "(" + dt.Rows[0]["Sayi"].ToString() + "/" + dt2.Rows[0]["Sayi"].ToString() + ")";
                lblKilic.Text = "(" + dt.Rows[1]["Sayi"].ToString() + "/" + dt2.Rows[1]["Sayi"].ToString() + ")";
                lblBaltaci.Text = "(" + dt.Rows[2]["Sayi"].ToString() + "/" + dt2.Rows[2]["Sayi"].ToString() + ")";
                lblCasus.Text = "(" + dt.Rows[3]["Sayi"].ToString() + "/" + dt2.Rows[3]["Sayi"].ToString() + ")";
                lblHafif.Text = "(" + dt.Rows[4]["Sayi"].ToString() + "/" + dt2.Rows[4]["Sayi"].ToString() + ")";
                lblAgir.Text = "(" + dt.Rows[5]["Sayi"].ToString() + "/" + dt2.Rows[5]["Sayi"].ToString() + ")";
                lblMisyoner.Text = "(" + dt.Rows[6]["Sayi"].ToString() + "/" + dt2.Rows[6]["Sayi"].ToString() + ")";

                rep1.DataSource = con.GidenSaldiri(villageID);
                rep1.DataBind();
                rep2.DataSource = con.GelenSaldiri(villageID);
                rep2.DataBind();
                rep3.DataSource = con.DonenSaldiri(villageID);
                rep3.DataBind();
            }
        }

        protected int HızBul(int[] dizi)
        {
            if (dizi[6] != 0) return 120;
            else if (dizi[1] != 0) return 70;
            else if (dizi[0] != 0) return 60;
            else if (dizi[2] != 0) return 50;
            else if (dizi[5] != 0) return 30;
            else if (dizi[4] != 0) return 18;
            else return 10;
        }

        protected Boolean AskerKontrol(int[] ordu)
        {
            String villageID = Session["VillageID"].ToString();
            DataTable dt = con.getSoldiers(villageID);

            for (int i = 0; i < 7; i++)
            {
                if (ordu[i] > Convert.ToInt32(dt.Rows[i]["Sayi"].ToString())) return false;
            }
            return true;
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            String villageID = Session["VillageID"].ToString();

            int[] ordu = new int[7];
            ordu[0] = Convert.ToInt32(tbMizrak.Text == "" ? "0" : tbMizrak.Text);
            ordu[1] = Convert.ToInt32(tbKilic.Text == "" ? "0" : tbKilic.Text);
            ordu[2] = Convert.ToInt32(tbBaltaci.Text == "" ? "0" : tbBaltaci.Text);
            ordu[3] = Convert.ToInt32(tbCasus.Text == "" ? "0" : tbCasus.Text);
            ordu[4] = Convert.ToInt32(tbHafif.Text == "" ? "0" : tbHafif.Text);
            ordu[5] = Convert.ToInt32(tbAgir.Text == "" ? "0" : tbAgir.Text);
            ordu[6] = Convert.ToInt32(tbMisyoner.Text == "" ? "0" : tbMisyoner.Text);

            if (ordu[0] == 0 && ordu[1] == 0 && ordu[2] == 0 && ordu[3] == 0 && ordu[4] == 0 && ordu[5] == 0 && ordu[6] == 0)
            {
                lblHata.Text = "Hiç Asker Seçmediniz";
            }
            else
            {

                int hız = HızBul(ordu);
                Boolean kontrol = AskerKontrol(ordu);

                if (kontrol == true)
                {
                    int vID = con.getvillageID(tbX.Text, tbY.Text);

                    if (vID != -1)
                    {
                        int x1 = Convert.ToInt32(tbX.Text);
                        int y1 = Convert.ToInt32(tbY.Text);
                        int x2 = Convert.ToInt32(con.getvillageX(villageID));
                        int y2 = Convert.ToInt32(con.getvillageY(villageID));
                        int x = Math.Abs(x1 - x2);
                        int y = Math.Abs(y1 - y2);

                        if (x1 == x2 && y1 == y2)
                        {
                            lblHata.Text = "Askerler kendi köyüne saldıramaz.";
                            return;
                        }

                        int saniye = Convert.ToInt32(Math.Ceiling(Math.Sqrt((x * x) + (y * y)) * hız));

                        String dönen = con.addSaldiriIslem(villageID, vID, saniye);
                        int islemID = con.getIslemID(villageID);
                        String dönen2 = con.updateSaldiriOrdu(ordu, islemID);
                        Session["sX"] = null;
                        Session["sY"] = null;
                        Response.Redirect("commandcenter.aspx");
                    }
                    else
                    {
                        lblHata.Text = "Girilen Koordinatlar Geçersiz";
                    }
                }
                else
                {
                    lblHata.Text = "Yetersiz Asker";
                }
            }
        }

        protected void rep1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            String islemID = (e.Item.FindControl("id") as Label).Text;
            String temp = con.DeleteSaldiriIslem(islemID);
        }
    }
}