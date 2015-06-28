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
    class cUcak
    {
        private int _ucakID;
        private string _ucakAdi;
        private string _ucakTuru;
        private int _kontenjani;
        private int _ucusMesafesi;
        private string _ucusSuresi;
        private int _bakiminiYapanMuhendisID;
        private DateTime _sonBakimTarihi;
        private string _bakimAciklamasi;


        #region Properties
        public int UcakID
        {
            get { return _ucakID; }
            set { _ucakID = value; }
        }
        public string UcakAdi
        {
            get { return _ucakAdi; }
            set { _ucakAdi = value; }
        }
        public string UcakTuru
        {
            get { return _ucakTuru; }
            set { _ucakTuru = value; }
        }
        public int Kontenjani
        {
            get { return _kontenjani; }
            set { _kontenjani = value; }
        }
        public int UcusMesafesi
        {
            get { return _ucusMesafesi; }
            set { _ucusMesafesi = value; }
        }
        public string UcusSuresi
        {
            get { return _ucusSuresi; }
            set { _ucusSuresi = value; }
        }
        public int BakiminiYapanMuhendisID
        {
            get { return _bakiminiYapanMuhendisID; }
            set { _bakiminiYapanMuhendisID = value; }
        }
        public DateTime SonBakimTarihi
        {
            get { return _sonBakimTarihi; }
            set { _sonBakimTarihi = value; }
        }
        public string BakimAciklamasi
        {
            get { return _bakimAciklamasi; }
            set { _bakimAciklamasi = value; }
        }
        #endregion
        cGenel gnl = new cGenel();

        public void UcakGetir(ComboBox liste)
        {
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select UcakId,UcakAdi from Ucaklar where silindi = 0 and uygunluk=1", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    cUcak u = new cUcak();
                    u._ucakID = Convert.ToInt32(dr[0]);
                    u._ucakAdi = dr[1].ToString();
                    liste.Items.Add(u);
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
            return UcakAdi;
        }

        public void UcakBilgileriGetir(ListView liste)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select u.UcakID,u.UcakAdi,u.UcakTuru,u.Kontenjani,u.UcusMesafesi,u.UcusSuresi,(p.PersonelAdi + ' ' + p.PersonelSoyadi) as Muhendis, u.SonBakimTarihi,u.BakimAciklamasi, p.PersonelID from Ucaklar as u inner join personeller as p on p.PersonelID = u.BakiminiYapanMuhendisID where u.Silindi = 0 ", conn);
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
                    i++;
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
        }
        public bool UcakSil(int ID)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_UcakSil", conn);
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


        public bool UcaklariGuncelle(cUcak u)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_UcakGuncelle", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@ID", SqlDbType.Int).Value = u._ucakID;
            comm.Parameters.Add("@UcakAdi", SqlDbType.VarChar).Value = u._ucakAdi;
            comm.Parameters.Add("@UcakTuru", SqlDbType.VarChar).Value = u._ucakTuru;
            comm.Parameters.Add("@Kontenjani", SqlDbType.Int).Value = u._kontenjani;
            comm.Parameters.Add("@UMesafesi", SqlDbType.Int).Value = u._ucusMesafesi;
            comm.Parameters.Add("@USuresi", SqlDbType.VarChar).Value = u._ucusSuresi;
            comm.Parameters.Add("@BYMID", SqlDbType.Int).Value = u._bakiminiYapanMuhendisID;
            comm.Parameters.Add("@SBT", SqlDbType.DateTime).Value = u._sonBakimTarihi;
            comm.Parameters.Add("@BAciklamasi", SqlDbType.VarChar).Value = u._bakimAciklamasi;
            
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

        public bool UcakEkle(cUcak u)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_UcakEkle", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@UcakAdi", SqlDbType.VarChar).Value = u._ucakAdi;
            comm.Parameters.Add("@UcakTuru", SqlDbType.VarChar).Value = u._ucakTuru;
            comm.Parameters.Add("@Kontenjani", SqlDbType.Int).Value = u._kontenjani;
            comm.Parameters.Add("@UMesafesi", SqlDbType.Int).Value = u._ucusMesafesi;
            comm.Parameters.Add("@USuresi", SqlDbType.VarChar).Value = u._ucusSuresi;
            comm.Parameters.Add("@BYMID", SqlDbType.Int).Value = u._bakiminiYapanMuhendisID;
            comm.Parameters.Add("@SBT", SqlDbType.DateTime).Value = u._sonBakimTarihi;
            comm.Parameters.Add("@BAciklamasi", SqlDbType.VarChar).Value = u._bakimAciklamasi;

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

        public void UcakSorguAll(ListView liste)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select u.UcakAdi,u.UcakTuru,u.Kontenjani, (p.PersonelAdi + ' ' + p.PersonelSoyadi) as BakYapMuhendis,p.PersonelTCK,p.Telefon, u.BakimAciklamasi from Ucaklar as u inner join Personeller as p on u.BakiminiYapanMuhendisID = p.PersonelID Where u.Silindi=0", conn);

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
                    i++;
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }

        public void UcakSorgu(ListView liste, string Arama)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select u.UcakAdi,u.UcakTuru,u.Kontenjani, (p.PersonelAdi + ' ' + p.PersonelSoyadi) as BakYapMuhendis,p.PersonelTCK,p.Telefon, u.BakimAciklamasi from Ucaklar as u inner join Personeller as p on u.BakiminiYapanMuhendisID = p.PersonelID Where u.Silindi=0 and (UcakAdi like @Arama + '%'  or UcakTuru like @Arama +'%' or (p.PersonelAdi + ' ' + p.PersonelSoyadi) like  @Arama+'%' or p.PersonelTCK like @Arama +'%')", conn);
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
                    i++;
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }

    }
}
