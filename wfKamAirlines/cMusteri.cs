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
    class cMusteri
    {
        private int _musteriID;
        private string _musteriAdi;
        private string _musteriSoyadi;
        private string _musteriTCKNo;
        private string _telefon;
        private string _email;
        private string _adres;
        private int _satisID;

        #region Properties

        public int MusteriID
        {
            get { return _musteriID; }
            set { _musteriID = value; }
        }
        public string MusteriAdi
        {
            get { return _musteriAdi; }
            set { _musteriAdi = value; }
        }
        public string MusteriSoyadi
        {
            get { return _musteriSoyadi; }
            set { _musteriSoyadi = value; }
        }
        public string MusteriTCKNo
        {
            get { return _musteriTCKNo; }
            set { _musteriTCKNo = value; }
        }
        public string Telefon
        {
            get { return _telefon; }
            set { _telefon = value; }
        }
        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string Adres
        {
            get { return _adres; }
            set { _adres = value; }
        }
        public int SatisID
        {
            get { return _satisID; }
            set { _satisID = value; }
        }
        #endregion

        cGenel gnl = new cGenel();

        public void MusterileriGetir(ListView liste)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select MusteriID, MusteriAdi,MusteriSoyadi, MusteriTCKNo,Telefon,Email, Adres,SatisID  from Musteriler where Silindi = 0 ", conn);
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
                    i++;
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
        }


        public bool MusteriSil(int ID)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_MusteriSil", conn);
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

        public bool MusteriGuncelle(cMusteri m)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_MusteriGuncelle", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@ID", SqlDbType.Int).Value = m._musteriID;
            comm.Parameters.Add("@Ad", SqlDbType.VarChar).Value = m._musteriAdi;
            comm.Parameters.Add("@Soyad", SqlDbType.VarChar).Value = m._musteriSoyadi;
            comm.Parameters.Add("@TcNo", SqlDbType.VarChar).Value = m._musteriTCKNo;
            comm.Parameters.Add("@Telefon", SqlDbType.VarChar).Value = m._telefon;
            comm.Parameters.Add("@Mail", SqlDbType.VarChar).Value = m._email;
            comm.Parameters.Add("@Adres", SqlDbType.VarChar).Value = m._adres;
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

        public bool MusteriEkle(cMusteri m)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_MusteriEkle", conn);
            comm.CommandType = CommandType.StoredProcedure; ;
            comm.Parameters.Add("@Ad", SqlDbType.VarChar).Value = m._musteriAdi;
            comm.Parameters.Add("@Soyad", SqlDbType.VarChar).Value = m._musteriSoyadi;
            comm.Parameters.Add("@TcNo", SqlDbType.VarChar).Value = m._musteriTCKNo;
            comm.Parameters.Add("@Telefon", SqlDbType.VarChar).Value = m._telefon;
            comm.Parameters.Add("@Mail", SqlDbType.VarChar).Value = m._email;
            comm.Parameters.Add("@Adres", SqlDbType.VarChar).Value = m._adres;
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


        public void MusteriGetirByArama(ListView liste, string Arama)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select MusteriID, MusteriAdi,MusteriSoyadi, MusteriTCKNo,Telefon,Email, Adres,SatisID from Musteriler where Silindi = 0 and (MusteriAdi like @Arama  + '%' or MusteriSoyadi like @Arama  + '%' or Telefon like @Arama  + '%' or MusteriTCKNo like @Arama  + '%' or Email like @Arama + '%' )", conn);
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
