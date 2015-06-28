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
    public partial class frmSatisSorgulama : Form
    {
        public frmSatisSorgulama()
        {
            InitializeComponent();
        }

        private void frmSatisSorgulama_Load(object sender, EventArgs e)
        {
            cSatis s = new cSatis();
            dgvSatislar.DataSource = s.SatisGetir();
            GridViewDuzenle();


        }

        private void txtTcNo_TextChanged(object sender, EventArgs e)
        {
            cSatis s = new cSatis();
            dgvSatislar.DataSource = s.SatisGetir(txtTcNo.Text);
            GridViewDuzenle();
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            cSatis s = new cSatis();
            
            if (MessageBox.Show("Silmek İstiyor musunuz?", "SİLİNSİN Mİ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            { 
                bool sonuc =  s.satisSil(Convert.ToInt32(dgvSatislar.SelectedRows[0].Cells[4].Value));
                if (sonuc)
                {
                    MessageBox.Show("Silinmiştir.");
                    dgvSatislar.DataSource = s.SatisGetir();
                    txtTcNo.Clear();
                }
                else
                {
                    MessageBox.Show("Silinemedi.");
                }

            }
           
            
        }
        private void GridViewDuzenle()
        {

            dgvSatislar.Columns["RezervasyonID"].Visible = false;
            dgvSatislar.Columns["Nereden"].Width = 140;
            dgvSatislar.Columns["Nereye"].Width = 150;
            dgvSatislar.Columns["MusteriID"].Visible = false;
            dgvSatislar.Columns["UcusID"].Visible = false;
            dgvSatislar.Columns["Silindi"].Visible = false;


        }



    }
}
