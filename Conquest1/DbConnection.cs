using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Conquest1
{
    public class DbConnection
    {
        public SqlConnection con = new SqlConnection();
        public DbConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConquestGameDB"].ConnectionString;
            con.ConnectionString = connectionString;
        }

        public String changepassword(String username, String password)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update Users set password = @a where userName = @b", con);
                sc.Parameters.AddWithValue("@a", password);
                sc.Parameters.AddWithValue("@b", username);
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "degisti";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        }  // Şifre değiştir

        public int getuserID(String username)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("SELECT userID from Users where username=@a", con);
                sc.Parameters.AddWithValue("@a", username);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        } // kullanıcının ID'sini getir
        
        public string adduser(String username, String password, String mail)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("AddUser", con);
                sc.CommandType = CommandType.StoredProcedure;

                sc.Parameters.Add("@userName", SqlDbType.NVarChar, 50);
                sc.Parameters["@userName"].Value = username;
                sc.Parameters.Add("@password", SqlDbType.NVarChar, 50);
                sc.Parameters["@password"].Value = password;
                sc.Parameters.Add("@email", SqlDbType.NVarChar, 50);
                sc.Parameters["@email"].Value = mail;


                sc.ExecuteNonQuery();

                return "1";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } //Kullanıcı Ekleme

        public string addvillage(int userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("AddVillage", con);
                sc.CommandType = CommandType.StoredProcedure;

                sc.Parameters.Add("@userID", SqlDbType.Int);
                sc.Parameters["@userID"].Value = userID;


                sc.ExecuteNonQuery();

                return "1";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } //Köy Ekleme

        public String usernamevalid(String username)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("SELECT COUNT(*) FROM Users WHERE userName = @a", con);
                sc.Parameters.AddWithValue("@a", username);
                int count = (int)sc.ExecuteScalar();

                return count.ToString();
            }
            catch
            {
                return "Sistem Hatası";
            }
            finally
            {
                con.Close();
            }
        } // username Geçerli bir kullanıcı mı?

        public String mailvalid(String mail)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("SELECT COUNT(*) FROM Users WHERE userMail = @a", con);
                sc.Parameters.AddWithValue("@a", mail);
                int count = (int)sc.ExecuteScalar();

                return count.ToString();
            }
            catch
            {
                return "Sistem Hatası";
            }
            finally
            {
                con.Close();
            }
        } // mail geçerlimi

        public String getpassword(String username)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("SELECT password from Users where userName=@a", con);
                sc.Parameters.AddWithValue("@a", username);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // kullanıcının şifresini getir

        public String getemail(String username)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("SELECT userMail from Users where userName=@a", con);
                sc.Parameters.AddWithValue("@a", username);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // e-mail adresini getir

        public String getmailpassword(String usermail)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("SELECT password from Users where userMail=@a", con);
                sc.Parameters.AddWithValue("@a", usermail);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // kullanıcının şifresini getir

        public String getmailusername(String usermail)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("SELECT userName from Users where userMail=@a", con);
                sc.Parameters.AddWithValue("@a", usermail);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // kullanıcının şifresini getir

        public String getusertypename(String username)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select u.usertypename from UserTypes u, Accounts a where a.username=@a and  a.usertype=u.ID", con);
                sc.Parameters.AddWithValue("@a", username);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // kullanıcının türünü getir

        public String getUsername(String userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("SELECT username from Users where userID=@a", con);
                sc.Parameters.AddWithValue("@a", userID);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // kullanıcı adını getir

        public int getvillagePoint(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select vPoint from villages where vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            finally
            {
                con.Close();
            }
        } // köyün puanını getir

        public String getvillagename(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select vName from Villages where vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // köyün adını getir

        public int getvillageID(String villageName)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select vID from Villages where vName=@a", con);
                sc.Parameters.AddWithValue("@a", villageName);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
        } // köyün ID sini getir

        public int getvillageID(int x, int y)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select vID from Villages where vX=@x and vY=@y", con);
                sc.Parameters.AddWithValue("@x", x);
                sc.Parameters.AddWithValue("@y", y);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
        } // köyün ID sini getir

        public int getvillageID(String vX,String vY)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select vID from Villages where vX=@a and vY=@b", con);
                sc.Parameters.AddWithValue("@a", vX);
                sc.Parameters.AddWithValue("@b", vY);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
        } // köyün koordinata göre ID sini getir

        public String getvillagecoordinates(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select '( '+CAST(vX as nvarchar)+' | '+CAST(vY as nvarchar)+' )' from Villages where vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // köyün koordinatlarını getir

        public String getvillageX(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select CAST(vX as nvarchar) from Villages where vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // Köyün X koordinatını getir

        public String getvillageY(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select CAST(vY as nvarchar) from Villages where vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        }  // Köyün Y koordinatını getir

        public String loginvalid(String username, String password)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("SELECT COUNT(*) from Users where userName=@a and password=@b", con);
                sc.Parameters.AddWithValue("@a", username);
                sc.Parameters.AddWithValue("@b", password);
                int count = (int)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // giriş bilgileri doğrumu

        public String addLoginLog(String username, String ipAdress)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Insert into LoginLog (uID,ipAdress,LoginDate) Values((Select userID from Users where userName=@a),@b,@c)", con);
                sc.Parameters.AddWithValue("@a", username);
                sc.Parameters.AddWithValue("@b", ipAdress);
                sc.Parameters.AddWithValue("@c",DateTime.Now);
                sc.ExecuteNonQuery();

                return "eklendi";
            }

            catch (Exception ex)
            {
                return ex.ToString();
            }

            finally
            {
                con.Close();
            }
        } // Giriş Log u ekle

        public DataTable news()
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select newsID,newsDate,news from News order by newsDate desc,newsID desc", con);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;

            }

            catch
            {
                return null;
            }

            finally
            {
                con.Close();
            }
        } // Haberleri getir

        public int getfirstvillageid(String username)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select top 1 vID from Villages v inner join Users u on v.uID = u.userID where u.userName=@a", con);
                sc.Parameters.AddWithValue("@a", username);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        } // ilk köyün id sini getir

        public string getvillageuserID(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select uID from Villages where vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                int count = (int)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
            finally
            {
                con.Close();
            }
        } // köyün kullanıcısının idsini getir

        public string getusedpop(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select SUM(vu.uCount*u.uPopulation) as Upopulation from VillageUnits vu INNER JOIN Units u on vu.uID=u.uID where vu.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                int count = (int)sc.ExecuteScalar();

                return count.ToString();
            }
            catch(SqlException ex)
            {
                return ex.Message;
            }
            finally
            {
                con.Close();
            }
        } // kullanılan popülasyonunu getir

        public string gettotalpop(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select p.Population as Tpopulation from Population p INNER JOIN VillageBuildings v on p.bLevel=v.bLevel where v.bID=5 and v.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                int count = (int)sc.ExecuteScalar();

                return count.ToString();
            }
            catch(SqlException ex)
            {
                return ex.Message;
            }
            finally
            {
                con.Close();
            }
        } // toplam popülasyonu getir

        public string getrescapacity(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select r.Capacity from ResourceCapacity r inner join VillageBuildings b on r.bLevel=b.bLevel where b.bID=7 and b.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                int count = (int)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
            finally
            {
                con.Close();
            }
        } // depo kapasitesini getir

        public DataTable Madenler(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select Floor(rCount) as Miktar from VillageResources where vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // madenleri getir

        public DataTable MadenArtis(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select Round(i.Increment*360,0) as Miktar from ResourceIncrement i,VillageBuildings b,Resources r where b.vID=@a and b.bID in (2,3,4) and b.bLevel=i.bLevel and r.rID=b.bID-1 order by r.rID", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // maden artışlarını getir

        public DataTable Askerler(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select vu.uCount-vu.ouCount as Sayi,u.uName as Isim from VillageUnits vu INNER JOIN Units u on vu.uID=u.uID where vu.vID=@a and vu.uCount-vu.ouCount<>0", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // asker listesini getir

        public DataTable Binalar(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select b.bID,b.bName as Isim,vb.bLevel as Seviye from VillageBuildings vb INNER JOIN Buildings b on b.bID=vb.bID where vb.bLevel<>0 and vb.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // bina listesini getir

        public DataTable Maps(int a,int c)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select * from (select v.vID,v.vX,v.vY from Villages v union select 0 as vID,c.vX,c.vY from Coordinates c) s where s.vX between @a and @b and s.vY between @c and @d  order by s.vY,s.vX", con);
                sc.Parameters.AddWithValue("@a", a);
                sc.Parameters.AddWithValue("@b", a+9);
                sc.Parameters.AddWithValue("@c", c);
                sc.Parameters.AddWithValue("@d", c+9);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // haritada a,c ile a+10,c+10 arasını getir

        public DataTable overview(int userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select v.vID,v.vName,v.vPoint, (select Floor(r.rCount) from VillageResources r where r.rID=1 and r.vID=v.vID) as Wood, (select Floor(r.rCount) from VillageResources r where r.rID=2 and r.vID=v.vID) as Clay, (select Floor(r.rCount) from VillageResources r where r.rID=3 and r.vID=v.vID) as Iron,c.Capacity, Convert(nvarchar,(Select SUM(vu.uCount*u.uPopulation) as Upopulation from VillageUnits vu INNER JOIN Units u on vu.uID=u.uID where vu.vID=v.vID)) +' / '+ Convert(nvarchar,(select p.Population as Tpopulation from Population p INNER JOIN VillageBuildings vb on p.bLevel=vb.bLevel where vb.bID=5 and vb.vID=v.vID)) as Ciftlik, v.Loyalty from Villages v inner join VillageBuildings b on b.vID=v.vID inner join ResourceCapacity c on b.bLevel=c.bLevel where b.bID=7 and v.uID = @a order by v.vID", con);

                sc.Parameters.AddWithValue("@a", userID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;

            }

            catch
            {
                return null;
            }

            finally
            {
                con.Close();
            }
        } // köylerin listesini getir

        public DataTable inbox(String username)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select m.mID as ID,a.userName as Gönderen,m.subject as Konu,m.isread as Okundumu,m.senddate as Tarih" +
                                               " from Users a,Messages m where m.senderID=a.userID and m.getterID=" +
                                               "(Select userID from Users where userName=@a) and m.isgetdelete=0 order by m.mID desc", con);

                sc.Parameters.AddWithValue("@a", username);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;

            }

            catch
            {
                return null;
            }

            finally
            {
                con.Close();
            }
        } // gelen kutusunu getir

        public DataTable outbox(String username)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select m.mID as ID,a.userName as Gönderen,m.subject as Konu,m.isread as Okundumu,m.senddate as Tarih" +
                                               " from Users a,Messages m where m.getterID=a.userID and m.senderID=" +
                                               "(Select userID from Users where userName=@a) and m.issenddelete=0 order by m.mID desc", con);

                sc.Parameters.AddWithValue("@a", username);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;

            }

            catch
            {
                return null;
            }

            finally
            {
                con.Close();
            }
        } // giden kutusunu getir

        public DataTable trashcan(String username)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select m.mID as ID,a.userName as Gönderen,m.subject as Konu,m.isread as Okundumu,m.senddate as Tarih" +
                                               " from Users a,Messages m where m.senderID=a.userID and m.getterID=" +
                                               "(Select userID from Users where userName=@a) and m.isgetdelete=1 and m.ispermdelete=0 order by m.mID desc", con);

                sc.Parameters.AddWithValue("@a", username);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;

            }

            catch
            {
                return null;
            }

            finally
            {
                con.Close();
            }
        } // çöp kutusunu getir

        public string sendmail(int userID, int getterID, String subject, String mail)
        {

            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("INSERT INTO Messages (senderID,getterID,subject,message,senddate,issenddelete,isgetdelete,isread,ispermdelete) "
                                                + "VALUES(@a,@b,@c,@d,GETDATE(),'0','0','0','0')", con);
                sc.Parameters.AddWithValue("@a", userID);
                sc.Parameters.AddWithValue("@b", getterID);
                sc.Parameters.AddWithValue("@c", subject);
                sc.Parameters.AddWithValue("@d", mail);
                sc.ExecuteNonQuery();

                return "Mesaj Gönderildi";
            }

            catch (Exception ex)
            {
                return ex.ToString();
            }

            finally
            {
                con.Close();
            }
        } // mesaj gönder

        public String sendendeletemail(String mailid)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update Messages set issenddelete = 1 where mID = @a", con);
                sc.Parameters.AddWithValue("@a", Convert.ToInt32(mailid));
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "silindi";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // mesajı gönderenin giden mailler kategorisinden sil

        public String permdeletemail(String mailid)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update Messages set ispermdelete = 1 where mID = @a", con);
                sc.Parameters.AddWithValue("@a", Convert.ToInt32(mailid));
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "silindi";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // mesajı çöp kutusundan sil

        public String undeletemail(String mailid)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update Messages set isgetdelete = 0 where mID = @a", con);
                sc.Parameters.AddWithValue("@a", Convert.ToInt32(mailid));
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "gerialindi";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // silinmiş mesajı geri getir

        public String setreaded(String mailid)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update Messages set isread = 1 where mID = @a", con);
                sc.Parameters.AddWithValue("@a", Convert.ToInt32(mailid));
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "okundu";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // mesajı okunmuş olarak işaretle

        public String deletemail(String mailid)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update Messages set isgetdelete = 1 where mID = @a", con);
                sc.Parameters.AddWithValue("@a", Convert.ToInt32(mailid));
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "silindi";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // mesajı sil

        public String getsendername(String mailid)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select a.username from Messages m, Users a where m.mID=@a and  a.userID=m.senderID", con);
                sc.Parameters.AddWithValue("@a", Convert.ToInt32(mailid));
                String veri = (String)sc.ExecuteScalar();

                return veri.ToString();
            }
            catch
            {
                return "###BOŞ DÖNDÜ###";
            }
            finally
            {
                con.Close();
            }
        } // mesajın göndericisini getir

        public String getsubject(String mailid)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select subject from Messages where mID=@a", con);
                sc.Parameters.AddWithValue("@a", Convert.ToInt32(mailid));
                String veri = (String)sc.ExecuteScalar();

                return veri.ToString();
            }
            catch
            {
                return "###BOŞ DÖNDÜ###";
            }
            finally
            {
                con.Close();
            }
        } // mesajın konusunu getir

        public String getmail(String mailid)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select message from Messages where mID=@a", con);
                sc.Parameters.AddWithValue("@a", Convert.ToInt32(mailid));
                String veri = (String)sc.ExecuteScalar();

                return veri.ToString();
            }
            catch
            {
                return "###BOŞ DÖNDÜ###";
            }
            finally
            {
                con.Close();
            }
        } // mesaj içeriğini getir

        public string getnewmailcount(String userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select  (case COUNT(*) when 0 then '' else '('+ Cast(COUNT(*) as nvarchar)+')' end) as New from Messages where isread=0 and isgetdelete=0 and getterID=@a", con);
                sc.Parameters.AddWithValue("@a", userID);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
            finally
            {
                con.Close();
            }
        } // yeni mesaj sayısını getir

        public String setemail(String email,String username)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update Users set userMail = @a where userName = @b", con);
                sc.Parameters.AddWithValue("@a", email);
                sc.Parameters.AddWithValue("@b", username);
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "okundu";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // e-mail adresini değiştir

        public int getVillageCount(int userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select Count(*) as Sayi from Villages where uID=@a", con);
                sc.Parameters.AddWithValue("@a", userID);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        } // köy sayısını getir

        public String getuserRank(int userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select Sira from (Select ROW_NUMBER() over (order by Puan desc) as Sira,uID,puan from (select v.uID,SUM(p.Point) as Puan "+
	                                            " from Villages v inner join VillageBuildings vb on vb.vID=v.vID INNER JOIN Buildings b on b.bID=vb.bID "+
                                                " INNER JOIN BuildingPoints p on p.bID=b.bID where p.bLevel=vb.bLevel group by v.uID having v.uID<>'1' ) as Sorgu) as Sorgu1 " +
                                                " where uID = @a", con);
                sc.Parameters.AddWithValue("@a", userID);
                string count = Convert.ToString(sc.ExecuteScalar());

                return count;
            }
            catch
            {
                return "";
            }
            finally
            {
                con.Close();
            }
        } // kullanıcı sırasını getir

        public int getuserPoint(int userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select Puan from (select v.uID,SUM(p.Point) as Puan "+
                                                "from Villages v inner join VillageBuildings vb on vb.vID=v.vID INNER JOIN Buildings b on b.bID=vb.bID "+ 
	                                            "INNER JOIN BuildingPoints p on p.bID=b.bID where p.bLevel=vb.bLevel group by v.uID) as Sorgu "+
                                                "where uID=@a", con);
                sc.Parameters.AddWithValue("@a", userID);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        } // kullanıcı puanını getir

        public DataTable getlast10login(int userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select TOP 10 l.loginDate as Tarih,l.ipAdress as IP "+
                                                "from LoginLog l inner join Users u on l.uID=u.userID where l.uID=@a order by l.loginDate desc", con);

                sc.Parameters.AddWithValue("@a", userID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;

            }

            catch
            {
                return null;
            }

            finally
            {
                con.Close();
            }
        } // son 10 giriş kaydını getir

        public DataTable getrankings(int a)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select distinct s.Sira,u.userName,s.puan,s.VSayi,floor(s.Puan/s.VSayi)as Ortalama from (Select ROW_NUMBER() over (order by S1.Puan desc) as Sira,S1.uID,S1.puan,S2.VSayi"+
                                                " from (select v.uID,SUM(p.Point) as Puan from Villages v inner join VillageBuildings vb on vb.vID=v.vID INNER JOIN Buildings b on b.bID=vb.bID "+
                                                "INNER JOIN BuildingPoints p on p.bID=b.bID where p.bLevel=vb.bLevel group by v.uID having v.uID not in (1,13) ) as S1 " +
	                                            "inner join (select v.uID,COUNT(*) as VSayi from Villages v inner join Users u on u.userID=v.uID group by v.uID) as S2 on S1.uID=S2.uID) as s "+
	                                            "inner join Users u on s.uID=u.userID inner join Villages v on v.uID=u.userID", con);

                sc.Parameters.AddWithValue("@a", a);
                sc.Parameters.AddWithValue("@b", a+10);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;

            }

            catch
            {
                return null;
            }

            finally
            {
                con.Close();
            }
        } // sıralama listesini getir

        public DataTable getuservillages(int userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select vID,vName,'('+Cast(vX as nvarchar)+'|'+CAST(vY as nvarchar)+')' as Koordinat,vPoint from villages where uID=@a", con);

                sc.Parameters.AddWithValue("@a", userID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;

            }

            catch
            {
                return null;
            }

            finally
            {
                con.Close();
            }
        } // kullanıcının köylerini getir

        public DataTable MadenArtisBilgi(string villageID,string bID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select (i.Increment*360) as Miktar from ResourceIncrement i,VillageBuildings b where i.bLevel in (b.bLevel,b.bLevel+1) and b.vID=@a and b.bID=@b", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.Parameters.AddWithValue("@b", bID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // maden artışını şimdiki ve sonraki seviye olarak getir

        public string getBuildingLevel(String villageID,string bID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select v.bLevel from VillageBuildings v where v.vID=@a and v.bID=@b", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.Parameters.AddWithValue("@b", bID);
                int count = (int)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
            finally
            {
                con.Close();
            }
        } // binanın seviyesini geir

        public DataTable PopBilgi(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select p.Population as Tpopulation from Population p INNER JOIN VillageBuildings v on p.bLevel in (v.bLevel,v.bLevel+1) where v.bID=5 and v.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // popülasyonu şimdiki ve sonraki seviye olarak getir

        public DataTable CapBilgi(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select r.Capacity from ResourceCapacity r inner join VillageBuildings b on r.bLevel in (b.bLevel,b.bLevel+1) where b.bID=7 and b.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // depo kapasitesini şimdiki ve sonraki seviye olarak getir

        public DataTable DefBilgi(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select w.wDefense from WallDefense w inner join VillageBuildings b on w.bLevel in (b.bLevel,b.bLevel+1) where b.bID=11 and b.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // savunma bonusunu şimdiki ve sonraki seviye olarak getir

        public DataTable BinaInsaListesi(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("SELECT b.bID, " +
                                               "b.bName + ' (Seviye ' + CONVERT(nvarchar, vb.bLevel) + ')' AS Bina, " +
                                               "bt.bLevel, " +
                                               "kil.Price AS Kil, " +
                                               "odun.Price AS Odun, " +
                                               "demir.Price AS Demir, " +
                                               "LEFT((dbo.AdjustTime(bt.time,"+
                                               "(SELECT TOP 1 CAST(tr.TimeReduce AS DECIMAL) / 100 "+
                                               "FROM TimeReduce tr "+
                                               "INNER JOIN VillageBuildings vb2 ON vb2.bID = 1 AND vb2.vID = @a "+
                                               "WHERE tr.bID = 1 AND tr.bLevel = vb2.bLevel))), 8) AS Sure "+
                                               "FROM VillageBuildings vb " +
                                               "INNER JOIN Buildings b ON b.bID = vb.bID " +
                                               "INNER JOIN BuildingPrices kil ON kil.bID = b.bID " +
                                               "INNER JOIN BuildingPrices odun ON odun.bID = b.bID " +
                                               "INNER JOIN BuildingPrices demir ON demir.bID = b.bID " +
                                               "INNER JOIN BuildTime bt ON bt.bID = b.bID " +
                                               "INNER JOIN ( " +
                                               "SELECT b.bID, ISNULL(s.Toplam, 0) AS Toplam " +
                                               "FROM (SELECT bID, SUM(islem) AS Toplam FROM BinaIslem WHERE vID = @a GROUP BY bID) s " +
                                               "RIGHT JOIN Buildings b ON b.bID = s.bID) s ON s.bID = b.bID " +
                                               "WHERE vb.vID = @a " +
                                               "AND odun.rID = 1 " +
                                               "AND kil.rID = 2 " +
                                               "AND demir.rID = 3 " +
                                               "AND kil.bLevel = vb.bLevel + s.Toplam + 1 " +
                                               "AND kil.bLevel = odun.bLevel " +
                                               "AND odun.bLevel = demir.bLevel " +
                                               "AND bt.bLevel = vb.bLevel + s.Toplam + 1 " +
                                               "AND vb.buildable = 1 " +
                                               "ORDER BY vb.bID;", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // ana bina içindeki bina listesini getir

        public DataTable InsaListesi(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select i.islemID,b.bName, "+
	                        "case i.islem when 1 then 'İnşa' when -1 then 'Yıkım' end as islem, "+
	                        "left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),i.endtime),'01/01/1901 0:0:0.000'),121),12),8) as Sure "+
	                        ",convert(VARCHAR, i.endtime, 0) as endtime "+
                            "from BinaIslem i inner join Buildings b on i.bID=b.bID where i.vID=@a order by i.islemID", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // inşa edilen bina listesini getir

        public DataTable BitmisBinalar(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select b.bName +' (Seviye '+Convert(nvarchar,vb.bLevel)+')' as bName " +
                        "from VillageBuildings vb INNER JOIN " +
                        "Buildings b on b.bID=vb.bID inner join " +
                        "(Select bID,MAX(bLevel) as MaxSeviye from BuildTime group by bID) s on s.bID=b.bID " +
                        "where vb.vID=@a and vb.bLevel=s.MaxSeviye", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // tamamlanmış binaların listesini bitir

        public DataTable GBinalar(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select bName,s.Gereksinim " +
                        "from VillageBuildings vb inner join Buildings b on b.bID=vb.bID " +
                        "inner join (SELECT [bID],'Gereksinimler: ' + " +
                                    "STUFF((Select ', ' + b.bName + ' (Seviye ' + CAST([RequireLevel] AS VARCHAR(MAX)) +')' " +
                                        "from BuildingRequirement br inner join Buildings b on b.bID=br.RequireID " +
                                        "WHERE (br.bID = Results.bID) " +
                                        "FOR XML PATH ('')) " +
                                        ",1,2,'') AS Gereksinim " +
                                        "FROM BuildingRequirement Results " +
                                        "GROUP BY bID) s on s.bID=b.bID " +
                        "where vb.vID=@a and vb.buildable=0 ", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // gereksinimleri tamamlanmamış binaların listesini getir

        public string BinaKontrolProc()
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("BinaKontrol", con);
                sc.CommandType = CommandType.StoredProcedure;
                sc.ExecuteNonQuery();

                return "1";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // BinaKontrol prosedürünü çalıştır

        public string getIslemSure(String islemID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),i.endtime),'01/01/1901 0:0:0.000'),121),12),8) as Sure from BinaIslem i where islemID=@a", con);
                sc.Parameters.AddWithValue("@a", islemID);
                int count = (int)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
            finally
            {
                con.Close();
            }
        } // işlemin süresini getir

        public String MadenAzalt(String villageID, String kil,String odun,String demir)
        {
            try
            {
                con.Open();
                using (SqlCommand sc = new SqlCommand("Update VillageResources set rCount = rCount-@b where vID=@a and rID=1", con))
                {
                    sc.Parameters.AddWithValue("@a", villageID);
                    sc.Parameters.AddWithValue("@b", odun);
                    sc.ExecuteNonQuery();
                }
                using (SqlCommand sc = new SqlCommand("Update VillageResources set rCount = rCount-@b where vID=@a and rID=2", con))
                {
                    sc.Parameters.AddWithValue("@a", villageID);
                    sc.Parameters.AddWithValue("@b", kil);
                    sc.ExecuteNonQuery();
                }
                using (SqlCommand sc = new SqlCommand("Update VillageResources set rCount = rCount-@b where vID=@a and rID=3", con))
                {
                    sc.Parameters.AddWithValue("@a", villageID);
                    sc.Parameters.AddWithValue("@b", demir);
                    sc.ExecuteNonQuery();
                }
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "okundu";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // köyün madenlerini azalt

        public String addBinaIslem(String villageID, String bID, String kil, String odun, String demir,String sure)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Insert into BinaIslem Values(@vID,@bID,1,@kil,@odun,@demir,(select ISNULL(MAX(endtime),GETDATE()) as Maxendtime from BinaIslem where vID=@vID)+@sure,1,@sure)", con);
                sc.Parameters.AddWithValue("@vID", villageID);
                sc.Parameters.AddWithValue("@bID", bID);
                sc.Parameters.AddWithValue("@kil", kil);
                sc.Parameters.AddWithValue("@odun", odun);
                sc.Parameters.AddWithValue("@demir", demir);
                sc.Parameters.AddWithValue("@sure", sure);
                sc.ExecuteNonQuery();

                return "eklendi";
            }

            catch (Exception ex)
            {
                return ex.ToString();
            }

            finally
            {
                con.Close();
            }
        } // bina işlemi ekle

        public int getInsaSayisi(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select Count(*) as Sayi from BinaIslem where vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        } // inşa sayısını getir

        public String DeleteBinaIslem(String islemID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Delete from BinaIslem where islemID=@a", con);
                sc.Parameters.AddWithValue("@a", islemID);
                sc.ExecuteNonQuery();

                return "eklendi";
            }

            catch (Exception ex)
            {
                return ex.ToString();
            }

            finally
            {
                con.Close();
            }
        } // bina işlemini iptal et

        public String BinaIslemValid(String villageID, String bID, String kil, String odun, String demir)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select Count(*) from BinaIslem where vID=@vID and bID=@bID and kil=@kil and odun=@odun and demir=@demir", con);
                sc.Parameters.AddWithValue("@vID", villageID);
                sc.Parameters.AddWithValue("@bID", bID);
                sc.Parameters.AddWithValue("@kil", kil);
                sc.Parameters.AddWithValue("@odun", odun);
                sc.Parameters.AddWithValue("@demir", demir);
                int count = (int)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // bina işlemi yapılabilirmi

        public DataTable MadenRapor(string userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select m.reportID,v.vName+' '+v2.vName+'ne kaynak desteği yapıyor.' as Konu,m.senddate,1 as Okundumu " +
                        "from MarketRapor m,Villages v,Villages v2,Users u,Users u2 " +
                        "where m.gettervID=v2.vID and m.sendervID=v.vID and v.uID=u.userID and v2.uID = u2.userID and (u.userID=@a or u2.userID=@a) " +
                        "and 0 = case u.userID when @a then m.issenddelete else m.isgetdelete end " +
                        "order by m.senddate desc", con);
                sc.Parameters.AddWithValue("@a", userID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // ticaret rapor listesini getir

        public String deleteMadenReport(String reportID,string userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update MarketRapor set issenddelete = CASE sendervID WHEN @a THEN 1 ELSE issenddelete end, "+
					   "isgetdelete = CASE gettervID WHEN @a THEN 1 ELSE isgetdelete end "+
					   "where reportID=@b", con);
                sc.Parameters.AddWithValue("@a", userID);
                sc.Parameters.AddWithValue("@b", reportID);
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "silindi";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // ticaret raporunu sil

        public DataTable MadenRaporIcerik(string reportID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select m.senddate,u.userName as GonU,v.vName as GonV,u2.userName as AlU,v2.vName as AlV,m.odun,m.kil,m.demir from MarketRapor m,Villages v,Villages v2,Users u,Users u2 "+
	                "where m.sendervID=v.vID and m.gettervID=v2.vID and v.uID=u.userID and v2.uID=u2.userID and m.reportID=@a", con);
                sc.Parameters.AddWithValue("@a", reportID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // ticaret raporunun içeriğini getir

        public DataTable GidenMaden(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select m.islemID,v2.vName,m.odun,m.kil,m.demir,m.mCount, "+
	                    "left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),m.gtime),'01/01/1901 0:0:0.000'),121),12),8) as Sure, "+
	                    "convert(VARCHAR, m.gtime, 0) as endtime "+
	                    "from MarketIslem m,Villages v,Villages v2 "+
	                    "where m.vID=v.vID and m.gvID=v2.vID and m.vID=@a and m.issended=0", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // giden tüccarların listesini getir

        public DataTable DonenMaden(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select m.islemID,'Dönüyor: '+v.vName as vName,'' as odun,'' as kil,'' as demir,m.mCount, "+
	                    "left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),m.rtime),'01/01/1901 0:0:0.000'),121),12),8) as Sure, "+
	                    "convert(VARCHAR, m.rtime, 0) as endtime "+
	                    "from MarketIslem m,Villages v,Villages v2 "+
	                    "where m.vID=v.vID and m.gvID=v2.vID and m.vID=@a and m.issended=1", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // dönen tüccarların listesini getir

        public DataTable GelenMaden(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select m.islemID,'Geliyor: '+v.vName+'nden' as vName,m.odun,m.kil,m.demir,m.mCount, "+
	                    "left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),m.gtime),'01/01/1901 0:0:0.000'),121),12),8) as Sure, "+
	                    "convert(VARCHAR, m.gtime, 0) as endtime "+
	                    "from MarketIslem m,Villages v,Villages v2 "+
	                    "where m.vID=v.vID and m.gvID=v2.vID and m.gvID=@a and m.issended=0", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // gelen tüccarların listesini getir

        public DataTable PazarBilgi(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select convert(VARCHAR, mCount-omCount)+'/'+convert(VARCHAR, mCount) as durum,(mCount-omCount)*1000 as azami from VillageMerchants "+
	                    "where vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // market binası için gerekli bilgileri getir

        public String addMarketIslem(String villageID, int gvID, int kil, int odun, int demir,int mCount ,int sure)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Insert into MarketIslem Values(@vID,@gvID,@kil,@odun,@demir,@mCount,DATEADD(second,@sure,GETDATE()),DATEADD(second,@sure*2,GETDATE()),0)", con);
                sc.Parameters.AddWithValue("@vID", villageID);
                sc.Parameters.AddWithValue("@gvID", gvID);
                sc.Parameters.AddWithValue("@kil", kil);
                sc.Parameters.AddWithValue("@odun", odun);
                sc.Parameters.AddWithValue("@demir", demir);
                sc.Parameters.AddWithValue("@mCount", mCount);
                sc.Parameters.AddWithValue("@sure", sure);
                sc.ExecuteNonQuery();

                return "eklendi";
            }

            catch (Exception ex)
            {
                return ex.ToString();
            }

            finally
            {
                con.Close();
            }
        } // market işlem ekle

        public int getMerInVillage(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select mCount-omCount as Sayi from VillageMerchants where vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch 
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
        } // köydeki tüccarların sayısını getir

        public DataTable getUnits()
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select u1price as Odun,u2price as Kil,u3price as Demir,uPopulation, "+
	                    "left(right(convert(varchar,dateadd(second,uTime,'01/01/1901 0:0:0.000'),121),12),8) as Sure "+
	                    "from Units order by uID asc", con);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // asker türlerinin bilgilerini getir

        public DataTable BarracksTrainList(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select a.islemID,u.uName,a.sayi, "+
	                    "left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),a.enddate),'01/01/1901 0:0:0.000'),121),12),8) as Sure "+
	                    ",convert(VARCHAR, a.enddate, 0) as endtime "+
	                    "from AskerIslem a inner join Units u on u.uID=a.uID where u.uID<4 and a.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // kışlada yetiştirilen askerlerin listesini getir

        public DataTable PalaceTrainList(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select a.islemID,u.uName,a.sayi, " +
                        "left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),a.enddate),'01/01/1901 0:0:0.000'),121),12),8) as Sure " +
                        ",convert(VARCHAR, a.enddate, 0) as endtime " +
                        "from AskerIslem a inner join Units u on u.uID=a.uID where u.uID=7 and a.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // sarayda yetiştirilen askerlerin listesini getir

        public String addAskerIslem(String villageID, int uID, int sayi ,int kil, int odun, int demir, String sure,int birimsure,int tur)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Insert into AskerIslem Values(@vID,@uID,@sayi,@kil,@odun,@demir,(select ISNULL(MAX(enddate),GETDATE()) as Maxendtime from AskerIslem where uID>@i and uID<@j and vID=@vID)+@sure,DATEADD(second,@tsure,(select ISNULL(MAX(enddate),GETDATE()) as Maxendtime from AskerIslem where uID>@i and uID<@j and vID=@vID)),0)", con);
                sc.Parameters.AddWithValue("@vID", villageID);
                sc.Parameters.AddWithValue("@uID", uID);
                sc.Parameters.AddWithValue("@sayi", sayi);
                sc.Parameters.AddWithValue("@kil", kil);
                sc.Parameters.AddWithValue("@odun", odun);
                sc.Parameters.AddWithValue("@demir", demir);
                sc.Parameters.AddWithValue("@sure", sure);
                sc.Parameters.AddWithValue("@tsure", sayi*birimsure);
                int i, j;
                if (tur == 0)
                {
                    i = 0;
                    j = 4;
                }
                else if (tur == 1)
                {
                    i = 3;
                    j = 7;
                }
                else
                {
                    i = 6;
                    j = 8;
                }
                sc.Parameters.AddWithValue("@i", i);
                sc.Parameters.AddWithValue("@j", j);
                sc.ExecuteNonQuery();

                return "eklendi";
            }

            catch (Exception ex)
            {
                return ex.ToString();
            }

            finally
            {
                con.Close();
            }
        }

        public DataTable StableTrainList(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select a.islemID,u.uName,a.sayi, " +
                        "left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),a.enddate),'01/01/1901 0:0:0.000'),121),12),8) as Sure " +
                        ",convert(VARCHAR, a.enddate, 0) as endtime " +
                        "from AskerIslem a inner join Units u on u.uID=a.uID where u.uID>3 and u.uID<7 and a.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // ahırda yetiştirilen askerlerin listesini getir

        public int getMisyonerCount(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("  Select u.uCount+s.total as total from VillageUnits u,(Select ISNULL(SUM(sayi),0) as total from AskerIslem where uID=7 and vID=@a) as s where u.uID=7 and u.vID=@a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        } // misyoner sayısını getir

        public DataTable KomutaBilgi(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select uCount-ouCount as Sayi from VillageUnits where vID=@a order by uID", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // komuta merkezinde köydeki askerlerin bilgisini getir

        public DataTable DKomutaBilgi(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select ouCount as Sayi from VillageUnits where vID=@a order by uID", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // komuta merkezinde köy dışındaki askerlerin bilgisini getir

        public DataTable getSoldiers(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("select uCount-ouCount as Sayi from VillageUnits where vID=@a order by uID", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public String updateSaldiriOrdu(int[] ordu,int islemID)
        {
            try
            {
                con.Open();
                for (int i = 0; i < 7; i++)
                {
                    using (SqlCommand sc = new SqlCommand("Update SaldiriOrdu set uCount=@i where islemID=@islemID and uID=@uid", con))
                    {
                        sc.Parameters.AddWithValue("@islemID", islemID);
                        sc.Parameters.AddWithValue("@i", ordu[i]);
                        sc.Parameters.AddWithValue("@uid", i+1);
                        sc.ExecuteNonQuery();
                    }
                }
                return "okundu";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // saldiriordu tablosunu güncelle

        public int getIslemID(String villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select MAX(islemID) as islemID from SaldiriIslem where vID = @a", con);
                sc.Parameters.AddWithValue("@a", villageID);
                int count = (int)sc.ExecuteScalar();

                return count;
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        } // islem id yi getir

        public DataTable GidenSaldiri(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select s.islemID,'Gidiyor : '+v.vName+'ne' as vName,left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),s.gtime),'01/01/1901 0:0:0.000'),121),12),8) as Sure, "+
	                    "convert(VARCHAR, s.gtime, 0) as endtime from SaldiriIslem s inner join Villages v on s.gvID=v.vID where s.vID=@a and s.issended=0", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // giden saldırıları getir

        public DataTable DonenSaldiri(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select s.islemID,'Dönüyor :'+v.vName+'ne' as vName,left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),s.rtime),'01/01/1901 0:0:0.000'),121),12),8) as Sure, " +
	                    "convert(VARCHAR, s.rtime, 0) as endtime from SaldiriIslem s inner join Villages v on s.vID=v.vID where s.vID=@a and s.issended=1", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // dönen saldırıları getir

        public DataTable GelenSaldiri(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select s.islemID,'Geliyor : '+v.vName+'nden' as vName,left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),s.gtime),'01/01/1901 0:0:0.000'),121),12),8) as Sure, " +
	                    "convert(VARCHAR, s.gtime, 0) as endtime from SaldiriIslem s inner join Villages v on s.vID=v.vID where gvID=@a and s.issended=0", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // gelen saldırıları getir

        public String addSaldiriIslem(String villageID, int gvID, int sure)
        {
            try
            {
                con.Open();
                using (SqlCommand sc = new SqlCommand("Insert into SaldiriIslem Values(@vID,@gvID,GETDATE(),DATEADD(second,@sure,GETDATE()),DATEADD(second,@sure*2,GETDATE()),0,0,0,0)", con))
                {
                    sc.Parameters.AddWithValue("@vID", villageID);
                    sc.Parameters.AddWithValue("@gvID", gvID);
                    sc.Parameters.AddWithValue("@sure", sure);
                    sc.ExecuteNonQuery();
                }
                /*using (SqlCommand sc = new SqlCommand("Select MAX(islemID) from SaldiriIslem where vID=@vID and gvID=@gvID", con))
                {

                    sc.Parameters.AddWithValue("@vID", villageID);
                    sc.Parameters.AddWithValue("@gvID", villageID);
                    int count = (int)sc.ExecuteScalar();
                    return count.ToString();
                }*/
                return "eklendi";
            }

            catch (Exception ex)
            {
                return ex.ToString();
            }

            finally
            {
                con.Close();
            }
        } // saldırı işlem ekle

        public DataTable GidenSaldiriDef(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select '->  '+v.vName as vName,left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),s.gtime),'01/01/1901 0:0:0.000'),121),12),8) as Sure "+
	                    "from SaldiriIslem s inner join Villages v on s.gvID=v.vID where s.vID=@a and s.issended=0", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // ana sayfa için giden saldırıları getir

        public DataTable GelenSaldiriDef(string villageID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select '<-  '+v.vName as vName,left(right(convert(varchar,dateadd(second,DATEDIFF(s,GETDATE(),s.gtime),'01/01/1901 0:0:0.000'),121),12),8) as Sure "+
	                    "from SaldiriIslem s inner join Villages v on s.vID=v.vID where gvID=@a and s.issended=0", con);
                sc.Parameters.AddWithValue("@a", villageID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // ana sayfa için gelen saldırıları getir

        public DataTable SaldırıRapor(string userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select r.reportID,v.vName+' '+v2.vName+'ne saldırdı.' as Konu,r.date as senddate,issendread as Okundumu from SaldiriRapor r,Villages v,Villages v2,Users u "+
	                    "where r.vID=v.vID and r.gvID=v2.vID and u.userID=v.uID and issenddelete=0 and u.userID=@a order by r.date desc", con);
                sc.Parameters.AddWithValue("@a", userID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // saldırı raporlarını getir

        public DataTable SavunmaRapor(string userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select r.reportID,v.vName+' '+v2.vName+'ne saldırdı.' as Konu,r.date as senddate,isgetread as Okundumu from SaldiriRapor r,Villages v,Villages v2,Users u "+
	                    "where r.vID=v.vID and r.gvID=v2.vID and u.userID=v2.uID and isgetdelete=0 and u.userID=@a order by r.date desc", con);
                sc.Parameters.AddWithValue("@a", userID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // savunma raporlarını getir

        public String deleteSaldırıReport(String reportID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update SaldiriRapor set issenddelete = 1 where reportID=@b", con);
                sc.Parameters.AddWithValue("@b", reportID);
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "silindi";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // saldırı raporunu sil

        public String deleteSavunmaReport(String reportID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update MarketRapor set isgetdelete 1 where reportID=@b", con);
                sc.Parameters.AddWithValue("@b", reportID);
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "silindi";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // savunma raporunu sil

        public DataTable RaporIcerik(string reportID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select s.reportID,case winner when 1 then 'Savunan Kazandı' else 'Saldıran Kazandı' end as winner,s.date as senddate, "+
                                               "u.userName,v.vName,CONVERT(nvarchar,v.vX) + '|' + CONVERT(nvarchar,v.vY) as vACoordinate," +
                                               "u2.userName as userName2,v2.vName as vName2,CONVERT(nvarchar,v2.vX) + '|' + CONVERT(nvarchar,v2.vY) as vDCoordinate," +
                                               "case ismisyoner when 1 then 'Köyün bağlılığı '+CONVERT(nvarchar,s.misyonerred)+ " +
	                    "' azaldı.' else '' end as durum,s.kil,s.odun,s.demir,case isscouted when 1 then wkil else '-' end as wkil, "+
	                    "case isscouted when 1 then wodun else '-' end as wodun,case isscouted when 1 then wdemir else '-' end as wdemir, "+
	                    "case isscouted when 1 then walllevel else '-' end as walllevel from SaldiriRapor s,Villages v,Villages v2,Users u,Users u2 "+
	                    "where s.vID=v.vID and s.gvID=v2.vID and v.uID=u.userID and v2.uID=u2.userID and s.reportID=@a", con);
                sc.Parameters.AddWithValue("@a", reportID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // raporun içeriğini getir

        public DataTable RaporOrduIcerik(string reportID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select sCount,skCount,dCount,dkCount from RaporOrdu where reportID=@a order by uID", con);
                sc.Parameters.AddWithValue("@a", reportID);
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } // raporun ordu içeriğini getir

        public String DeleteSaldiriIslem(String islemID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update SaldiriIslem set rtime = DATEADD(second,DATEDIFF(second,stime,GETDATE()),GETDATE()),issended=1 where islemID=@a", con);
                sc.Parameters.AddWithValue("@a", islemID);
                sc.ExecuteNonQuery();

                return "eklendi";
            }

            catch (Exception ex)
            {
                return ex.ToString();
            }

            finally
            {
                con.Close();
            }
        } // saldırı işlemi sil

        public string getnewreportcount(String userID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select (case s.Toplam when 0 then '' else '('+ Cast(s.Toplam as nvarchar)+')' end) as New "+
	                    "from (Select (Select ISNULL(Count(*),0) from SaldiriRapor s,Villages v,Users u where s.vID=v.vID and v.uID=u.userID and userID=@a and issendread=0 and issenddelete=0)+ "+
		                     "(Select ISNULL(Count(*),0) from SaldiriRapor s,Villages v,Users u where s.gvID=v.vID and v.uID=u.userID and userID=@a and isgetread=0 and isgetdelete=0) "+
		                     "as Toplam) s", con);
                sc.Parameters.AddWithValue("@a", userID);
                String count = (String)sc.ExecuteScalar();

                return count.ToString();
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
            finally
            {
                con.Close();
            }
        } // yeni rapor sayısını getir

        public String setSaldirirepreaded(String reportID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update SaldiriRapor set issendread = 1 where reportID = @a", con);
                sc.Parameters.AddWithValue("@a", Convert.ToInt32(reportID));
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "okundu";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // saldırı raporu okundu işaretle

        public String setSavunmarepreaded(String reportID)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Update SaldiriRapor set isgetread = 1 where reportID = @a", con);
                sc.Parameters.AddWithValue("@a", Convert.ToInt32(reportID));
                sc.ExecuteNonQuery();
                //int count = (int)sc.ExecuteScalar();

                //return count.ToString();
                return "okundu";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
            }
        } // savunma raporu okundu işaretle


        public DataTable getBinaMadenGereksinimleri(string vId, string bId)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select Price, bp.rId from BuildingPrices bp where bp.bID = @bId and " +
                                               "bp.bLevel = (Select top 1 bLevel + 1 + (Select COUNT(*) from BinaIslem where vID = @vId and bID = @bId) " +
                                               "from VillageBuildings vb where vb.vID = @vId and vb.bID = @bId) order by bp.rId", con);
                sc.Parameters.AddWithValue("@vId", Convert.ToInt32(vId));
                sc.Parameters.AddWithValue("@bId", Convert.ToInt32(bId));
                sc.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sc;

                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;

            }

            catch
            {
                return null;
            }

            finally
            {
                con.Close();
            }
        } // Bina maden gereksinimlerini getir
        
        public string getBinaInsaatSure(string villageId, string bId)
        {
            try
            {
                con.Open();
                SqlCommand sc = new SqlCommand("Select left(bt.time,8) from BuildTime bt where bt.bLevel = (Select top 1 bLevel+1 from VillageBuildings vb where vb.vID=@vId and vb.bID=@bId) and bt.bID = @bId", con);
                sc.Parameters.AddWithValue("@vId", Convert.ToInt32(villageId));
                sc.Parameters.AddWithValue("@bId", Convert.ToInt32(bId));
                String veri = (String)sc.ExecuteScalar();

                return veri.ToString();
            }
            catch
            {
                return "###BOŞ DÖNDÜ###";
            }
            finally
            {
                con.Close();
            }
        } // mesajın göndericisini getir

    }
}