using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace wfKamAirlines
{
    public partial class frmSatis : Form
    {
        public frmSatis()
        {
            InitializeComponent();
        }



        private void txtAdet_TextChanged(object sender, EventArgs e)
        {

        }

        private void frmSatis_Load(object sender, EventArgs e)
        {

        }

        private void btnMusteriBul_Click(object sender, EventArgs e)
        {
            frmMusteriSorgulama frm = new frmMusteriSorgulama();
            frm.ShowDialog();
            if (cGenel.musteri != "")
            {
                txtMusteri.Text = cGenel.musteri.ToString();
                txtMusteriID.Text = cGenel.musteriID.ToString();
            }
            ButonKontrolu();

        }

        private void btnUcusBul_Click(object sender, EventArgs e)
        {
            frmUcus.tabindex = 1;
            frmUcus frm = new frmUcus();
            frm.ShowDialog();
            if (cGenel.ucusID != "")
            {
                txtnereden.Text = cGenel.ucusNereden;
                txtnereye.Text = cGenel.ucusNereye;
                txtUcusID.Text = cGenel.ucusID;
                txtTutar.Text = cGenel.fiyat;
                txtKtarihi.Text = cGenel.ktarih;
                txtVtarihi.Text = cGenel.vtarih;
                txtKapasite.Text = cGenel.kontenjan;
            }
            ButonKontrolu();
        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtUcusID.Text != "" && txtMusteriID.Text != "")
            {
                cSatis s = new cSatis();
                s.Mid = Convert.ToInt32(txtMusteriID.Text);
                s.Pid = frmAnaSayfa.logmain.PersonelID;
                s.Uid = Convert.ToInt32(txtUcusID.Text);
                bool sonuc = s.satisEkle(s);
                if (sonuc)
                {
                    MessageBox.Show("İşlem Gerçekleti");
                    int kapasite = Convert.ToInt32(cGenel.kontenjan);
                    kapasite -= s.satisCount(Convert.ToInt32(cGenel.ucusID));
                    s.SatisGetir(lvSatislar, Convert.ToInt32(cGenel.ucusID));
                    txtKontenjan.Text = kapasite.ToString();
                }
            }
        }

        private void txtnereden_TextChanged(object sender, EventArgs e)
        {
            cSatis s = new cSatis();

            int kapasite = Convert.ToInt32(cGenel.kontenjan);
            kapasite -= s.satisCount(Convert.ToInt32(cGenel.ucusID));
            s.SatisGetir(lvSatislar, Convert.ToInt32(cGenel.ucusID));
            txtKontenjan.Text = kapasite.ToString();


        }

        private void txtnereye_TextChanged(object sender, EventArgs e)
        {
            cSatis s = new cSatis();

            int kapasite = Convert.ToInt32(cGenel.kontenjan);
            kapasite -= s.satisCount(Convert.ToInt32(cGenel.ucusID));
            s.SatisGetir(lvSatislar, Convert.ToInt32(cGenel.ucusID));
            txtKontenjan.Text = kapasite.ToString();
        }

        private void txtKtarihi_TextChanged(object sender, EventArgs e)
        {
            cSatis s = new cSatis();

            int kapasite = Convert.ToInt32(cGenel.kontenjan);
            kapasite -= s.satisCount(Convert.ToInt32(cGenel.ucusID));
            s.SatisGetir(lvSatislar, Convert.ToInt32(cGenel.ucusID));
            txtKontenjan.Text = kapasite.ToString();
        }

        private void txtVtarihi_TextChanged(object sender, EventArgs e)
        {
            cSatis s = new cSatis();

            int kapasite = Convert.ToInt32(cGenel.kontenjan);
            kapasite -= s.satisCount(Convert.ToInt32(cGenel.ucusID));
            s.SatisGetir(lvSatislar, Convert.ToInt32(cGenel.ucusID));
            txtKontenjan.Text = kapasite.ToString();
        }

        private void ButonKontrolu()
        {
            if (txtMusteri.Text.Trim() != ""  && txtnereden.Text.Trim() != "")
            {
                btnKaydet.Enabled = true;
            }

        }

    }
}
