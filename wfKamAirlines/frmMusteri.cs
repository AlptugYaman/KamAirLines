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
    public partial class frmMusteri : Form
    {
        public frmMusteri()
        {
            InitializeComponent();
        }

        private void frmMusteri_Load(object sender, EventArgs e)
        {

            this.Top = 0;
            this.Left = 0;
            cMusteri m = new cMusteri();
            m.MusterileriGetir(lvMusteriler);
        }

        private void lvMusteriler_DoubleClick(object sender, EventArgs e)
        {
            txtID.Text = lvMusteriler.SelectedItems[0].SubItems[0].Text;
            txtAdi.Text = lvMusteriler.SelectedItems[0].SubItems[1].Text;
            txtSoyadi.Text = lvMusteriler.SelectedItems[0].SubItems[2].Text;
            txtTCKNo.Text = lvMusteriler.SelectedItems[0].SubItems[3].Text;
            mtxtTel.Text = lvMusteriler.SelectedItems[0].SubItems[4].Text;
            txtEmail.Text = lvMusteriler.SelectedItems[0].SubItems[5].Text;
            txtAdres.Text = lvMusteriler.SelectedItems[0].SubItems[6].Text;
            btnDegistir.Enabled = true;
            btnSil.Enabled = true;
        }
        private void Temizle()
        {
            txtID.Clear();
            txtAdi.Clear();
            txtSoyadi.Clear();
            txtTCKNo.Clear();
            mtxtTel.Clear();
            txtEmail.Clear();
            txtAdres.Clear();
            txtAdi.Focus();
        }

        private void btnYeni_Click(object sender, EventArgs e)
        {
            Temizle();
            btnKaydet.Enabled = true;
            btnVazgec.Enabled = true;
            btnSil.Enabled = false;
            btnDegistir.Enabled = false;
        }

        private void btnVazgec_Click(object sender, EventArgs e)
        {
            Temizle();
            btnDegistir.Enabled = false;
            btnSil.Enabled = false;
            btnKaydet.Enabled = false;
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            cMusteri m = new cMusteri();
            if (MessageBox.Show("Silmek İstiyor musunuz?", "SİLİNSİN Mİ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                bool Sonuc = m.MusteriSil(Convert.ToInt32(txtID.Text));
                if (Sonuc)
                {
                    MessageBox.Show("Müşteri Bilgileri Silindi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    m.MusterileriGetir(lvMusteriler);
                }
                else
                {
                    MessageBox.Show("Bilgiler Silinemedi!");
                }
            }
        }

        private void btnDegistir_Click(object sender, EventArgs e)
        {
            cMusteri m  = new cMusteri();
            m.MusteriID = Convert.ToInt32(txtID.Text);
            m.MusteriAdi = txtAdi.Text;
            m.MusteriSoyadi= txtSoyadi.Text;
            m.MusteriTCKNo = txtTCKNo.Text; 
            m.Telefon = mtxtTel.Text;
            m.Email= txtEmail.Text;
            m.Adres = txtAdres.Text;

            bool sonuc = m.MusteriGuncelle(m);
            if (txtAdi.Text.Trim() != "" || txtSoyadi.Text.Trim() != "" || txtTCKNo.Text.Trim() != "")
            {
                if (sonuc)
                {
                    MessageBox.Show("Müşteri Bilgileri Değiştirildi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    m.MusterileriGetir(lvMusteriler);
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
            cMusteri m = new cMusteri();
            m.MusteriAdi = txtAdi.Text;
            m.MusteriSoyadi = txtSoyadi.Text;
            m.MusteriTCKNo = txtTCKNo.Text;
            m.Telefon = mtxtTel.Text;
            m.Email = txtEmail.Text;
            m.Adres = txtAdres.Text;

            bool sonuc = m.MusteriEkle(m);
            if (txtAdi.Text.Trim() != "" || txtSoyadi.Text.Trim() != "" || txtTCKNo.Text.Trim() != "" || txtEmail.Text.Trim() != "" || txtAdres.Text.Trim() != "")
            {
                if (sonuc)
                {
                    MessageBox.Show("Müşteri Bilgileri Kaydedildi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    m.MusterileriGetir(lvMusteriler);
                }
                else
                {
                    MessageBox.Show("Müşteri Bilgileri Kaydedilemedi!");
                }
            }
            else
            {
                MessageBox.Show("Tüm Boşlukları Doldurunuz.");
            }
        }
    }
}
