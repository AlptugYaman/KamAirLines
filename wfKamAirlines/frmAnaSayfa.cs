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
    public partial class frmAnaSayfa : Form
    {
        public frmAnaSayfa()
        {
            InitializeComponent();
        }
        public static cLogin logmain = new cLogin();
        private void frmAnaSayfa_Load(object sender, EventArgs e)
        {
            frmLogin frm = new frmLogin();
            this.Visible = false;
            //LOGINDEN BASLATIYOR
            frm.ShowDialog();

            tsHosgeldin.Text = "Hoşgeldin " + logmain.Adsoyad;
            if (logmain.PersonelID > 0)
            {
                this.Visible = true;
            }
            else if (frm.sayac == 5)
            {
                Application.Exit();
            }
            else
            {
                Application.Exit();
            }
            if (logmain.GorevID != 9)
            {
                personelBilgileriToolStripMenuItem.Visible = false;
                raporlamaToolStripMenuItem.Visible = false;
                yetkiGörevToolStripMenuItem.Visible = false;
                if (logmain.GorevID != 8)
                {
                    uçuşBilgileriToolStripMenuItem.Visible = false;
                    havaToolStripMenuItem.Visible = false;
                }
                if (logmain.GorevID != 7)
                {
                    satışToolStripMenuItem.Visible = false;
                    müşteriToolStripMenuItem.Visible = false;
                }
                if (logmain.GorevID != 5 && logmain.GorevID != 6)
                {
                    uçakBilgileriToolStripMenuItem.Visible = false;
                }
                if (logmain.GorevID == 1 || logmain.GorevID == 2 || logmain.GorevID == 3 || logmain.GorevID == 4)
                {
                    uçuşBilgileriToolStripMenuItem.Visible = true;
                    mitmUcusTanimlama.Visible = false;
                }
            }
        }

        private void FormAcikmi(Form AcilacakForm)
        {
            bool Acikmi = false;
            for (int i = 0; i < this.MdiChildren.Length; i++)
            {
                if (AcilacakForm.Name == MdiChildren[i].Name)
                {
                    AcilacakForm.Focus();
                    Acikmi = true;
                }
            }
            if (Acikmi == false)
            {
                AcilacakForm.MdiParent = this;
                AcilacakForm.Show();
            }
            else
            {
                AcilacakForm.Dispose();
            }
        }

        private void mitmCikis_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void mitmUcusTanimlama_Click(object sender, EventArgs e)
        {
            frmUcus.tabindex = 0;
            frmUcus frm = new frmUcus();
            FormAcikmi(frm);
        }

        private void mitmUcusSorgulama_Click(object sender, EventArgs e)
        {
            frmUcus.tabindex = 1;
            frmUcus frm = new frmUcus();
            FormAcikmi(frm);
        }

        private void mitmHavaalaniTanimlama_Click(object sender, EventArgs e)
        {
            frmHavaAlanlari.tabindex = 0;
            frmHavaAlanlari frm = new frmHavaAlanlari();
            FormAcikmi(frm);
        }

        private void mitmHavaalaniSorgulama_Click(object sender, EventArgs e)
        {
            frmHavaAlanlari.tabindex = 1;
            frmHavaAlanlari frm = new frmHavaAlanlari();
            FormAcikmi(frm);
        }

        private void uçakTanımlamaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmUcak frm = new frmUcak();
            FormAcikmi(frm);
        }

        private void uçkSorguToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmUcakSorgu frm = new frmUcakSorgu();
            FormAcikmi(frm);
        }

        private void yetkiEkranıToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmYetki frm = new frmYetki();
            FormAcikmi(frm);
        }

        private void personelOluşturmaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmPersonel frm = new frmPersonel();
            FormAcikmi(frm);
        }

        private void personelSorgulaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmPersonelSorgulama frm = new frmPersonelSorgulama();
            FormAcikmi(frm);
        }

        private void personelHareketleriToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmPersonelHareketleri frm = new frmPersonelHareketleri();
            FormAcikmi(frm);
        }

        private void görevToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmGorev frm = new frmGorev();
            FormAcikmi(frm);
        }

        private void müşteriSorgulamaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmMusteriSorgulama frm = new frmMusteriSorgulama();
            FormAcikmi(frm);
        }

        private void müşteriGirişiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmMusteri frm = new frmMusteri();
            FormAcikmi(frm);
        }

        private void biletSatışToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSatis frm = new frmSatis();
            frm.ShowDialog();
        }

        private void biletSorgulamaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSatisSorgulama frm = new frmSatisSorgulama();
            frm.ShowDialog();
        }

        private void detaylıSatışRaporuToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmRaporlama frm = new frmRaporlama();
            frm.ShowDialog();
        }

        private void menuAnasayfa_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }
    }
}
