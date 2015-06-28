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
    class cGorev
    {
        private int _gorevID;
        private string _gorevAd;
        private string _aciklanma;


        #region Properties
        public int GorevID
        {
            get { return _gorevID; }
            set { _gorevID = value; }
        }
        public string GorevAd
        {
            get { return _gorevAd; }
            set { _gorevAd = value; }
        }
        public string Aciklanma
        {
            get { return _aciklanma; }
            set { _aciklanma = value; }
        }
        #endregion

        cGenel gnl = new cGenel();


        public void GorevGetir(ComboBox list)
        {
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select GorevID,GorevAd from Gorevler where silindi = 0 ", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    cGorev g = new cGorev();
                    g._gorevID = Convert.ToInt32(dr[0]);
                    g._gorevAd = dr[1].ToString();
                    list.Items.Add(g);
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }
        public void GorevGetirH(ComboBox list)
        {
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select GorevID,GorevAd from Gorevler where silindi = 0 ", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    cGorev g = new cGorev();
                    g._gorevID = Convert.ToInt32(dr[0]);
                    g._gorevAd = dr[1].ToString();
                    if (g._gorevID != 7 && g._gorevID != 9)
                    {

                        list.Items.Add(g);
                    }

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
            return GorevAd;
        }

        public void GorevleriGetir(ListView liste)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select * from Gorevler where Silindi = 0", conn);
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
                    i++;
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
        }
        public bool GorevSil(int ID)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_GorevSil", conn);
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
        public bool GorevGuncelle(cGorev g)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_GorevDegistir", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@ID", SqlDbType.Int).Value = g._gorevID;
            comm.Parameters.Add("@GAD", SqlDbType.VarChar).Value = g._gorevAd;
            comm.Parameters.Add("@GAc", SqlDbType.VarChar).Value = g._aciklanma;

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
        public bool GorevEkle(cGorev g)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_GorevEkle", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@GAd", SqlDbType.VarChar).Value = g._gorevAd;
            comm.Parameters.Add("@GAc", SqlDbType.VarChar).Value = g._aciklanma;
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

    }

}
