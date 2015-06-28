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
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

       
        public int sayac = 0;
        public bool giris;


        private void frmLogin_Load(object sender, EventArgs e)
        {

        }

        private void btnGiris_Click(object sender, EventArgs e)
        {
            // kkkkkkk
           
            if (txtKullaniciAdi.Text.Trim() != "" && txtSifre.Text.Trim() != "")
            {
                frmAnaSayfa.logmain = frmAnaSayfa.logmain.KAdSifreKontrol(txtKullaniciAdi.Text, txtSifre.Text);
                if (frmAnaSayfa.logmain.PersonelID > 0)
                {
                    this.Close();
                }
                else if (frmAnaSayfa.logmain.PersonelID <= 0)
                {
                    MessageBox.Show("Kullanıcı Adı veya Şifre Hatalı.");
                    sayac++;
                    if (sayac == 5)
                    {
                        MessageBox.Show("Şifrenizi Unuttuysanız Lütfen Bilgi İşlem Merkezinden Tekrar Alınız.");
                        this.Close();
                    }
                }
            }
            else
            {
                MessageBox.Show("Gerekli Alanları Lütfen Doldurunuz!");

            }
        }
    }
}
