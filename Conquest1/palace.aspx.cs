using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Conquest1
{
    public partial class palace : System.Web.UI.Page
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

                String lvl = con.getBuildingLevel(villageID, "13");

                if (lvl == "0")
                {
                    Response.Redirect("village.aspx");
                }

                lblHata.Text = "";


                rep1.DataSource = con.PalaceTrainList(villageID);
                rep1.DataBind();
            }
        }

        protected void btnYetistir_Click(object sender, EventArgs e)
        {
            String villageID = Session["VillageID"].ToString();
            DataTable dt = con.Madenler(villageID);
            int TModun = Convert.ToInt32(lblModun.Text) * Convert.ToInt32(tbMisyoner.Text == "" ? "0" : tbMisyoner.Text);
            int TMkil = Convert.ToInt32(lblMkil.Text) * Convert.ToInt32(tbMisyoner.Text == "" ? "0" : tbMisyoner.Text);
            int TMdemir = Convert.ToInt32(lblMdemir.Text) * Convert.ToInt32(tbMisyoner.Text == "" ? "0" : tbMisyoner.Text);
            int TTpop = Convert.ToInt32(lblMpop.Text) * Convert.ToInt32(tbMisyoner.Text == "" ? "0" : tbMisyoner.Text);

            int Tpop = Convert.ToInt32(con.gettotalpop(villageID));
            int Tkpop = Convert.ToInt32(con.getusedpop(villageID));
            int sayi = Convert.ToInt32(tbMisyoner.Text == "" ? "0" : tbMisyoner.Text) + con.getMisyonerCount(villageID); ;

            if (sayi < 4)
            {

                if ((TModun) <= Convert.ToInt32(dt.Rows[0]["Miktar"].ToString())
                    && (TModun) > 0 && (TMkil) <= Convert.ToInt32(dt.Rows[1]["Miktar"].ToString())
                    && (TMkil) > 0 && (TMdemir) <= Convert.ToInt32(dt.Rows[2]["Miktar"].ToString())
                    && (TMdemir) > 0)
                {
                    if ((Tkpop + TTpop) <= Tpop)
                    {
                        if (tbMisyoner.Text != "")
                        {
                            String donen = con.addAskerIslem(villageID, 7, Convert.ToInt32(tbMisyoner.Text), TMkil, TModun, TMdemir, lblMsure.Text, 14400, 2);
                            String dönen = con.MadenAzalt(villageID, TMkil.ToString(), TModun.ToString(), TMdemir.ToString());
                        }
                    }
                    else
                    {
                        lblHata.Text = "Yetersiz Popülasyon";
                    }
                }
                else
                {
                    lblHata.Text = "Yetersiz Maden";
                }
            }
            else
            {
                lblHata.Text = "Yetersiz Misyoner Kotası";
            }
        }
    }
}