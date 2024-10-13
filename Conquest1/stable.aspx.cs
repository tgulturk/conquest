using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Conquest1
{
    public partial class stable : System.Web.UI.Page
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

                String lvl = con.getBuildingLevel(villageID, "9");

                if (lvl == "0")
                {
                    Response.Redirect("village.aspx");
                }

                lblHata.Text = "";

                rep1.DataSource = con.StableTrainList(villageID);
                rep1.DataBind();
            }
        }

        protected void btnYetistir_Click(object sender, EventArgs e)
        {
            String villageID = Session["VillageID"].ToString();

            var units = con.getUnits();

            int TModun = Convert.ToInt32(units.Rows[3]["Odun"].ToString()) * Convert.ToInt32(tbCasus.Text == "" ? "0" : tbCasus.Text);
            int TKodun = Convert.ToInt32(units.Rows[4]["Odun"].ToString()) * Convert.ToInt32(tbHafif.Text == "" ? "0" : tbHafif.Text);
            int TBodun = Convert.ToInt32(units.Rows[5]["Odun"].ToString()) * Convert.ToInt32(tbAgir.Text == "" ? "0" : tbAgir.Text);
            int TMkil = Convert.ToInt32(units.Rows[3]["Kil"].ToString()) * Convert.ToInt32(tbCasus.Text == "" ? "0" : tbCasus.Text);
            int TKkil = Convert.ToInt32(units.Rows[4]["Kil"].ToString()) * Convert.ToInt32(tbHafif.Text == "" ? "0" : tbHafif.Text);
            int TBkil = Convert.ToInt32(units.Rows[5]["Kil"].ToString()) * Convert.ToInt32(tbAgir.Text == "" ? "0" : tbAgir.Text);
            int TMdemir = Convert.ToInt32(units.Rows[3]["Demir"].ToString()) * Convert.ToInt32(tbCasus.Text == "" ? "0" : tbCasus.Text);
            int TKdemir = Convert.ToInt32(units.Rows[4]["Demir"].ToString()) * Convert.ToInt32(tbHafif.Text == "" ? "0" : tbHafif.Text);
            int TBdemir = Convert.ToInt32(units.Rows[5]["Demir"].ToString()) * Convert.ToInt32(tbAgir.Text == "" ? "0" : tbAgir.Text);
            int TTpop = Convert.ToInt32(units.Rows[3]["uPopulation"].ToString()) * Convert.ToInt32(tbCasus.Text == "" ? "0" : tbCasus.Text)+
                 Convert.ToInt32(units.Rows[4]["uPopulation"].ToString()) * Convert.ToInt32(tbHafif.Text == "" ? "0" : tbHafif.Text)+
                 Convert.ToInt32(units.Rows[5]["uPopulation"].ToString()) * Convert.ToInt32(tbAgir.Text == "" ? "0" : tbAgir.Text);

            int Tpop = Convert.ToInt32(con.gettotalpop(villageID));
            int Tkpop = Convert.ToInt32(con.getusedpop(villageID)) + con.getRecruitingpop(villageID);

            DataTable dt = con.Madenler(villageID);

            if ((TModun + TKodun + TBodun) <= Convert.ToInt32(dt.Rows[0]["Miktar"].ToString())
                && (TModun + TKodun + TBodun) > 0 && (TMkil + TKkil + TBkil) <= Convert.ToInt32(dt.Rows[1]["Miktar"].ToString())
                && (TMkil + TKkil + TBkil) > 0 && (TMdemir + TKdemir + TBdemir) <= Convert.ToInt32(dt.Rows[2]["Miktar"].ToString())
                && (TMdemir + TKdemir + TBdemir) > 0)
            {
                if ((Tkpop + TTpop) <= Tpop)
                {

                    if (tbCasus.Text != "")
                    {
                        String donen = con.addAskerIslem(villageID, 4, Convert.ToInt32(tbCasus.Text), TMkil, TModun, TMdemir, units.Rows[3]["Sure"].ToString(), 20, 1);
                        String dönen = con.MadenAzalt(villageID, TMkil.ToString(), TModun.ToString(), TMdemir.ToString());
                    }

                    if (tbHafif.Text != "")
                    {
                        String donen = con.addAskerIslem(villageID, 5, Convert.ToInt32(tbHafif.Text), TKkil, TKodun, TKdemir, units.Rows[4]["Sure"].ToString(), 70, 1);
                        String dönen = con.MadenAzalt(villageID, TKkil.ToString(), TKodun.ToString(), TKdemir.ToString());
                    }

                    if (tbAgir.Text != "")
                    {
                        String donen = con.addAskerIslem(villageID, 6, Convert.ToInt32(tbAgir.Text), TBkil, TBodun, TBdemir, units.Rows[5]["Sure"].ToString(), 80, 1);
                        String dönen = con.MadenAzalt(villageID, TBkil.ToString(), TBodun.ToString(), TBdemir.ToString());
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
    }
}