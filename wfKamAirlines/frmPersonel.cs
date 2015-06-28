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
    public partial class frmPersonel : Form
    {
        public frmPersonel()
        {
            InitializeComponent();
        }

        private void frmPersonel_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            dtpIBTarihi.Enabled = false;
            txtIseBTarihi.Text = DateTime.Now.ToShortDateString() +" " + DateTime.Now.ToShortTimeString();
            cGorev g = new cGorev();
            g.GorevGetir(cbGorevi);

            cPersonel p = new cPersonel();
            p.GetAllPersonel(lvPersonel);

            cYetki y = new cYetki();
            y.YetkiGetir(cbYetki);
            
        }

        private void lvPersonel_DoubleClick(object sender, EventArgs e)
        {
            txtID.Text = lvPersonel.SelectedItems[0].SubItems[0].Text;
            txtAdi.Text = lvPersonel.SelectedItems[0].SubItems[1].Text;
            txtSoyadi.Text = lvPersonel.SelectedItems[0].SubItems[2].Text;
            txtPTCNo.Text = lvPersonel.SelectedItems[0].SubItems[3].Text;
            txtKAdi.Text = lvPersonel.SelectedItems[0].SubItems[4].Text;
            txtKSifresi.Text = lvPersonel.SelectedItems[0].SubItems[5].Text;
            txtGorevID.Text = lvPersonel.SelectedItems[0].SubItems[6].Text;
            txtGorevi.Text = lvPersonel.SelectedItems[0].SubItems[7].Text;
            txtUstuID.Text = lvPersonel.SelectedItems[0].SubItems[8].Text;
            txtUstu.Text = lvPersonel.SelectedItems[0].SubItems[9].Text;
            txtYetkiID.Text = lvPersonel.SelectedItems[0].SubItems[10].Text;
            txtYetki.Text = lvPersonel.SelectedItems[0].SubItems[11].Text;
            mtxtTel.Text = lvPersonel.SelectedItems[0].SubItems[12].Text;
            txtMail.Text = lvPersonel.SelectedItems[0].SubItems[13].Text;
            txtIseBTarihi.Text = lvPersonel.SelectedItems[0].SubItems[14].Text;
            txtAdres.Text = lvPersonel.SelectedItems[0].SubItems[15].Text;
            btnDegistir.Enabled = true;
            btnSil.Enabled = true;
            btnKaydet.Enabled = false;
        }

        private void cbGorevi_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtUstu.Clear();
            cbUstu.Items.Clear();
            cGorev g = (cGorev)cbGorevi.SelectedItem;
            txtGorevID.Text = g.GorevID.ToString();
            txtGorevi.Text = g.GorevAd;
            cPersonel p = new cPersonel();
            if (cbGorevi.SelectedItem.ToString() == "Kabin Ekibi" || cbGorevi.SelectedItem.ToString() == "Co-Pilot")
            {
                p.UstuGetir(cbUstu, Convert.ToInt32(txtGorevID.Text));
                cbUstu.Enabled = true;
            }
            else
            {
                txtUstuID.Text = "0";
                cbUstu.Enabled = false;
            }
            
        }

        private void cbUstu_SelectedIndexChanged(object sender, EventArgs e)
        {

            cPersonel p = (cPersonel)cbUstu.SelectedItem;
            txtUstuID.Text = p.PersonelID.ToString();
            txtUstu.Text = p.PersonelAdi;

        }

        private void cbYetki_SelectedIndexChanged(object sender, EventArgs e)
        {
            cYetki y = (cYetki)cbYetki.SelectedItem;
            txtYetkiID.Text = y.YetkiliID.ToString();
            txtYetki.Text = y.Yetki;
        }
        private void Temizle()
        {
            txtID.Clear();
            txtAdi.Clear();
            txtSoyadi.Clear();
            txtPTCNo.Clear();
            txtKAdi.Clear();
            txtKSifresi.Clear();
            txtGorevID.Clear();
            txtGorevi.Clear();
            txtUstuID.Clear();
            txtUstu.Clear();
            txtYetkiID.Clear();
            txtYetki.Clear();
            mtxtTel.Clear();
            txtMail.Clear();
            txtIseBTarihi.Text = DateTime.Now.ToShortDateString();
            txtAdres.Clear();
            txtAdi.Focus();
        }
        private void btnYeni_Click(object sender, EventArgs e)
        {
            btnKaydet.Enabled = true;
            btnVazgec.Enabled = true;
            btnDegistir.Enabled = false;
            btnSil.Enabled = false;
            Temizle();
            txtIseBTarihi.Text = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToLongTimeString();
            dtpIBTarihi.Enabled = false;
        }

        private void btnVazgec_Click(object sender, EventArgs e)
        {
            Temizle();
            btnDegistir.Enabled = false;
            btnSil.Enabled = false;
            btnKaydet.Enabled = false;
            txtIseBTarihi.Text = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
        }

        private void dtpIBTarihi_ValueChanged(object sender, EventArgs e)
        {
            if (Convert.ToDateTime(dtpIBTarihi.Text) <= DateTime.Now)
            {
                txtIseBTarihi.Text = dtpIBTarihi.Value.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
            }
            else
                MessageBox.Show("İleri Bir Tarih Seçemezsiniz!");
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            cPersonel p = new cPersonel();
            if (MessageBox.Show("Silmek İstiyor musunuz?", "SİLİNSİN Mİ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                bool Sonuc = p.PersonelSil(Convert.ToInt32(txtID.Text));
                if (Sonuc)
                {
                    MessageBox.Show("Personel Bilgileri Silindi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    p.GetAllPersonel(lvPersonel);
                }
                else
                {
                    MessageBox.Show("Bilgiler Silinemedi!");
                }
            }
        }

        private void btnDegistir_Click(object sender, EventArgs e)
        {
            dtpIBTarihi.Enabled = true;
            cPersonel p = new cPersonel();
            p.PersonelID = Convert.ToInt32(txtID.Text);
            p.PersonelAdi = txtAdi.Text;
            p.PersonelSoyadi = txtSoyadi.Text;
            p.PersonelTCK = txtPTCNo.Text;
            p.KullaniciAdi = txtKAdi.Text;
            p.KullaniciSifresi = txtKSifresi.Text;
            p.GorevID = Convert.ToInt32(txtGorevID.Text);
            p.Ustu = Convert.ToInt32(txtUstuID.Text);
            p.YetkiTipi = Convert.ToInt32(txtYetkiID.Text);
            p.Telefon = mtxtTel.Text;
            p.Mail = txtMail.Text;
            p.IseBaslamaTarihi = Convert.ToDateTime(txtIseBTarihi.Text);
            p.Adres = txtAdres.Text;

            bool sonuc = p.PersonelGuncelle(p);
            if (txtGorevID.Text != "" && txtYetkiID.Text != "" && txtAdi.Text != "" && txtPTCNo.Text != "" && txtKAdi.Text != "" && txtKSifresi.Text != "")
            {
                if (sonuc)
                {
                    MessageBox.Show("Personel Bilgileri Değiştirildi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    p.GetAllPersonel(lvPersonel);
                }
                else
                {
                    MessageBox.Show("Personel Bilgileri Değiştirilemedi!");
                }
            }
            else
            {
                MessageBox.Show("Eksik Bilgi Girdiniz.");
            }
        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            cPersonel p = new cPersonel();
            p.PersonelAdi = txtAdi.Text;
            p.PersonelSoyadi = txtSoyadi.Text;
            p.PersonelTCK = txtPTCNo.Text;
            p.KullaniciAdi = txtKAdi.Text;
            p.KullaniciSifresi = txtKSifresi.Text;
            p.GorevID = Convert.ToInt32(txtGorevID.Text);
            p.Ustu = Convert.ToInt32(txtUstuID.Text);
            p.YetkiTipi = Convert.ToInt32(txtYetkiID.Text);
            p.Telefon = mtxtTel.Text;
            p.Mail = txtMail.Text;
            p.IseBaslamaTarihi = Convert.ToDateTime(txtIseBTarihi.Text);
            p.Adres = txtAdres.Text;

            bool sonuc = p.PersonelEkle(p);
            if (txtGorevID.Text != "" && txtYetkiID.Text != "" && txtAdi.Text != "" && txtPTCNo.Text != "" && txtKAdi.Text != "" && txtKSifresi.Text != "")
            {
                if (sonuc)
                {
                    MessageBox.Show("Personel Bilgileri Kaydedildi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    p.GetAllPersonel(lvPersonel);
                }
                else
                {
                    MessageBox.Show("Personel Bilgileri Kaydedilemedi!");
                }
            }
            else
            {
                MessageBox.Show("Tüm Boşlukları Doldurunuz.");
            }
        }


    }
}
