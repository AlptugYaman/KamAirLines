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
    public partial class frmPersonelHareketleri : Form
    {
        public frmPersonelHareketleri()
        {
            InitializeComponent();
        }

        private void frmPersonlHareketleri_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            cGorev g = new cGorev();
            g.GorevGetirH(cbArama);

            cbArama.SelectedIndex = 0;
            dgvPHar.Columns[1].Width = 175;
            dgvPHar.Columns[2].Width = 175;
            //dgvUcus.Columns["Ücret"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            //dgvUcus.Columns["Uçak Türü"].Width = 95;
            //dgvUcus.Columns["Mesafe"].Width = 60;
            //dgvUcus.Columns["Mesafe"].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            //dgvUcus.Columns["TahminiKalkis"].Width = 140;
        }

        private void txtArama_TextChanged(object sender, EventArgs e)
        {
           
                cPersonel p = new cPersonel();
                dgvPHar.DataSource = p.PersonelHareketleri(txtArama.Text, Convert.ToInt32(txtGID.Text), dtpB.Value, dtpS.Value);
        }

        private void cbArama_SelectedIndexChanged(object sender, EventArgs e)
        {
            cGorev go = (cGorev)cbArama.SelectedItem;
            txtGID.Text = go.GorevID.ToString();
            cPersonel p = new cPersonel();
            dgvPHar.DataSource = p.PersonelHareketleri(txtArama.Text, Convert.ToInt32(txtGID.Text), dtpB.Value, dtpS.Value);
            dgvPHar.Columns[1].Width = 175;
            dgvPHar.Columns[2].Width = 175;
        }

        private void dtpB_ValueChanged(object sender, EventArgs e)
        {
            if (dtpB.Value <= dtpS.Value)
            {
                cPersonel p = new cPersonel();
                dgvPHar.DataSource = p.PersonelHareketleri(txtArama.Text, Convert.ToInt32(txtGID.Text), dtpB.Value, dtpS.Value);

            }
        }

        private void dtpS_ValueChanged(object sender, EventArgs e)
        {
            if (dtpB.Value <= dtpS.Value)
            {
                cPersonel p = new cPersonel();
                dgvPHar.DataSource = p.PersonelHareketleri(txtArama.Text, Convert.ToInt32(txtGID.Text), dtpB.Value, dtpS.Value);

            }
        }

    }
}
