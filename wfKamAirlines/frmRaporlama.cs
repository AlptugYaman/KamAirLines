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
    public partial class frmRaporlama : Form
    {
        public frmRaporlama()
        {
            InitializeComponent();
        }

        private void frmRaporlama_Load(object sender, EventArgs e)
        {
        }

        private void dtpBTarih_ValueChanged(object sender, EventArgs e)
        {
            cRapor r = new cRapor();
            r.SatisGetirRapor(lvRapor, dtpBTarih.Value, dtpSTarih.Value,txtTUcus,txtTKazanc);

        }

        private void dtpSTarih_ValueChanged(object sender, EventArgs e)
        {
            cRapor r = new cRapor();
            r.SatisGetirRapor(lvRapor, dtpBTarih.Value, dtpSTarih.Value, txtTUcus, txtTKazanc);
        }
    }
}
