using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Conquest1
{
    public partial class main : System.Web.UI.Page
    {
        DbConnection con = new DbConnection();
        int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KULLANICI"] == null)
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                String temp = con.BinaKontrolProc();
                    i++;
                    string userID = con.getuserID(Session["KULLANICI"].ToString()).ToString();
                    string villageID = Session["VillageID"].ToString();
                    repI.DataSource = con.InsaListesi(villageID);
                    repI.DataBind();
                    repB.DataSource = con.BinaInsaListesi(villageID);
                    repB.DataBind();
                    repT.DataSource = con.BitmisBinalar(villageID);
                    repT.DataBind();
                    repG.DataSource = con.GBinalar(villageID);
                    repG.DataBind();
            }
        }

        protected void repI_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            String islemID = (e.Item.FindControl("id") as Label).Text;
            String temp = con.DeleteBinaIslem(islemID);
            //Response.Redirect("main.aspx");
        }

        protected void repB_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            (e.Item.FindControl("lbInsaEt") as LinkButton).Enabled = false;
            string villageID = Session["VillageID"].ToString();
            String bID = (e.Item.FindControl("id") as Label).Text;

            var madenler = con.getBinaMadenGereksinimleri(villageID, bID);
            String odun = madenler.Rows[0]["Price"].ToString();
            String kil =  madenler.Rows[1]["Price"].ToString();
            String demir = madenler.Rows[2]["Price"].ToString();
            
            var sure = con.getBinaInsaatSure(villageID, bID);

            String valid = con.BinaIslemValid(villageID, bID, kil, odun, demir);
            Boolean valid2 = InsaKontrol(kil, odun, demir);
            if (valid == "0" && valid2==true)
            {

                String temp = con.MadenAzalt(villageID, kil, odun, demir);
                temp = con.addBinaIslem(villageID, bID, kil, odun, demir, sure);
            }
            //Response.Redirect("main.aspx");
        }

        public bool InsaKontrol(string kil,string odun,string demir)
        {
            string villageID = Session["VillageID"].ToString();
            DataTable dt = con.Madenler(villageID);
            int count = con.getInsaSayisi(villageID);
            int vodun = Convert.ToInt32(dt.Rows[0]["Miktar"].ToString());
            int vkil = Convert.ToInt32(dt.Rows[1]["Miktar"].ToString());
            int vdemir = Convert.ToInt32(dt.Rows[2]["Miktar"].ToString());

            if (Convert.ToInt32(kil) > vkil || Convert.ToInt32(odun) > vodun || Convert.ToInt32(demir) > vdemir || count>2)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public string MadenKontrol(string maden, int madenTur)
        {
            string villageID = Session["VillageID"].ToString();
            DataTable dt = con.Madenler(villageID);

            int gerekliMaden = Convert.ToInt32(maden);
            int madenMiktar = Convert.ToInt32(dt.Rows[madenTur]["Miktar"].ToString());

            return gerekliMaden <= madenMiktar ? "#000000": "#dc0000";
        }

    }
}