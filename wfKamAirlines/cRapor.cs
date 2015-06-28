using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace wfKamAirlines
{
    class cRapor
    {
        cGenel gnl = new cGenel();
        public void SatisGetirRapor(ListView liste, DateTime tarih1, DateTime tarih2, TextBox txtTu, TextBox txtTk)
        {
            liste.Items.Clear();
            SqlConnection conn = new SqlConnection(gnl.connStr);
            SqlCommand comm = new SqlCommand("select u.UcusID, h.HavaAlaniAdi as Nereden, ha.HavaAlaniAdi as Nereye, u.Ucret as Ucret, count(s.MusteriID) as ToplamYolcu, (u.Ucret* count(s.MusteriID)) as ToplamTutar,u.TahminiKalkis from Satis as s inner join Ucuslar as u on s.UcusKodu=u.UcusID inner join HavaAlanlari as h on u.NeredenID=h.HavaAlaniID inner join HavaAlanlari as ha on ha.HavaAlaniID=u.NereyeID where s.Silindi = 0 and u.TahminiKalkis between @tarih1 and @tarih2 group by s.UcusKodu,u.UcusID,h.HavaAlaniAdi,ha.HavaAlaniAdi,u.Ucret,u.TahminiKalkis ", conn);
            comm.Parameters.Add("tarih1", SqlDbType.DateTime).Value = tarih1;
            comm.Parameters.Add("tarih2", SqlDbType.DateTime).Value = tarih2;
            if (conn.State == ConnectionState.Closed) conn.Open();
            SqlDataReader dr;
            try
            {
                dr = comm.ExecuteReader();
                int i = 0;
                decimal toplamkazanc = 0;
                while (dr.Read())
                {
                    liste.Items.Add(dr["UcusID"].ToString());
                    liste.Items[i].SubItems.Add(dr["Nereden"].ToString());
                    liste.Items[i].SubItems.Add(dr["Nereye"].ToString());
                    liste.Items[i].SubItems.Add(dr["TahminiKalkis"].ToString());
                    liste.Items[i].SubItems.Add(dr["ToplamYolcu"].ToString());
                    liste.Items[i].SubItems.Add(dr["Ucret"].ToString());
                    liste.Items[i].SubItems.Add(dr["ToplamTutar"].ToString());
                    toplamkazanc += Convert.ToDecimal(dr["ToplamTutar"].ToString());

                    i++;
                }
                txtTu.Text = i.ToString();
                txtTk.Text = toplamkazanc.ToString();
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
            conn.Close();
        }
    }
}
