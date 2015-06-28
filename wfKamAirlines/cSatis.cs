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
    class cSatis
    {
        private int _id;
        private int _mid;
        private int _uid;
        private int _pid;

        public int Pid
        {
            get { return _pid; }
            set { _pid = value; }
        }
        public int Uid
        {
            get { return _uid; }
            set { _uid = value; }
        }
        public int Mid
        {
            get { return _mid; }
            set { _mid = value; }
        }

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        cGenel gnl = new cGenel();

        public void SatisGetir(ListView liste, int uID)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select s.RezervasyonID,u.UcusID, h.HavaAlaniAdi as Nereden, ha.HavaAlaniAdi as Nereye,m.MusteriID,m.MusteriAdi+' '+m.MusteriSoyadi as AdSoyad, u.Ucret as Ucret,u.TahminiKalkis, u.TahminiVaris,uc.Kontenjani,s.Silindi from Satis as s inner join Ucuslar as u on s.UcusKodu=u.UcusID inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID inner join Ucaklar as uc on uc.UcakID = u.UcakID inner join Musteriler as m on s.MusteriID=m.MusteriID where s.Silindi = 0 and s.UcusKodu=@uID", conn);
            comm.Parameters.Add("@uID", SqlDbType.Int).Value = uID.ToString();
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                int i = 0;

                while (dr.Read())
                {
                    liste.Items.Add(dr["RezervasyonID"].ToString());
                    liste.Items[i].SubItems.Add(dr["Nereden"].ToString());
                    liste.Items[i].SubItems.Add(dr["Nereye"].ToString());
                    liste.Items[i].SubItems.Add(dr["MusteriID"].ToString());
                    liste.Items[i].SubItems.Add(dr["AdSoyad"].ToString());
                    liste.Items[i].SubItems.Add(dr["UcusID"].ToString());
                    liste.Items[i].SubItems.Add(dr["Silindi"].ToString());
                    liste.Items[i].SubItems.Add(dr["Ucret"].ToString());
                    liste.Items[i].SubItems.Add(dr["TahminiKalkis"].ToString());
                    i++;


                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            conn.Close();
        }
        public int satisCount(int uID)
        {
            int sc = 0;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select count(*) from Satis where UcusKodu=@uID", conn);
            comm.Parameters.Add("@uID", SqlDbType.Int).Value = uID;
            if (conn.State == ConnectionState.Closed) conn.Open();
            try
            {
                sc = Convert.ToInt32(comm.ExecuteScalar());
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }

            conn.Close();
            return sc;
        }

        public bool satisEkle(cSatis s)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("SatisEkle", conn);
            comm.CommandType = CommandType.StoredProcedure;

            comm.Parameters.Add("@mid", SqlDbType.Int).Value = s.Mid;
            comm.Parameters.Add("@uid", SqlDbType.Int).Value = s.Uid;
            comm.Parameters.Add("@pid", SqlDbType.Int).Value = s.Pid;

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
        public bool satisSil(int Mid)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("SatisSil", conn);
            comm.CommandType = CommandType.StoredProcedure;

            comm.Parameters.Add("@ID", SqlDbType.Int).Value = Mid;


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
        public DataTable SatisGetir()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlDataAdapter da = new SqlDataAdapter("select s.RezervasyonID,u.UcusID, h.HavaAlaniAdi as Nereden, ha.HavaAlaniAdi as Nereye,m.MusteriID,m.MusteriAdi+' '+m.MusteriSoyadi as AdSoyad, u.Ucret as Ucret,u.TahminiKalkis, u.TahminiVaris,uc.Kontenjani,s.Silindi from Satis as s inner join Ucuslar as u on s.UcusKodu=u.UcusID inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID inner join Ucaklar as uc on uc.UcakID = u.UcakID inner join Musteriler as m on s.MusteriID=m.MusteriID where s.Silindi = 0", conn);
            da.Fill(dt);
            return dt;
        }
        public DataTable SatisGetir(string TCK)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlDataAdapter da = new SqlDataAdapter("select s.RezervasyonID,u.UcusID, h.HavaAlaniAdi as Nereden, ha.HavaAlaniAdi as Nereye,m.MusteriID,m.MusteriAdi+' '+m.MusteriSoyadi as AdSoyad, u.Ucret as Ucret,u.TahminiKalkis, u.TahminiVaris,uc.Kontenjani,s.Silindi from Satis as s inner join Ucuslar as u on s.UcusKodu=u.UcusID inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID inner join Ucaklar as uc on uc.UcakID = u.UcakID inner join Musteriler as m on s.MusteriID=m.MusteriID where s.Silindi = 0 and m.MusteriTCKNo like @TCK+'%'", conn);
            da.SelectCommand.Parameters.Add(new SqlParameter("TCK", TCK));
            da.Fill(dt);
            return dt;
        }
    }
}
