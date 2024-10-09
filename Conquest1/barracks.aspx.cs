﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Conquest1
{
    public partial class barracks : System.Web.UI.Page
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
                String lvl = con.getBuildingLevel(villageID,"8");

                if (lvl == "0")
                {
                    Response.Redirect("village.aspx");
                }

                lblHata.Text = "";


                rep1.DataSource = con.BarracksTrainList(villageID);
                rep1.DataBind();
            }
        }

        protected void btnYetistir_Click(object sender, EventArgs e)
        {
            String villageID = Session["VillageID"].ToString();
            DataTable dt = con.Madenler(villageID);
            int TModun = Convert.ToInt32(lblModun.Text) * Convert.ToInt32(tbMizrak.Text == "" ? "0" : tbMizrak.Text);
            int TKodun = Convert.ToInt32(lblKodun.Text) * Convert.ToInt32(tbKilic.Text == "" ? "0" : tbKilic.Text);
            int TBodun = Convert.ToInt32(lblBodun.Text) * Convert.ToInt32(tbBaltaci.Text == "" ? "0" : tbBaltaci.Text);
            int TMkil = Convert.ToInt32(lblMkil.Text) * Convert.ToInt32(tbMizrak.Text == "" ? "0" : tbMizrak.Text);
            int TKkil = Convert.ToInt32(lblKkil.Text) * Convert.ToInt32(tbKilic.Text == "" ? "0" : tbKilic.Text);
            int TBkil = Convert.ToInt32(lblBkil.Text) * Convert.ToInt32(tbBaltaci.Text == "" ? "0" : tbBaltaci.Text);
            int TMdemir = Convert.ToInt32(lblMdemir.Text) * Convert.ToInt32(tbMizrak.Text == "" ? "0" : tbMizrak.Text);
            int TKdemir = Convert.ToInt32(lblKdemir.Text) * Convert.ToInt32(tbKilic.Text == "" ? "0" : tbKilic.Text);
            int TBdemir = Convert.ToInt32(lblBdemir.Text) * Convert.ToInt32(tbBaltaci.Text == "" ? "0" : tbBaltaci.Text);
            int TTpop = Convert.ToInt32(lblMpop.Text) * Convert.ToInt32(tbMizrak.Text == "" ? "0" : tbMizrak.Text) +
                 Convert.ToInt32(lblKpop.Text) * Convert.ToInt32(tbKilic.Text == "" ? "0" : tbKilic.Text) +
                 Convert.ToInt32(lblBpop.Text) * Convert.ToInt32(tbBaltaci.Text == "" ? "0" : tbBaltaci.Text);

            int Tpop = Convert.ToInt32(con.gettotalpop(villageID));
            int Tkpop = Convert.ToInt32(con.getusedpop(villageID));

            if ((TModun+TKodun+TBodun) <= Convert.ToInt32(dt.Rows[0]["Miktar"].ToString())
                && (TModun + TKodun + TBodun) > 0 && (TMkil+TKkil+TBkil) <= Convert.ToInt32(dt.Rows[1]["Miktar"].ToString())
                && (TMkil + TKkil + TBkil) > 0 && (TMdemir+TKdemir+TBdemir) <= Convert.ToInt32(dt.Rows[2]["Miktar"].ToString())
                && (TMdemir + TKdemir + TBdemir) > 0)
            {
                if ((Tkpop + TTpop) <= Tpop)
                {
                    if (tbMizrak.Text != "")
                    {
                        String donen = con.addAskerIslem(villageID, 1, Convert.ToInt32(tbMizrak.Text), TMkil, TModun, TMdemir, lblMsure.Text, 45, 0);
                        String dönen = con.MadenAzalt(villageID, TMkil.ToString(), TModun.ToString(), TMdemir.ToString());
                    }

                    if (tbKilic.Text != "")
                    {
                        String donen = con.addAskerIslem(villageID, 2, Convert.ToInt32(tbKilic.Text), TKkil, TKodun, TKdemir, lblKsure.Text, 50, 0);
                        String dönen = con.MadenAzalt(villageID, TKkil.ToString(), TKodun.ToString(), TKdemir.ToString());
                    }

                    if (tbBaltaci.Text != "")
                    {
                        String donen = con.addAskerIslem(villageID, 3, Convert.ToInt32(tbBaltaci.Text), TBkil, TBodun, TBdemir, lblBsure.Text, 45, 0);
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