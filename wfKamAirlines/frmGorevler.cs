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
    public partial class frmGorev : Form
    {
        public frmGorev()
        {
            InitializeComponent();
        }

        private void frmGorev_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            cGorev g = new cGorev();
            g.GorevleriGetir(lvGorev);

        }

        private void btnYeni_Click(object sender, EventArgs e)
        {
            btnKaydet.Enabled = true;
            btnVazgec.Enabled = true;
            btnDegistir.Enabled = false;
            btnSil.Enabled = false;
            Temizle();

        }

        private void btnVazgec_Click(object sender, EventArgs e)
        {
            Temizle();
            btnDegistir.Enabled = false;
            btnKaydet.Enabled = false;
            btnSil.Enabled = false;
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            cGorev g = new cGorev();
            if (MessageBox.Show("Silmek İstiyor musunuz?", "SİLİNSİN Mİ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                bool Sonuc = g.GorevSil(Convert.ToInt32(txtID.Text));
               
                if (Sonuc)
                {
                    MessageBox.Show("Görev Silindi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    g.GorevleriGetir(lvGorev);
                }
                else
                {
                    MessageBox.Show("Bilgiler Silinemedi!");
                }
            }
        }

        private void btnDegistir_Click(object sender, EventArgs e)
        {
            cGorev g = new cGorev();
            g.GorevAd = txtGorev.Text;
            g.Aciklanma = txtAciklama.Text;
            g.GorevID = Convert.ToInt32(txtID.Text);

            bool sonuc = g.GorevGuncelle(g);
            if (txtGorev.Text.Trim() !="")
            {
                if (g.GorevGuncelle(g))
                {
                    MessageBox.Show("Görev Bilgileri Değiştirildi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    g.GorevleriGetir(lvGorev);
                }
                else
                {
                    MessageBox.Show("Bilgiler Değiştirilemedi!");
                }
            }
            else
            {
                MessageBox.Show("Boşlukları Doldurunuz.");
            }

        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            cGorev g = new cGorev();
            g.GorevAd = txtGorev.Text;
            g.Aciklanma = txtAciklama.Text;

            bool sonuc = g.GorevEkle(g);
            
            if (txtGorev.Text.Trim() !="")
            {
                if (sonuc)
                {
                    MessageBox.Show("Görev Bilgileri Eklendi.");
                    g.GorevleriGetir(lvGorev);
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

        private void lvGörev_DoubleClick(object sender, EventArgs e)
        {
            txtID.Text = lvGorev.SelectedItems[0].SubItems[0].Text;
            txtGorev.Text = lvGorev.SelectedItems[0].SubItems[1].Text;
            txtAciklama.Text = lvGorev.SelectedItems[0].SubItems[2].Text;
            btnDegistir.Enabled = true;
            btnSil.Enabled = true;
        }
        private void Temizle()
        {
            txtGorev.Clear();
            txtID.Clear();
            txtAciklama.Clear();
            txtGorev.Focus();
        }

    }
}
