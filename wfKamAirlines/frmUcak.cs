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
    public partial class frmUcak : Form
    {
        public frmUcak()
        {
            InitializeComponent();
        }

        private void frmUcak_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            cUcak u = new cUcak();
            u.UcakBilgileriGetir(lvUcakBilgileri);
            cPersonel p = new cPersonel();
            p.BakimMuhGetir(cbMuhendis);
        }

        private void lvUcakBilgileri_DoubleClick(object sender, EventArgs e)
        {
            txtUcakID.Text = lvUcakBilgileri.SelectedItems[0].SubItems[0].Text;
            txtUcakAdi.Text = lvUcakBilgileri.SelectedItems[0].SubItems[1].Text;
            txtUcakTuru.Text = lvUcakBilgileri.SelectedItems[0].SubItems[2].Text;
            txtKontenjani.Text = lvUcakBilgileri.SelectedItems[0].SubItems[3].Text;
            txtUcusMes.Text = lvUcakBilgileri.SelectedItems[0].SubItems[4].Text;
            txtUcusSur.Text = lvUcakBilgileri.SelectedItems[0].SubItems[5].Text;
            txtBakYapMuh.Text = lvUcakBilgileri.SelectedItems[0].SubItems[6].Text;
            txtSonBakTar.Text = lvUcakBilgileri.SelectedItems[0].SubItems[7].Text;
            txtBakAciklamasi.Text = lvUcakBilgileri.SelectedItems[0].SubItems[8].Text;
            txtBYMID.Text = lvUcakBilgileri.SelectedItems[0].SubItems[9].Text;
            btnDegistir.Enabled = true;
            btnSil.Enabled = true;
            btnVazgec.Enabled = true;
            btnKaydet.Enabled = false;
            dtpSonBakimT.Enabled = true;
        }

        private void Temizle()
        {
            txtUcakID.Clear();
            txtUcakAdi.Clear();
            txtUcakTuru.Clear();
            txtKontenjani.Clear();
            txtUcusMes.Clear();
            txtUcusSur.Clear();
            txtBakYapMuh.Clear();
            txtSonBakTar.Clear();
            txtBakAciklamasi.Clear();
            txtBYMID.Clear();
            txtUcakAdi.Focus();
        }

        private void btnYeni_Click(object sender, EventArgs e)
        {
            btnKaydet.Enabled = true;
            btnVazgec.Enabled = true;
            btnDegistir.Enabled = false;
            btnSil.Enabled = false;
            Temizle();
            txtSonBakTar.Text = DateTime.Now.ToShortDateString();
        }

        private void btnVazgec_Click(object sender, EventArgs e)
        {
            Temizle();
            btnKaydet.Enabled = false;
            btnSil.Enabled = false;
            btnDegistir.Enabled = false;
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            cUcak u = new cUcak();
            if (MessageBox.Show("Silmek İstiyor musunuz?", "SİLİNSİN Mİ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                bool Sonuc = u.UcakSil(Convert.ToInt32(txtUcakID.Text));
                if (Sonuc)
                {
                    MessageBox.Show("Uçuş Bilgileri Silindi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    u.UcakBilgileriGetir(lvUcakBilgileri);
                }
                else
                {
                    MessageBox.Show("Bilgiler Silinemedi!");
                }
            }
        }
        
        private void btnDegistir_Click(object sender, EventArgs e)
        {
            cUcak u = new cUcak();
            u.UcakID = Convert.ToInt32(txtUcakID.Text);
            u.UcakAdi = txtUcakAdi.Text;
            u.UcakTuru = txtUcakTuru.Text;
            u.Kontenjani = Convert.ToInt32(txtKontenjani.Text);
            u.UcusMesafesi = Convert.ToInt32(txtUcusMes.Text);
            u.UcusSuresi = txtUcusSur.Text;
            u.BakiminiYapanMuhendisID = Convert.ToInt32(txtBYMID.Text);
            u.SonBakimTarihi = Convert.ToDateTime(txtSonBakTar.Text);
            u.BakimAciklamasi = txtBakAciklamasi.Text;
            bool sonuc = u.UcaklariGuncelle(u);
            if (txtUcakAdi.Text != "" || txtUcakTuru.Text != "" || txtKontenjani.Text != "" || txtUcusMes.Text != "" || txtBYMID.Text != "")
            {
                if (sonuc)
                {
                    MessageBox.Show("Uçak Bilgileri Değiştirildi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    u.UcakBilgileriGetir(lvUcakBilgileri);
                }
                else
                {
                    MessageBox.Show("Uçak Bilgileri Değiştirilemedi!");
                }
            }
            else
            {
                MessageBox.Show("Tüm Boşlukları Doldurunuz.");
            }

        }
        private void btnKaydet_Click(object sender, EventArgs e)
        {
            cUcak u = new cUcak();
            u.UcakAdi = txtUcakAdi.Text;
            u.UcakTuru = txtUcakTuru.Text;
            u.Kontenjani = Convert.ToInt32(txtKontenjani.Text);
            u.UcusMesafesi = Convert.ToInt32(txtUcusMes.Text);
            u.UcusSuresi = txtUcusSur.Text;
            u.BakiminiYapanMuhendisID = Convert.ToInt32(txtBYMID.Text);
            u.SonBakimTarihi = Convert.ToDateTime(txtSonBakTar.Text);
            u.BakimAciklamasi = txtBakAciklamasi.Text;
            bool sonuc = u.UcakEkle(u);
            if (txtUcakAdi.Text != "" && txtUcakTuru.Text != "" && txtKontenjani.Text != "" && txtUcusMes.Text != "" && txtBYMID.Text != "")
            {
                if (sonuc)
                {
                    MessageBox.Show("Uçak Bilgileri Kaydedildi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    u.UcakBilgileriGetir(lvUcakBilgileri);
                }
                else
                {
                    MessageBox.Show("Uçak Bilgileri Kaydedilemedi!");
                }
            }
            else
            {
                MessageBox.Show("Tüm Boşlukları Doldurunuz.");
            }
        }

        private void cbMuhendis_SelectedIndexChanged(object sender, EventArgs e)
        {
            cPersonel p = (cPersonel)cbMuhendis.SelectedItem;
            txtBakYapMuh.Text=p.PersonelAdi;
            txtBYMID.Text=p.PersonelID.ToString();
        }

        private void dtpSonBakimT_ValueChanged(object sender, EventArgs e)
        {
            if (Convert.ToDateTime(dtpSonBakimT.Text) <= DateTime.Now)
            { 
                txtSonBakTar.Text = dtpSonBakimT.Value.ToShortDateString();
            }
            else
            MessageBox.Show("İleri Bir Tarih Seçemezsiniz!");
        }


    }
}
