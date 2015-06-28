
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace wfKamAirlines
{
    class cPersonel
    {
        private int _personelID;
        private string _personelAdi;
        private string _personelSoyadi;
        private string _kullaniciAdi;
        private string _kullaniciSifresi;
        private int _yetkiTipiID;
        private string _mail;
        private string _telefon;
        private string _personelTCK;
        private string _adres;
        private bool _uygunluk;
        private int _ustuID;
        private string _ustuAd;

        private DateTime _iseBaslamaTarihi;
        private int _gorevID;
        private string _gorevAdi;

        public string GorevAdi
        {
            get { return _gorevAdi; }
            set { _gorevAdi = value; }
        }
        public string UstuAd
        {
            get { return _ustuAd; }
            set { _ustuAd = value; }
        }
        private string _pAdSoyad;

        public string PAdSoyad
        {
            get { return _pAdSoyad; }
            set { _pAdSoyad = value; }
        }

        #region Properties

        public int PersonelID
        {
            get { return _personelID; }
            set { _personelID = value; }
        }
        public string PersonelAdi
        {
            get { return _personelAdi; }
            set { _personelAdi = value; }
        }
        public string PersonelSoyadi
        {
            get { return _personelSoyadi; }
            set { _personelSoyadi = value; }
        }
        public string KullaniciAdi
        {
            get { return _kullaniciAdi; }
            set { _kullaniciAdi = value; }
        }
        public string KullaniciSifresi
        {
            get { return _kullaniciSifresi; }
            set { _kullaniciSifresi = value; }
        }
        public int YetkiTipi
        {
            get { return _yetkiTipiID; }
            set { _yetkiTipiID = value; }
        }
        public string Mail
        {
            get { return _mail; }
            set { _mail = value; }
        }
        public string Telefon
        {
            get { return _telefon; }
            set { _telefon = value; }
        }
        public string PersonelTCK
        {
            get { return _personelTCK; }
            set { _personelTCK = value; }
        }
        public string Adres
        {
            get { return _adres; }
            set { _adres = value; }
        }
        public bool Uygunluk
        {
            get { return _uygunluk; }
            set { _uygunluk = value; }
        }
        public int Ustu
        {
            get { return _ustuID; }
            set { _ustuID = value; }
        }
        public DateTime IseBaslamaTarihi
        {
            get { return _iseBaslamaTarihi; }
            set { _iseBaslamaTarihi = value; }
        }
        public int GorevID
        {
            get { return _gorevID; }
            set { _gorevID = value; }
        }
        #endregion
        cGenel gnl = new cGenel();
        public void PilotGetir(ComboBox liste)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select PersonelID, (PersonelAdi + ' ' + PersonelSoyadi) as Adsoyad from Personeller where Silindi = 0 and GorevID = 1 and Uygunluk = 1", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    cPersonel p = new cPersonel();

                    p._personelID = Convert.ToInt32(dr[0]);
                    p._personelAdi = dr[1].ToString();
                    liste.Items.Add(p);
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }
        public void KabinEkibiGetir(ComboBox list)
        {
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select PersonelID, (PersonelAdi + ' ' + PersonelSoyadi) as Adsoyad from Personeller where silindi = 0 and GorevID = 3 and Uygunluk = 1", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    cPersonel p = new cPersonel();

                    p._personelID = Convert.ToInt32(dr[0]);
                    p._personelAdi = dr[1].ToString();
                    list.Items.Add(p);
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }
        public override string ToString()
        {
            return PersonelAdi;
        }
        public void BakimMuhGetir(ComboBox list)
        {
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select PersonelID, (PersonelAdi + ' ' + PersonelSoyadi) as Adsoyad from Personeller where silindi = 0 and GorevID = 5 and Uygunluk = 1", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    cPersonel p = new cPersonel();

                    p._personelID = Convert.ToInt32(dr[0]);
                    p._personelAdi = dr[1].ToString();
                    list.Items.Add(p);
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }

        public void GetAllPersonel(ListView liste)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select p.PersonelID, p.PersonelAdi, p.PersonelSoyadi  , p.PersonelTCK,p.KullaniciAdi,p.KullaniciSifresi,p.GorevID,g.GorevAd,p.UstuID,pe.PersonelAdi +' '+pe.PersonelSoyadi as Ust, p.YetkiTipiID, y.YetkiliAd,p.Telefon,p.Mail,p.IseBaslamaTarihi,p.Adres from Personeller as p inner join Gorevler as g on g.GorevID=p.GorevID inner join Yetki as y on y.YetkiliID=p.YetkiTipiID  left join Personeller as pe on p.UstuID=pe.PersonelID where p.Silindi = 0", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                int i = 0;
                while (dr.Read())
                {
                    liste.Items.Add(dr[0].ToString());
                    liste.Items[i].SubItems.Add((dr[1]).ToString());
                    liste.Items[i].SubItems.Add(dr[2].ToString());
                    liste.Items[i].SubItems.Add(dr[3].ToString());
                    liste.Items[i].SubItems.Add(dr[4].ToString());
                    liste.Items[i].SubItems.Add(dr[5].ToString());
                    liste.Items[i].SubItems.Add(dr[6].ToString());
                    liste.Items[i].SubItems.Add(dr[7].ToString());
                    liste.Items[i].SubItems.Add(dr[8].ToString());
                    liste.Items[i].SubItems.Add(dr[9].ToString());
                    liste.Items[i].SubItems.Add(dr[10].ToString());
                    liste.Items[i].SubItems.Add(dr[11].ToString());
                    liste.Items[i].SubItems.Add(dr[12].ToString());
                    liste.Items[i].SubItems.Add(dr[13].ToString());
                    liste.Items[i].SubItems.Add(dr[14].ToString());
                    liste.Items[i].SubItems.Add(dr[15].ToString());
                    i++;
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }

        public void UstuGetir(ComboBox list, int ID)
        {
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select PersonelID, (PersonelAdi + ' ' + PersonelSoyadi) as Adsoyad from Personeller where silindi = 0 and GorevID=@GorevID - 1", conn);
            comm.Parameters.Add("@GorevID", SqlDbType.Int).Value = ID;
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    cPersonel p = new cPersonel();

                    p._personelID = Convert.ToInt32(dr[0]);
                    p._personelAdi = dr[1].ToString();
                    list.Items.Add(p);
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }

        public void GetAllPersonelLoadArama(ListView liste)
        {
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select p.PersonelID, p.PersonelAdi + ' ' + p.PersonelSoyadi as AdiSoyadi, p.PersonelTCK,p.GorevID,g.GorevAd,p.UstuID,pe.PersonelAdi +' '+pe.PersonelSoyadi as Ust, p.YetkiTipiID, y.YetkiliAd,p.Telefon,p.Mail,p.IseBaslamaTarihi,p.Adres from Personeller as p inner join Gorevler as g on g.GorevID=p.GorevID inner join Yetki as y on y.YetkiliID=p.YetkiTipiID  left join Personeller as pe on p.UstuID=pe.PersonelID where p.Silindi = 0", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                int i = 0;
                while (dr.Read())
                {
                    liste.Items.Add(dr[0].ToString());
                    liste.Items[i].SubItems.Add(dr[1].ToString());
                    liste.Items[i].SubItems.Add(dr[2].ToString());
                    liste.Items[i].SubItems.Add(dr[3].ToString());
                    liste.Items[i].SubItems.Add(dr[4].ToString());
                    liste.Items[i].SubItems.Add(dr[5].ToString());
                    liste.Items[i].SubItems.Add(dr[6].ToString());
                    liste.Items[i].SubItems.Add(dr[7].ToString());
                    liste.Items[i].SubItems.Add(dr[8].ToString());
                    liste.Items[i].SubItems.Add(dr[9].ToString());
                    liste.Items[i].SubItems.Add(dr[10].ToString());
                    liste.Items[i].SubItems.Add(dr[11].ToString());
                    liste.Items[i].SubItems.Add(dr[12].ToString());
                    i++;
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }

        public void GetAllPersonelByARAMA(ListView liste, string Arama)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select p.PersonelID, p.PersonelAdi + ' ' + p.PersonelSoyadi as AdiSoyadi, p.PersonelTCK,p.GorevID,g.GorevAd,p.UstuID,pe.PersonelAdi +' '+pe.PersonelSoyadi as Ust, p.YetkiTipiID, y.YetkiliAd,p.Telefon,p.Mail,p.IseBaslamaTarihi,p.Adres from Personeller as p inner join Gorevler as g on g.GorevID=p.GorevID inner join Yetki as y on y.YetkiliID=p.YetkiTipiID  left join Personeller as pe on p.UstuID=pe.PersonelID where p.Silindi = 0 and (p.PersonelAdi + ' ' + p.PersonelSoyadi) like @Arama  + '%'  or p.PersonelTCK like @Arama +'%' or g.GorevAd like @Arama +'%' or (pe.PersonelAdi +' '+pe.PersonelSoyadi) like @Arama +'%' or y.YetkiliAd  like @Arama +'%'", conn);
            comm.Parameters.Add("@Arama", SqlDbType.VarChar).Value = Arama;
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                int i = 0;
                while (dr.Read())
                {
                    liste.Items.Add(dr[0].ToString());
                    liste.Items[i].SubItems.Add(dr[1].ToString());
                    liste.Items[i].SubItems.Add(dr[2].ToString());
                    liste.Items[i].SubItems.Add(dr[3].ToString());
                    liste.Items[i].SubItems.Add(dr[4].ToString());
                    liste.Items[i].SubItems.Add(dr[5].ToString());
                    liste.Items[i].SubItems.Add(dr[6].ToString());
                    liste.Items[i].SubItems.Add(dr[7].ToString());
                    liste.Items[i].SubItems.Add(dr[8].ToString());
                    liste.Items[i].SubItems.Add(dr[9].ToString());
                    liste.Items[i].SubItems.Add(dr[10].ToString());
                    liste.Items[i].SubItems.Add(dr[11].ToString());
                    liste.Items[i].SubItems.Add(dr[12].ToString());
                    i++;
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }

        public bool PersonelSil(int ID)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_PersonelSil", conn);
            comm.CommandType = CommandType.StoredProcedure;
            if (conn.State == ConnectionState.Closed) conn.Open();
            try
            {
                comm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
                sonuc = Convert.ToBoolean(comm.ExecuteNonQuery());
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
            return sonuc;
        }

        public bool PersonelGuncelle(cPersonel p)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_PersonelGuncelle", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@ID", SqlDbType.Int).Value = p._personelID;
            comm.Parameters.Add("@Ad", SqlDbType.VarChar).Value = p._personelAdi;
            comm.Parameters.Add("@Soyad", SqlDbType.VarChar).Value = p._personelSoyadi;
            comm.Parameters.Add("@TcNo", SqlDbType.VarChar).Value = p._personelTCK;
            comm.Parameters.Add("@KAdi", SqlDbType.VarChar).Value = p._kullaniciAdi;
            comm.Parameters.Add("KSifre", SqlDbType.VarChar).Value = p._kullaniciSifresi;
            comm.Parameters.Add("@GorevID", SqlDbType.Int).Value = p._gorevID;
            comm.Parameters.Add("@UstuID", SqlDbType.Int).Value = p._ustuID;
            comm.Parameters.Add("@YetkiID", SqlDbType.Int).Value = p._yetkiTipiID;
            comm.Parameters.Add("@Telefon", SqlDbType.VarChar).Value = p._telefon;
            comm.Parameters.Add("@Mail", SqlDbType.VarChar).Value = p._mail;
            comm.Parameters.Add("@IBT", SqlDbType.DateTime).Value = p._iseBaslamaTarihi;
            comm.Parameters.Add("@Adres", SqlDbType.VarChar).Value = p._adres;
            if (conn.State == ConnectionState.Closed) conn.Open();
            try
            {
                sonuc = Convert.ToBoolean(comm.ExecuteNonQuery());
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
            return sonuc;
        }

        public bool PersonelEkle(cPersonel p)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_PersonelEkle", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@Ad", SqlDbType.VarChar).Value = p._personelAdi;
            comm.Parameters.Add("@Soyad", SqlDbType.VarChar).Value = p._personelSoyadi;
            comm.Parameters.Add("@TcNo", SqlDbType.VarChar).Value = p._personelTCK;
            comm.Parameters.Add("@KAdi", SqlDbType.VarChar).Value = p._kullaniciAdi;
            comm.Parameters.Add("@KSifre", SqlDbType.VarChar).Value = p._kullaniciSifresi;
            comm.Parameters.Add("GorevID", SqlDbType.Int).Value = p._gorevID;
            comm.Parameters.Add("UstuID", SqlDbType.Int).Value = p._ustuID;
            comm.Parameters.Add("@YetkiID", SqlDbType.Int).Value = p._yetkiTipiID;
            comm.Parameters.Add("@Telefon", SqlDbType.VarChar).Value = p._telefon;
            comm.Parameters.Add("@Mail", SqlDbType.VarChar).Value = p._mail;
            comm.Parameters.Add("@IBT", SqlDbType.DateTime).Value = p._iseBaslamaTarihi;
            comm.Parameters.Add("@Adres", SqlDbType.VarChar).Value = p._adres;
            if (conn.State == ConnectionState.Closed) conn.Open();
            try
            {
                sonuc = Convert.ToBoolean(comm.ExecuteNonQuery());
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
            return sonuc;
        }

        public DataTable PersonelHareketleri(string Arama, int GID, DateTime B, DateTime S)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            string strQuery="";
            if(GID==1)
                strQuery = "select (p.PersonelAdi + ' ' + p.PersonelSoyadi) as Pilot, h.HavaAlaniAdi as Nereden, ha.HavaAlaniAdi as Nereye,u.TahminiKalkis,u.TahminiVaris from Ucuslar as u inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID inner join Personeller as p on p.PersonelID= u.PilotID where u.Silindi=0 and ((p.PersonelAdi like @Adi+'%' or p.PersonelSoyadi like @Soyadi+'%') or u.TahminiKalkis between @TarihB and @TarihS) order by u.TahminiKalkis";
            else if (GID == 2) 
            {
                strQuery = "select (p.PersonelAdi+' '+ p.PersonelSoyadi) as CoPilot ,h.HavaAlaniAdi as Nereden, ha.HavaAlaniAdi as Nereye, u.TahminiKalkis,u.TahminiVaris from Personeller as p inner join Ucuslar as u on u.PilotID=p.UstuID inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID   where p.GorevID=2 and p.Silindi=0 and u.Silindi=0 and ((p.PersonelAdi like @Adi+'%' or p.PersonelSoyadi like @Soyadi+'%') or u.TahminiKalkis between @TarihB and @TarihS) order by u.TahminiKalkis";
            }
            else if (GID == 3)
            {
                strQuery = "select (p.PersonelAdi + ' ' + p.PersonelSoyadi) as KabinAmiri, h.HavaAlaniAdi as Nereden, ha.HavaAlaniAdi as Nereye,u.TahminiKalkis,u.TahminiVaris from Ucuslar as u inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID inner join Personeller as p on p.PersonelID= u.KabinEkibiID where u.Silindi=0 and ((p.PersonelAdi like @Adi+'%' or p.PersonelSoyadi like @Soyadi+'%') or u.TahminiKalkis between @TarihB and @TarihS) order by u.TahminiKalkis";
            }
            else if (GID == 4)
            {
                strQuery = "select (p.PersonelAdi+' '+ p.PersonelSoyadi) as KabinEkibi ,h.HavaAlaniAdi as Nereden, ha.HavaAlaniAdi as Nereye, u.TahminiKalkis,u.TahminiVaris from Personeller as p inner join Ucuslar as u on u.KabinEkibiID=p.UstuID inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID   where p.GorevID=4 and p.Silindi=0 and u.Silindi=0 and ((p.PersonelAdi like @Adi+'%' or p.PersonelSoyadi like @Soyadi+'%') or u.TahminiKalkis between @TarihB and @TarihS) order by u.TahminiKalkis";
            }
            else if (GID == 5)
            {
                strQuery = "select (p.PersonelAdi+' '+ p.PersonelSoyadi) as UcakMuhendisi , u.UcakAdi, u.UcakTuru,u.SonBakimTarihi from Ucaklar as u inner join Personeller as p on p.PersonelID=u.BakiminiYapanMuhendisID where  u.Silindi=0 and p.GorevID=5 and ((p.PersonelAdi like @Adi+'%' or p.PersonelSoyadi like @Soyadi+'%') or u.SonBakimTarihi between @TarihB and @TarihS)";
            }
            else if (GID == 6)
            {
                strQuery = "select (p.PersonelAdi+' '+ p.PersonelSoyadi) as UcakTeknisyeni , u.UcakAdi, u.UcakTuru,u.SonBakimTarihi from Ucaklar as u inner join Personeller as p on p.PersonelID=u.BakiminiYapanMuhendisID where  u.Silindi=0 and p.GorevID=6 and ((p.PersonelAdi like @Adi+'%' or p.PersonelSoyadi like @Soyadi+'%') or u.SonBakimTarihi between @TarihB and @TarihS)";
            }
            else if (GID == 8)
            {
                strQuery = "select (p.PersonelAdi + ' ' + p.PersonelSoyadi) as HareketAmiri, h.HavaAlaniAdi as Nereden, ha.HavaAlaniAdi as Nereye,u.TahminiKalkis,u.TahminiVaris from Ucuslar as u inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID inner join Personeller as p on p.PersonelID= u.PersonelID where u.Silindi=0 and ((p.PersonelAdi like @Adi+'%' or p.PersonelSoyadi like @Soyadi+'%') or u.TahminiKalkis between @TarihB and @TarihS) order by u.TahminiKalkis";
            }



           
            SqlDataAdapter da = new SqlDataAdapter(strQuery, conn);
            da.SelectCommand.Parameters.Add("@Adi", SqlDbType.VarChar).Value = Arama;
            da.SelectCommand.Parameters.Add("@Soyadi", SqlDbType.VarChar).Value = Arama;
            da.SelectCommand.Parameters.Add(new SqlParameter("TarihB", B.ToString("yyyy-MM-dd hh:mm:ss.fff")));
            da.SelectCommand.Parameters.Add(new SqlParameter("TarihS", S.ToString("yyyy-MM-dd hh:mm:ss.fff")));
            da.Fill(dt);
            return dt;
        }

    }
}
