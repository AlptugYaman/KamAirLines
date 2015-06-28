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
    public partial class frmYetki : Form
    {
        public frmYetki()
        {
            InitializeComponent();
        }

        private void frmYetki_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            cYetki y = new cYetki();
            y.YetkileriGetir(lvYetki);
        }

        private void lvYetki_DoubleClick(object sender, EventArgs e)
        {
            txtID.Text = lvYetki.SelectedItems[0].SubItems[0].Text;
            txtYetki.Text = lvYetki.SelectedItems[0].SubItems[1].Text;
            btnDegistir.Enabled = true;
            btnSil.Enabled = true;
        }

        private void btnYeni_Click(object sender, EventArgs e)
        {
            btnKaydet.Enabled = true;
            btnVazgec.Enabled = true;
            btnDegistir.Enabled = false;
            btnSil.Enabled = false;
            txtYetki.Clear();
            txtID.Clear();
        }

        private void btnVazgec_Click(object sender, EventArgs e)
        {
            txtYetki.Clear();
            txtID.Clear();
            btnDegistir.Enabled = false;
            btnKaydet.Enabled = false;
            btnSil.Enabled = false;
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            cYetki y = new cYetki();
            if (MessageBox.Show("Silmek İstiyor musunuz?", "SİLİNSİN Mİ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                bool Sonuc = y.YetkiSil(Convert.ToInt32(txtID.Text));
               
                if (Sonuc)
                {
                    MessageBox.Show("Yetki Silindi.");
                    txtID.Clear();
                    txtYetki.Clear();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    y.YetkileriGetir(lvYetki);
                }
                else
                {
                    MessageBox.Show("Bilgiler Silinemedi!");
                }
            }
        }

        private void btnDegistir_Click(object sender, EventArgs e)
        {
            cYetki y = new cYetki();
            y.Yetki = txtYetki.Text;
            y.YetkiliID = Convert.ToInt32(txtID.Text);

            bool sonuc = y.YetkiGuncelle(y);
            if (txtYetki.Text.Trim() !="")
            {
                if (y.YetkiGuncelle(y))
                {
                    MessageBox.Show("Yetki Bilgileri Değiştirildi.");
                    txtID.Clear();
                    txtYetki.Clear();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    y.YetkileriGetir(lvYetki);
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
            cYetki y = new cYetki();
            y.Yetki = txtYetki.Text;

            bool sonuc = y.YetkiEkle(y);
            
            if (txtYetki.Text.Trim() !="")
            {
                if (sonuc)
                {
                    MessageBox.Show("Yetki Bilgileri Eklendi.");
                    y.YetkileriGetir(lvYetki);
                    txtYetki.Clear();
                    txtID.Clear();
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
    }
}
