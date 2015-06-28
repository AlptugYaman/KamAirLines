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
    public partial class frmPersonelSorgulama : Form
    {
        public frmPersonelSorgulama()
        {
            InitializeComponent();
        }

        private void frmPersonelSorgulama_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            cPersonel p = new cPersonel();
            p.GetAllPersonelLoadArama(lvPersonelSorgu);
        }

        private void txtArama_TextChanged(object sender, EventArgs e)
        {
            cPersonel p = new cPersonel();
            p.GetAllPersonelByARAMA(lvPersonelSorgu, txtArama.Text);
        }
    }
}
