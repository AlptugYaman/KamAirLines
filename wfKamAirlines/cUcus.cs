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
    class cUcus
    {
        private int _ucusID;
        private int _neredenID;
        private int _nereyeID;
        private int _mesafe;

        private DateTime _tahminiKalkis;
        private DateTime _tahminiVaris;

        private int _kabinEkibi;
        private int _pilotID;
        private string _pilotAdSoyad;
        private int _kabinEkibiID;
        private string _kabinEkibiAdSoyad;
        private int _personelID;
        private decimal _ucret;
        private int _ucakID;
        private string _ucakTuru;     
        private string _ucakAdi;       

        public DateTime TahminiVaris
        {
            get { return _tahminiVaris; }
            set { _tahminiVaris = value; }
        }
        public DateTime TahminiKalkis
        {
            get { return _tahminiKalkis; }
            set { _tahminiKalkis = value; }
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
        public int KabinEkibiID
        {
            get { return _kabinEkibiID; }
            set { _kabinEkibiID = value; }
        }
        public string KabinEkibiAdSoyad
        {
            get { return _kabinEkibiAdSoyad; }
            set { _kabinEkibiAdSoyad = value; }
        }
        public string PilotAdSoyad
        {
            get { return _pilotAdSoyad; }
            set { _pilotAdSoyad = value; }
        }
        #region Properties

        public int UcusID
        {
            get { return _ucusID; }
            set { _ucusID = value; }
        }

        public int NeredenID
        {
            get { return _neredenID; }
            set { _neredenID = value; }
        }

        public int NereyeID
        {
            get { return _nereyeID; }
            set { _nereyeID = value; }
        }

        public int Mesafe
        {
            get { return _mesafe; }
            set { _mesafe = value; }
        }


        public int KabinEkibi
        {
            get { return _kabinEkibi; }
            set { _kabinEkibi = value; }
        }

        public int PilotID
        {
            get { return _pilotID; }
            set { _pilotID = value; }
        }

        public int PersonelID
        {
            get { return _personelID; }
            set { _personelID = value; }
        }

        public decimal Ucret
        {
            get { return _ucret; }
            set { _ucret = value; }
        }

        public int UcakID
        {
            get { return _ucakID; }
            set { _ucakID = value; }
        }
        #endregion



        cGenel gnl = new cGenel();

        public void UcuslariGetirGenis(ListView liste)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select ucusID, h.Kita, h.Ulke, u.NeredenID, h.HavaAlaniAdi as Nereden, ha.Kita,ha.Ulke,u.NereyeID, ha.HavaAlaniAdi as Nereye,p.PersonelID,(p.PersonelAdi + ' ' + p.PersonelSoyadi) as Pilot, pe.PersonelID,(pe.PersonelAdi +' ' + pe.PersonelSoyadi) as KabinAmiri, u.Ucret, uc.UcakID, uc.UcakAdi, uc.UcakTuru, u.TahminiKalkis, u.TahminiVaris, u.Mesafe from Ucuslar as u inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID inner join Personeller as p on p.PersonelID= u.PilotID inner join Personeller as pe on pe.PersonelID = u.KabinEkibiID inner join Ucaklar as uc on uc.UcakID = u.UcakID where u.Silindi=0 and u.TahminiKalkis > getdate()", conn);
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                int i = 0;

                while (dr.Read())
                {
                    string[] T1 = dr[17].ToString().Split(' ');
                    string[] T2 = dr[18].ToString().Split(' ');
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
                    liste.Items[i].SubItems.Add(dr[13].ToString());
                    liste.Items[i].SubItems.Add(dr[14].ToString());
                    liste.Items[i].SubItems.Add(dr[15].ToString());
                    liste.Items[i].SubItems.Add(dr[16].ToString());
                    liste.Items[i].SubItems.Add(T1[1]);
                    liste.Items[i].SubItems.Add(T2[1]);
                    //liste.Items[i].SubItems.Add(dr[17].ToString());
                    //liste.Items[i].SubItems.Add(dr[18].ToString());
                    liste.Items[i].SubItems.Add(dr[19].ToString()); 
                    liste.Items[i].SubItems.Add(T1[0]);
                    liste.Items[i].SubItems.Add(T2[0]);



                    i++;
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
        }

        public DataTable UcuslarıGetirByNeredenNereye(string K1, string U1, string N1, string K2, string U2, string N2)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlDataAdapter da = new SqlDataAdapter("select u.UcusID, h.Kita as Kıta, h.Ulke as Ülke, h.HavaAlaniAdi as Nereden, ha.Kita as Kıta, ha.Ulke as Ülke, ha.HavaAlaniAdi as Nereye,(p.PersonelAdi + ' ' + p.PersonelSoyadi) as Pilot, (pe.PersonelAdi +' ' + pe.PersonelSoyadi) as [Kabin Amiri],u.Ucret as Ücret,uc.UcakTuru as [Uçak Türü], u.Mesafe, u.TahminiKalkis, u.TahminiVaris, uc.Kontenjani from Ucuslar as u inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID inner join Personeller as p on p.PersonelID= u.PilotID inner join Personeller as pe on pe.PersonelID = u.KabinEkibiID inner join Ucaklar as uc on uc.UcakID = u.UcakID  where u.Silindi = 0 and h.Kita=@k1 and h.Ulke=@u1 and h.HavaAlaniAdi=@n1 and ha.Kita=@k2 and ha.Ulke=@u2 and ha.HavaAlaniAdi=@n2 and u.TahminiKalkis > getdate()", conn);
            da.SelectCommand.Parameters.Add("@k1", SqlDbType.VarChar).Value = K1;
            da.SelectCommand.Parameters.Add("@u1", SqlDbType.VarChar).Value = U1;
            da.SelectCommand.Parameters.Add("@n1", SqlDbType.VarChar).Value = N1;
            da.SelectCommand.Parameters.Add("@k2", SqlDbType.VarChar).Value = K2;
            da.SelectCommand.Parameters.Add("@u2", SqlDbType.VarChar).Value = U2;
            da.SelectCommand.Parameters.Add("@n2", SqlDbType.VarChar).Value = N2;
            da.Fill(dt);
            return dt;
        }

        public bool UcusSil(int ID)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_UcusSil ", conn);
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

        public DataTable UcuslarıGetirByNeredenNereye2DGV(DataGridView dat)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlDataAdapter da = new SqlDataAdapter("select u.UcusID, h.Kita as Kıta, h.Ulke as Ülke, h.HavaAlaniAdi as Nereden, ha.Kita as Kıta, ha.Ulke as Ülke, ha.HavaAlaniAdi as Nereye,(p.PersonelAdi + ' ' + p.PersonelSoyadi) as Pilot, (pe.PersonelAdi +' ' + pe.PersonelSoyadi) as [Kabin Amiri],u.Ucret as Ücret,uc.UcakTuru as [Uçak Türü], u.Mesafe , u.TahminiKalkis, u.TahminiVaris,uc.Kontenjani from Ucuslar as u inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID inner join Personeller as p on p.PersonelID= u.PilotID inner join Personeller as pe on pe.PersonelID = u.KabinEkibiID inner join Ucaklar as uc on uc.UcakID = u.UcakID  where u.Silindi = 0 and u.TahminiKalkis > getdate()", conn);

            da.Fill(dt);
            return dt;
        }

        public bool UcusGuncelle(cUcus u)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_UcusGuncelle", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@ID", SqlDbType.Int).Value = u._ucusID;
            comm.Parameters.Add("@NeredenID", SqlDbType.Int).Value = u._neredenID;
            comm.Parameters.Add("@NereyeID", SqlDbType.Int).Value = u._nereyeID;
            comm.Parameters.Add("@Mesafe", SqlDbType.Int).Value = u._mesafe;
            comm.Parameters.Add("@TKalkis", SqlDbType.DateTime).Value = u._tahminiKalkis;
            comm.Parameters.Add("@TVaris", SqlDbType.DateTime).Value = u._tahminiVaris;
            comm.Parameters.Add("@PID", SqlDbType.Int).Value = u._pilotID;
            comm.Parameters.Add("@KEID", SqlDbType.Int).Value = u._kabinEkibiID;
            comm.Parameters.Add("@Ucret", SqlDbType.Money).Value = u._ucret;
            comm.Parameters.Add("@UID", SqlDbType.Int).Value = u._ucakID;

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

        public bool UcusEkle(cUcus u)
        {
            bool sonuc = false;
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("sp_UcusEkle", conn);
            comm.CommandType = CommandType.StoredProcedure;

            comm.Parameters.Add("@NeredenID", SqlDbType.Int).Value = u._neredenID;
            comm.Parameters.Add("@NereyeID", SqlDbType.Int).Value = u._nereyeID;
            comm.Parameters.Add("@Mesafe", SqlDbType.Int).Value = u._mesafe;
            comm.Parameters.Add("@TKalkis", SqlDbType.DateTime).Value = u._tahminiKalkis;
            comm.Parameters.Add("@TVaris", SqlDbType.DateTime).Value = u._tahminiVaris;
            comm.Parameters.Add("@PID", SqlDbType.Int).Value = u._pilotID;
            comm.Parameters.Add("@KEID", SqlDbType.Int).Value = u._kabinEkibiID;
            comm.Parameters.Add("@Ucret", SqlDbType.Money).Value = u._ucret;
            comm.Parameters.Add("@UID", SqlDbType.Int).Value = u._ucakID;

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
