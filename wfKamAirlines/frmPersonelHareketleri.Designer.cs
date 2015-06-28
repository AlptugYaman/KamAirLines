namespace wfKamAirlines
{
    partial class frmPersonelHareketleri
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmPersonelHareketleri));
            this.dgvPHar = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.txtArama = new System.Windows.Forms.TextBox();
            this.cbArama = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.dtpB = new System.Windows.Forms.DateTimePicker();
            this.dtpS = new System.Windows.Forms.DateTimePicker();
            this.label4 = new System.Windows.Forms.Label();
            this.txtGID = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPHar)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvPHar
            // 
            this.dgvPHar.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.dgvPHar.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPHar.Location = new System.Drawing.Point(29, 58);
            this.dgvPHar.Name = "dgvPHar";
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.SteelBlue;
            dataGridViewCellStyle1.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.White;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.SteelBlue;
            this.dgvPHar.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvPHar.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvPHar.Size = new System.Drawing.Size(697, 273);
            this.dgvPHar.TabIndex = 0;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(26, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(183, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Personel Ada ve Soyada Göre Arama";
            // 
            // txtArama
            // 
            this.txtArama.Location = new System.Drawing.Point(29, 32);
            this.txtArama.Name = "txtArama";
            this.txtArama.Size = new System.Drawing.Size(180, 20);
            this.txtArama.TabIndex = 3;
            this.txtArama.TextChanged += new System.EventHandler(this.txtArama_TextChanged);
            // 
            // cbArama
            // 
            this.cbArama.BackColor = System.Drawing.Color.White;
            this.cbArama.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbArama.FormattingEnabled = true;
            this.cbArama.Location = new System.Drawing.Point(297, 30);
            this.cbArama.Name = "cbArama";
            this.cbArama.Size = new System.Drawing.Size(121, 21);
            this.cbArama.TabIndex = 4;
            this.cbArama.SelectedIndexChanged += new System.EventHandler(this.cbArama_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(304, 8);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(101, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Göreve Göre Arama";
            // 
            // dtpB
            // 
            this.dtpB.Location = new System.Drawing.Point(491, 31);
            this.dtpB.Name = "dtpB";
            this.dtpB.Size = new System.Drawing.Size(105, 20);
            this.dtpB.TabIndex = 6;
            this.dtpB.ValueChanged += new System.EventHandler(this.dtpB_ValueChanged);
            // 
            // dtpS
            // 
            this.dtpS.Location = new System.Drawing.Point(621, 31);
            this.dtpS.Name = "dtpS";
            this.dtpS.Size = new System.Drawing.Size(105, 20);
            this.dtpS.TabIndex = 7;
            this.dtpS.ValueChanged += new System.EventHandler(this.dtpS_ValueChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(542, 9);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(133, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "Tarih Aralığına Göre Arama";
            // 
            // txtGID
            // 
            this.txtGID.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.txtGID.Location = new System.Drawing.Point(253, 31);
            this.txtGID.Name = "txtGID";
            this.txtGID.ReadOnly = true;
            this.txtGID.Size = new System.Drawing.Size(1, 20);
            this.txtGID.TabIndex = 9;
            // 
            // frmPersonelHareketleri
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.ClientSize = new System.Drawing.Size(758, 357);
            this.Controls.Add(this.txtGID);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.dtpS);
            this.Controls.Add(this.dtpB);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cbArama);
            this.Controls.Add(this.txtArama);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dgvPHar);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmPersonelHareketleri";
            this.Text = "Personel Hareketleri";
            this.Load += new System.EventHandler(this.frmPersonlHareketleri_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPHar)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvPHar;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtArama;
        private System.Windows.Forms.ComboBox cbArama;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DateTimePicker dtpB;
        private System.Windows.Forms.DateTimePicker dtpS;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtGID;







    }
}