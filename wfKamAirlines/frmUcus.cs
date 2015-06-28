using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace wfKamAirlines
{
    public partial class frmUcus : Form
    {
        public frmUcus()
        {
            InitializeComponent();
        }

        public static int tabindex = 0;

        private void frmUcus_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            tabUcusSorgulama.SelectedIndex = tabindex;
            slblKullanici.Text = frmAnaSayfa.logmain.Adsoyad;
            cUcus u = new cUcus();
            cPersonel p = new cPersonel();
            cUcak uc = new cUcak();
            u.UcuslariGetirGenis(lvUcus);
            p.PilotGetir(cbPilot);
            p.KabinEkibiGetir(cbKabinEkibi);
            uc.UcakGetir(cbUcak);
            DataTable dt = u.UcuslarıGetirByNeredenNereye2DGV(dgvUcus);
            dgvUcus.DataSource = dt;
            GridViewDuzenle();

        }

        private void lvUcus_DoubleClick(object sender, EventArgs e)
        {
            string[] Tarih1 = lvUcus.SelectedItems[0].SubItems[17].Text.Split(' ');
            string[] Tarih2 = lvUcus.SelectedItems[0].SubItems[18].Text.Split(' ');
            txtUcusID.Text = lvUcus.SelectedItems[0].SubItems[0].Text;
            txtKita.Text = lvUcus.SelectedItems[0].SubItems[1].Text;
            txtUlke.Text = lvUcus.SelectedItems[0].SubItems[2].Text;
            txtNeredenID.Text = lvUcus.SelectedItems[0].SubItems[3].Text;
            txtNereden.Text = lvUcus.SelectedItems[0].SubItems[4].Text;
            txtKita2.Text = lvUcus.SelectedItems[0].SubItems[5].Text;
            txtUlke2.Text = lvUcus.SelectedItems[0].SubItems[6].Text;
            txtNereyeID.Text = lvUcus.SelectedItems[0].SubItems[7].Text;
            txtNereye.Text = lvUcus.SelectedItems[0].SubItems[8].Text;
            txtPilotID.Text = lvUcus.SelectedItems[0].SubItems[9].Text;
            txtPilot.Text = lvUcus.SelectedItems[0].SubItems[10].Text;
            txtKabinEkibiID.Text = lvUcus.SelectedItems[0].SubItems[11].Text;
            txtKabinEkibi.Text = lvUcus.SelectedItems[0].SubItems[12].Text;
            txtUcret.Text = lvUcus.SelectedItems[0].SubItems[13].Text;
            txtUcakID.Text = lvUcus.SelectedItems[0].SubItems[14].Text;
            txtUcak.Text = lvUcus.SelectedItems[0].SubItems[15].Text;
            txtUcakTuru.Text = lvUcus.SelectedItems[0].SubItems[16].Text;
            txtKTar.Text = lvUcus.SelectedItems[0].SubItems[20].Text;
            mtxtKSa.Text = lvUcus.SelectedItems[0].SubItems[17].Text;
            txtVTar.Text = lvUcus.SelectedItems[0].SubItems[21].Text;
            mtxtVSa.Text = lvUcus.SelectedItems[0].SubItems[18].Text;
            //txtKTar.Text = Tarih1[0];
            //mtxtKSa.Text = Tarih1[1];
            //txtVTar.Text = Tarih2[0];
            //mtxtVSa.Text = Tarih2[1];
            txtMesafe.Text = lvUcus.SelectedItems[0].SubItems[19].Text;
            btnDegistir.Enabled = true;
            btnSil.Enabled = true;
            btnVazgec.Enabled = true;
            btnKaydet.Enabled = false;

        }
        //---------------------------------------------------------------
        private void cbKita_SelectedIndexChanged(object sender, EventArgs e)
        {
            cHavaAlani ha = new cHavaAlani();
            ha.HavaAlaniBilgileriGetirNeredenByKita(cbUlke, cbKita.SelectedItem.ToString());
            txtKita.Text = cbKita.SelectedItem.ToString();
            cbUlke.Enabled = true;
            txtUlke.Clear();
            cbNerden.Items.Clear();
            txtNereden.Clear();
            txtNeredenID.Clear();
            cbNerden.Enabled = false;
            ButonKontrol1();
        }

        private void cbUlke_SelectedIndexChanged(object sender, EventArgs e)
        {
            cHavaAlani ha = new cHavaAlani();
            ha.HavaAlaniBilgileriGetirNeredenByUlke(cbNerden, cbUlke.SelectedItem.ToString(), cbKita.SelectedItem.ToString());
            txtUlke.Text = cbUlke.SelectedItem.ToString();
            txtNereden.Clear();
            txtNeredenID.Clear();
            cbNerden.Enabled = true;
            ButonKontrol1();
        }

        private void cbNerden_SelectedIndexChanged(object sender, EventArgs e)
        {
            cHavaAlani ha = (cHavaAlani)cbNerden.SelectedItem;
            txtNereden.Text = ha.HavaAlaniAdi;
            txtNeredenID.Text = ha.HavaAlaniID.ToString();
            ButonKontrol1();
        }

        private void cbKita2_SelectedIndexChanged(object sender, EventArgs e)
        {
            cHavaAlani ha = new cHavaAlani();
            ha.HavaAlaniBilgileriGetirNeredenByKita(cbUlke2, cbKita2.SelectedItem.ToString());
            txtKita2.Text = cbKita2.SelectedItem.ToString();
            cbUlke2.Enabled = true;
            cbNereye.Items.Clear();
            txtUlke2.Clear();
            txtNereye.Clear();
            txtNereyeID.Clear();
            cbNereye.Enabled = false;
            ButonKontrol1();
        }

        private void cbUlke2_SelectedIndexChanged(object sender, EventArgs e)
        {
            cHavaAlani ha = new cHavaAlani();
            ha.HavaAlaniBilgileriGetirNeredenByUlke(cbNereye, cbUlke2.SelectedItem.ToString(), cbKita2.SelectedItem.ToString());
            txtUlke2.Text = cbUlke2.SelectedItem.ToString();
            cbNereye.Enabled = true;
            txtNereye.Clear();
            txtNereyeID.Clear();
            ButonKontrol1();
        }

        private void cbNereye_SelectedIndexChanged(object sender, EventArgs e)
        {
            cHavaAlani ha = (cHavaAlani)cbNereye.SelectedItem;
            txtNereye.Text = ha.HavaAlaniAdi;
            txtNereyeID.Text = ha.HavaAlaniID.ToString();
            ButonKontrol1();
        }
        //--------------------------------
        private void cbPilot_SelectedIndexChanged(object sender, EventArgs e)
        {
            cPersonel p = (cPersonel)cbPilot.SelectedItem;
            txtPilot.Text = p.PersonelAdi;
            txtPilotID.Text = p.PersonelID.ToString();
            ButonKontrol1();


        }

        private void cbKabinEkibi_SelectedIndexChanged(object sender, EventArgs e)
        {
            cPersonel p = (cPersonel)cbKabinEkibi.SelectedItem;
            txtKabinEkibi.Text = p.PersonelAdi;
            txtKabinEkibiID.Text = p.PersonelID.ToString();
            ButonKontrol1();


        }

        private void cbUcak_SelectedIndexChanged(object sender, EventArgs e)
        {
            cUcak uc = (cUcak)cbUcak.SelectedItem;
            txtUcak.Text = uc.UcakAdi;
            txtUcakID.Text = uc.UcakID.ToString();
            ButonKontrol1();


        }

        private void btnYeni_Click(object sender, EventArgs e)
        {
            btnKaydet.BackColor = Color.Red;
            btnKaydet.Enabled = false;
            btnVazgec.Enabled = true;
            btnDegistir.Enabled = false;
            btnSil.Enabled = false;
            btnHavaalaniOlustur.Enabled = true;
            Temizle();
            toolStripStatusLabel2.Text = "Kaydet Tuşunun Aktif Olması için Lütfen * lı Alanları Boş bırakmayınız.";
            toolStripStatusLabel2.BackColor = Color.Red;
            lbl1.Visible = true;
            lbl2.Visible = true;
            lbl3.Visible = true;
            lbl4.Visible = true;
            lbl5.Visible = true;
        }

        private void Temizle()
        {
            txtUcusID.Clear();
            txtKita.Clear();
            txtUlke.Clear();
            txtNereden.Clear();
            txtNeredenID.Clear();
            txtKita2.Clear();
            txtUlke2.Clear();
            txtNereye.Clear();
            txtNereyeID.Clear();
            txtMesafe.Clear();
            txtPilotID.Clear();
            txtPilot.Clear();
            txtKabinEkibiID.Clear();
            txtKabinEkibi.Clear();
            txtUcret.Clear();
            txtUcakID.Clear();
            txtUcak.Clear();
            mtxtKSa.Clear();
            mtxtVSa.Clear();
            txtKTar.Clear();
            txtVTar.Clear();
            txtUcakTuru.Clear();
        }

        private void btnVazgec_Click(object sender, EventArgs e)
        {
            Temizle();
            btnKaydet.Enabled = false;
            btnSil.Enabled = false;
            btnDegistir.Enabled = false;
            btnHavaalaniOlustur.Enabled = false;
            btnKaydet.BackColor = Color.Transparent;
            toolStripStatusLabel2.Text = "";
            toolStripStatusLabel2.BackColor = Color.Transparent;
            lbl1.Visible = false;
            lbl2.Visible = false;
            lbl3.Visible = false;
            lbl4.Visible = false;
            lbl5.Visible = false;
        }


        private void btnUcusSorgula_Click(object sender, EventArgs e)
        {
            cUcus u = new cUcus();
            DataTable dt = u.UcuslarıGetirByNeredenNereye(cbKita3.SelectedItem.ToString(), cbUlke3.SelectedItem.ToString(), cbNereden2.SelectedItem.ToString(), cbKita4.SelectedItem.ToString(), cbUlke4.SelectedItem.ToString(), cbNereye2.SelectedItem.ToString());

            if (dt.Rows.Count < 1)
            {
                MessageBox.Show("Aradığınız Sonuçta Bir Uçuş Yok.");
            }
            else
            {
                dgvUcus.DataSource = dt;
                GridViewDuzenle();
            }
        }
        //-------------------------------------------------------------------
        private void cbKita3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbKita3.SelectedIndex >= 0)
            {
                cHavaAlani ha = new cHavaAlani();
                ha.HavaAlaniBilgileriGetirNeredenByKita(cbUlke3, cbKita3.SelectedItem.ToString());
                cbUlke3.Enabled = true;
                cbNereden2.Items.Clear();
                cbNereden2.Enabled = false;
            }
            ButonKontrol();
        }

        private void cbUlke3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbUlke3.SelectedIndex >= 0)
            {
                cHavaAlani ha = new cHavaAlani();
                ha.HavaAlaniBilgileriGetirNeredenByUlke(cbNereden2, cbUlke3.SelectedItem.ToString(), cbKita3.SelectedItem.ToString());
                cbNereden2.Enabled = true;
            }
            ButonKontrol();
        }

        private void cbNereden2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbNereden2.SelectedIndex >= 0)
            {
                cHavaAlani ha = (cHavaAlani)cbNereden2.SelectedItem;
            }
            ButonKontrol();
        }

        private void cbKita4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbKita4.SelectedIndex >= 0)
            {
                cHavaAlani ha = new cHavaAlani();
                ha.HavaAlaniBilgileriGetirNeredenByKita(cbUlke4, cbKita4.SelectedItem.ToString());
                cbUlke4.Enabled = true;
                cbNereye2.Items.Clear();
                cbNereye2.Enabled = false;
            }
            ButonKontrol();
        }

        private void cbUlke4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbUlke4.SelectedIndex >= 0)
            {
                cHavaAlani ha = new cHavaAlani();
                ha.HavaAlaniBilgileriGetirNeredenByUlke(cbNereye2, cbUlke4.SelectedItem.ToString(), cbKita4.SelectedItem.ToString());
                cbNereye2.Enabled = true;
            }
            ButonKontrol();
        }

        private void cbNereye2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbNereye2.SelectedIndex >= 0)
            {
                cHavaAlani ha = (cHavaAlani)cbNereye2.SelectedItem;
            }
            ButonKontrol();

        }
        //------------------------------------------------
        private void ButonKontrol()
        {
            if (cbUlke3.SelectedIndex < 0 || cbKita3.SelectedIndex < 0 || cbNereden2.SelectedIndex < 0 || cbUlke4.SelectedIndex < 0 || cbKita4.SelectedIndex < 0 || cbNereye2.SelectedIndex < 0)
            {
                btnUcusSorgula.Enabled = false;
            }
            else
            {
                btnUcusSorgula.Enabled = true;
            }

        }

        private void ButonKontrol1()
        {
            if (cbUlke.SelectedIndex < 0 || cbKita.SelectedIndex < 0 || cbNerden.SelectedIndex < 0 || cbUlke2.SelectedIndex < 0 || cbKita2.SelectedIndex < 0 || cbNereye.SelectedIndex < 0 || cbPilot.SelectedIndex < 0 || cbKabinEkibi.SelectedIndex < 0 || cbUcak.SelectedIndex < 0)
            {
                btnKaydet.Enabled = false;
            }
            else
            {
                btnKaydet.Enabled = true;
                lbl1.Visible = false;
                lbl2.Visible = false;
                lbl3.Visible = false;
                lbl4.Visible = false;
                lbl5.Visible = false;
                btnKaydet.BackColor = Color.Transparent;
                toolStripStatusLabel2.BackColor = Color.Transparent;
                toolStripStatusLabel2.Text = "";
            }

        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            cUcus uc = new cUcus();
            if (MessageBox.Show("Silmek İstiyor musunuz?", "SİLİNSİN Mİ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                bool Sonuc = uc.UcusSil(Convert.ToInt32(txtUcusID.Text));
                if (Sonuc)
                {
                    MessageBox.Show("Uçuş Bilgileri Silindi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    uc.UcuslariGetirGenis(lvUcus);
                }
                else
                {
                    MessageBox.Show("Bilgiler Silinemedi!");
                }
            }
        }

        private void btnDegistir_Click(object sender, EventArgs e)
        {
            cUcus u = new cUcus();
            u.UcusID = Convert.ToInt32(txtUcusID.Text);
            u.NeredenID = Convert.ToInt32(txtNeredenID.Text);
            u.NereyeID = Convert.ToInt32(txtNereyeID.Text);
            u.Mesafe = Convert.ToInt32(txtMesafe.Text);
            u.TahminiKalkis = Convert.ToDateTime(txtKTar.Text + " " + mtxtKSa.Text);
            u.TahminiVaris = Convert.ToDateTime(txtVTar.Text + " " + mtxtVSa.Text);
            u.PilotID = Convert.ToInt32(txtPilotID.Text);
            u.KabinEkibiID = Convert.ToInt32(txtKabinEkibiID.Text);
            u.Ucret = Convert.ToDecimal(txtUcret.Text);
            u.UcakID = Convert.ToInt32(txtUcakID.Text);
            bool sonuc = u.UcusGuncelle(u);
            if (txtNeredenID.Text.Trim() != "" || txtNereyeID.Text.Trim() != "")
            {
                if (sonuc)
                {
                    MessageBox.Show("Uçuş Bilgileri Değiştirildi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    u.UcuslariGetirGenis(lvUcus);
                }
                else
                {
                    MessageBox.Show("Uçuş Bilgileri Değiştirilemedi!");
                }
            }
            else
            {
                MessageBox.Show("Tüm Boşlukları Doldurunuz.");
            }

        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            cPersonel p = new cPersonel();
            cUcak uc = new cUcak();
            cUcus u = new cUcus();
            u.NeredenID = Convert.ToInt32(txtNeredenID.Text);
            u.NereyeID = Convert.ToInt32(txtNereyeID.Text);
            u.Mesafe = Convert.ToInt32(txtMesafe.Text);
            u.TahminiKalkis = Convert.ToDateTime(txtKTar.Text + " " + mtxtKSa.Text);
            u.TahminiVaris = Convert.ToDateTime(txtVTar.Text + " " + mtxtVSa.Text);
            u.PilotID = Convert.ToInt32(txtPilotID.Text);
            u.KabinEkibiID = Convert.ToInt32(txtKabinEkibiID.Text);
            u.Ucret = Convert.ToDecimal(txtUcret.Text);
            u.UcakID = Convert.ToInt32(txtUcakID.Text);
            bool sonuc = u.UcusEkle(u);
            if (txtNeredenID.Text.Trim() != "" || txtNereyeID.Text.Trim() != "")
            {
                if (sonuc)
                {
                    MessageBox.Show("Uçuş Bilgileri Kaydedildi.");
                    Temizle();
                    btnDegistir.Enabled = false;
                    btnSil.Enabled = false;
                    u.UcuslariGetirGenis(lvUcus);

                }
                else
                {
                    MessageBox.Show("Uçuş Bilgileri Kaydedilemedi!");
                }
            }
            else
            {
                MessageBox.Show("Tüm Boşlukları Doldurunuz.");
            }
            ButonKontrol1();
            p.PilotGetir(cbPilot);
            p.KabinEkibiGetir(cbKabinEkibi);
            uc.UcakGetir(cbUcak);
        }

        private void GridViewDuzenle()
        {
            
            dgvUcus.Columns["UcusID"].Visible = false;
            dgvUcus.Columns["Kıta"].Width = 80;
            dgvUcus.Columns["Kıta"].Visible = false;
            dgvUcus.Columns["Ülke"].Width = 80;
            dgvUcus.Columns["Nereden"].Width = 120;
            dgvUcus.Columns["Kıta1"].Width = 80;
            dgvUcus.Columns["Kıta1"].Visible = false;
            dgvUcus.Columns["Ülke1"].Width = 80;
            dgvUcus.Columns["Ülke1"].HeaderText = "Ülke";
            dgvUcus.Columns["Nereye"].Width = 120;
            dgvUcus.Columns["Pilot"].Width = 95;
            dgvUcus.Columns["Kabin Amiri"].Width = 95;
            dgvUcus.Columns["Ücret"].Width = 65;
            dgvUcus.Columns["Ücret"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            dgvUcus.Columns["Uçak Türü"].Width = 95;
            dgvUcus.Columns["Mesafe"].Width = 60;
            dgvUcus.Columns["Mesafe"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            dgvUcus.Columns["TahminiKalkis"].Width = 140;
            dgvUcus.Columns["TahminiVaris"].Width = 140;
            dgvUcus.Columns["Kontenjani"].Visible = false;
        }

        private void btnHavaalaniOlustur_Click(object sender, EventArgs e)
        {
            frmHavaAlanlari frm = new frmHavaAlanlari();
            frm.ShowDialog();
        }

        private void dtpKalkis_ValueChanged(object sender, EventArgs e)
        {
            if (Convert.ToDateTime(dtpKalkis.Text) >= DateTime.Now)
            {

                txtKTar.Text = dtpKalkis.Value.ToShortDateString();
            }
            else
            {
                MessageBox.Show("Geçmiş Bir Tarih Seçemezsiniz!");
                txtKTar.Clear();
            }
        }

        private void dtpVaris_ValueChanged(object sender, EventArgs e)
        {
            if (Convert.ToDateTime(dtpVaris.Text) >= DateTime.Now)
            {
                txtVTar.Text = dtpVaris.Value.ToShortDateString();

            }
            else
            {
                MessageBox.Show("Geçmiş Bir Tarih Seçemezsiniz!");
                txtVTar.Clear();
            }

        }

        private void dgvUcus_DoubleClick(object sender, EventArgs e)
        {
            cGenel.ucusID = dgvUcus.SelectedRows[0].Cells[0].Value.ToString();
            cGenel.ucusNereden = dgvUcus.SelectedRows[0].Cells[3].Value.ToString();
            cGenel.ucusNereye = dgvUcus.SelectedRows[0].Cells[6].Value.ToString();
            cGenel.ktarih = dgvUcus.SelectedRows[0].Cells[12].Value.ToString();
            cGenel.vtarih = dgvUcus.SelectedRows[0].Cells[13].Value.ToString();
            cGenel.fiyat = dgvUcus.SelectedRows[0].Cells[9].Value.ToString();
            cGenel.kontenjan = dgvUcus.SelectedRows[0].Cells[14].Value.ToString();
            this.Close();
        }


    }

}
