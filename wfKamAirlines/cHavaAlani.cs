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
    class cHavaAlani
    {
        private int _havaAlaniID;
        private string _havaAlaniAdi;
        private string _kita;
        private string _ulke;
        private string _sehir;

        #region Properties
        public int HavaAlaniID
        {
            get { return _havaAlaniID; }
            set { _havaAlaniID = value; }
        }

        public string HavaAlaniAdi
        {
            get { return _havaAlaniAdi; }
            set { _havaAlaniAdi = value; }
        }

        public string Kita
        {
            get { return _kita; }
            set { _kita = value; }
        }

        public string Ulke
        {
            get { return _ulke; }
            set { _ulke = value; }
        }

        public string Sehir
        {
            get { return _sehir; }
            set { _sehir = value; }
        }
        #endregion

        cGenel gnl = new cGenel();

        public void HavaAlaniBilgileriGetirNeredenByKita(ComboBox liste, string kita)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select Ulke from HavaAlanlari where kita=@kita group by Ulke", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            comm.Parameters.Add("@kita", SqlDbType.VarChar).Value = kita;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    liste.Items.Add(dr[0].ToString());
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }

        public void HavaAlaniBilgileriGetirNeredenByUlke(ComboBox liste, string ulke, string kita)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select HavaAlaniID,HavaalaniAdi from HavaAlanlari where ulke=@ulke and kita=@kita ", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            comm.Parameters.Add("@ulke", SqlDbType.VarChar).Value = ulke;
            comm.Parameters.Add("@kita", SqlDbType.VarChar).Value = kita;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    cHavaAlani ha = new cHavaAlani();
                    ha._havaAlaniID = Convert.ToInt32(dr["HavaAlaniID"]);
                    ha._havaAlaniAdi = dr["HavaalaniAdi"].ToString();
                    liste.Items.Add(ha);
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
            return HavaAlaniAdi;
        }

        public void HavaalaniGetir(ListView liste)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select HavaAlaniID,HavaalaniAdi, Kita, Ulke, Sehir from HavaAlanlari where Silindi = 0 ", conn);
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
                    i++;
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
        }

        public bool HAlaniSil(int ID)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_HavaalaniSil", conn);
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

        public bool HAlaniEkle(cHavaAlani ha)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_HavaalaniEkle", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@HAdi", SqlDbType.VarChar).Value = ha._havaAlaniAdi;
            comm.Parameters.Add("@Kita", SqlDbType.VarChar).Value = ha._kita;
            comm.Parameters.Add("@Ulke", SqlDbType.VarChar).Value = ha._ulke;
            comm.Parameters.Add("@Sehir", SqlDbType.VarChar).Value = ha._sehir;
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

        public bool HAlaniGuncelle(cHavaAlani ha)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_HavaalaniGuncelle", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@ID", SqlDbType.Int).Value = ha._havaAlaniID;
            comm.Parameters.Add("@HAdi", SqlDbType.VarChar).Value = ha._havaAlaniAdi;
            comm.Parameters.Add("@Kita", SqlDbType.VarChar).Value = ha._kita;
            comm.Parameters.Add("@Ulke", SqlDbType.VarChar).Value = ha._ulke;
            comm.Parameters.Add("@Sehir", SqlDbType.VarChar).Value = ha._sehir;
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

        public void KitaGetir(ListView liste)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select Kita from HavaAlanlari group by Kita", conn); //
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    liste.Items.Add(dr[0].ToString());
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }


        public void UlkeGetirByKita(string Kita, ListView list)//
        {
            list.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select Ulke from HavaAlanlari where Kita=@kita  group by Ulke", conn); //
            if (conn.State == ConnectionState.Closed) conn.Open();
            comm.Parameters.Add("@kita", SqlDbType.VarChar).Value = Kita;
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    list.Items.Add(dr[0].ToString());
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }

        public void HAlaniGetirByKitaVeUlke(string Kita, string Ulke, ListView list)//
        {
            list.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select HavaAlaniAdi from HavaAlanlari where  kita = @kita  and ulke =@ulke", conn); //
            if (conn.State == ConnectionState.Closed) conn.Open();
            comm.Parameters.Add("@kita", SqlDbType.VarChar).Value = Kita;
            comm.Parameters.Add("@ulke", SqlDbType.VarChar).Value = Ulke;
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    list.Items.Add(dr[0].ToString());
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }

        public void HAlaniGetir(ListView liste)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select HavaalaniAdi from HavaAlanlari where Silindi = 0 ", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    liste.Items.Add(dr[0].ToString());
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