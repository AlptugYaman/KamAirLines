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
    public partial class frmHavaAlanlari : Form
    {
        public frmHavaAlanlari()
        {
            InitializeComponent();
        }
        cGenel gnl = new cGenel();
        public static int tabindex;
        private void frmHavaAlanları_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            tabHavaalani.SelectedIndex = tabindex;
            cHavaAlani ha = new cHavaAlani();
            ha.HavaalaniGetir(lvHAlani);
            tabHavaalani.SelectedIndex = tabindex;
            slblKullanici.Text = frmAnaSayfa.logmain.Adsoyad;
            ha.KitaGetir(lvKita);
            //ha.HAlaniGetir(lvHavaalani);
        }

        private void lvUcus_DoubleClick(object sender, EventArgs e)
        {
            txtHavaAlaniID.Text = lvHAlani.SelectedItems[0].SubItems[0].Text;
            txtNereden.Text = lvHAlani.SelectedItems[0].SubItems[1].Text;
            txtKita.Text = lvHAlani.SelectedItems[0].SubItems[2].Text;
            txtUlke.Text = lvHAlani.SelectedItems[0].SubItems[3].Text;
            txtSehir.Text = lvHAlani.SelectedItems[0].SubItems[4].Text;
            btnDegistir.Enabled = true;
            btnSil.Enabled = true;
            btnKaydet.Enabled = false;
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            cHavaAlani hava = new cHavaAlani();
            if (MessageBox.Show("Silmek İstiyor musunuz?", "SİLİNSİN Mİ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                bool Sonuc = hava.HAlaniSil(Convert.ToInt32(txtHavaAlaniID.Text));
                if (Sonuc)
                {
                    MessageBox.Show("Havaalanı Bilgileri Silindi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    hava.HavaalaniGetir(lvHAlani);
                }
                else
                {
                    MessageBox.Show("Bilgiler Silinemedi!");
                }
            }
        }

        private void Temizle()
        {
            txtHavaAlaniID.Clear();
            txtNereden.Clear();
            txtKita.Clear();
            txtUlke.Clear();
            txtSehir.Clear();
            txtNereden.Focus();

        }

        private void btnYeni_Click(object sender, EventArgs e)
        {
            btnDegistir.Enabled = false;
            btnSil.Enabled = false;
            btnKaydet.Enabled = true;
            Temizle();
        }

        private void btnVazgec_Click(object sender, EventArgs e)
        {
            btnKaydet.Enabled = false;
            btnSil.Enabled = false;
            btnDegistir.Enabled = false;
            Temizle();
        }

        private void btnDegistir_Click(object sender, EventArgs e)
        {
            cHavaAlani ha = new cHavaAlani();
            ha.HavaAlaniID = Convert.ToInt32(txtHavaAlaniID.Text);
            ha.HavaAlaniAdi = txtNereden.Text;
            ha.Kita = txtKita.Text;
            ha.Ulke = txtUlke.Text;
            ha.Sehir = txtSehir.Text;
            bool sonuc = ha.HAlaniGuncelle(ha);
            if (txtNereden.Text != "" || txtKita.Text != "" || txtUlke.Text != "" || txtSehir.Text != "")
            {
                if (ha.HAlaniGuncelle(ha))
                {
                    MessageBox.Show("Havaalanı Bilgileri Değiştirildi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    ha.HavaalaniGetir(lvHAlani);
                }
                else
                {
                    MessageBox.Show("Bilgiler Değiştirilemedi!");
                }
            }
            else
            {
                MessageBox.Show("Tüm Boşlukları Doldurunuz.");
            }

        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            cHavaAlani ha = new cHavaAlani();
            ha.HavaAlaniAdi = txtNereden.Text;
            ha.Kita = txtKita.Text;
            ha.Ulke = txtUlke.Text;
            ha.Sehir = txtSehir.Text;
            bool sonuc = ha.HAlaniEkle(ha);
            if (txtNereden.Text != "" || txtKita.Text != "" || txtUlke.Text != "" || txtSehir.Text != "")
            {
                if (sonuc)
                {
                    MessageBox.Show("Havaalanı Bilgileri Eklendi.");
                    ha.HavaalaniGetir(lvHAlani);
                    Temizle();
                }
                else
                {
                    MessageBox.Show("Bilgiler Eklenemedi.");
                }
            }
            else
            {
                MessageBox.Show("Tüm Boşlukları Doldurunuz.");
            }

        }


        private void lvKita_DoubleClick(object sender, EventArgs e)
        {
            lvUlke.Items.Clear();
            lvHavaalani.Items.Clear();
            cHavaAlani ha = new cHavaAlani();
            ha.UlkeGetirByKita(lvKita.SelectedItems[0].SubItems[0].Text, lvUlke);

        }


        private void lvUlke_DoubleClick(object sender, EventArgs e)
        {
            lvHavaalani.Items.Clear();
            cHavaAlani ha = new cHavaAlani();
            ha.HAlaniGetirByKitaVeUlke(lvKita.SelectedItems[0].SubItems[0].Text, lvUlke.SelectedItems[0].SubItems[0].Text, lvHavaalani);
        }

    }
}
