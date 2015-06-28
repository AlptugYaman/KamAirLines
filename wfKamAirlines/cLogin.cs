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
    public class cLogin
    {

        cGenel gnl = new cGenel();

        private int _personelID;
        private string _kullaniciAdi;
        private string _sifre;
        private int _yetkiTipiId;
        private string _yetkiliAd;
        private int _gorevID;
        private string _gorevAd;
        private string _personelAdi;
        private string _personelSoyadi;
        #region Properties
        public int PersonelID
        {
            get { return _personelID; }
            set { _personelID = value; }
        }
        public string KullaniciAdi
        {
            get { return _kullaniciAdi; }
            set { _kullaniciAdi = value; }
        }
        public string Sifre
        {
            get { return _sifre; }
            set { _sifre = value; }
        }
        public int YetkiTipiId
        {
            get { return _yetkiTipiId; }
            set { _yetkiTipiId = value; }
        }

        public string YetkiliAd
        {
            get { return _yetkiliAd; }
            set { _yetkiliAd = value; }
        }
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
        #endregion

        private string _adsoyad;
        private int _yetkiveID;
        private int _gorevveID;

        #region Prop2
        public string Adsoyad
        {
            get { return _adsoyad; }
            set { _adsoyad = value; }
        }
        public int YetkiveID
        {
            get { return _yetkiveID; }
            set { _yetkiveID = value; }
        }
        public int GorevveID
        {
            get { return _gorevveID; }
            set { _gorevveID = value; }
        }
        #endregion


        public cLogin KAdSifreKontrol(string KAdi, string Sifre)
        {

            cLogin log = new cLogin();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            //Personeller - Yetki - Gorevler - 
            SqlCommand comm = new SqlCommand("select PersonelID,PersonelAdi,PersonelSoyadi,YetkiTipiID,YetkiliAd,Gorevler.GorevID,GorevAd from Personeller inner join Yetki on Personeller.YetkiTipiID = Yetki.YetkiliID inner join Gorevler on Gorevler.GorevID = Personeller.GorevID where personeller.Silindi = 0 and KullaniciAdi=@KullaniciAdi and KullaniciSifresi=@KullaniciSifresi", conn);
            comm.Parameters.Add("@KullaniciAdi", SqlDbType.VarChar).Value = KAdi;
            comm.Parameters.Add("@KullaniciSifresi", SqlDbType.VarChar).Value = Sifre;
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    log._adsoyad = dr["PersonelAdi"] + " " + dr["PersonelSoyadi"];
                    log._personelID = Convert.ToInt32(dr["PersonelID"]);
                    log._yetkiTipiId = Convert.ToInt32(dr["YetkiTipiID"]);
                    log._yetkiliAd = dr["YetkiliAd"].ToString();
                    log._gorevID = Convert.ToInt32(dr["GorevID"]);
                    log._gorevAd = dr["GorevAd"].ToString();

                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            finally { conn.Close(); }
            return log;
        }
    }
}
