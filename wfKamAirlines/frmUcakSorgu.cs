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
    public partial class frmUcakSorgu : Form
    {
        public frmUcakSorgu()
        {
            InitializeComponent();
        }


        private void frmUcakSorgu_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            cUcak u = new cUcak();
            u.UcakSorguAll(lvArama);
        }

        private void txtArama_TextChanged(object sender, EventArgs e)
        {
            cUcak u = new cUcak();
            u.UcakSorgu(lvArama, txtArama.Text);
        }



    }
}
