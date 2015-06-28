namespace wfKamAirlines
{
    partial class frmRaporlama
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmRaporlama));
            this.dtpBTarih = new System.Windows.Forms.DateTimePicker();
            this.dtpSTarih = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.lvRapor = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader5 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader6 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader7 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.txtTKazanc = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtTUcus = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // dtpBTarih
            // 
            this.dtpBTarih.Location = new System.Drawing.Point(154, 25);
            this.dtpBTarih.Margin = new System.Windows.Forms.Padding(2);
            this.dtpBTarih.Name = "dtpBTarih";
            this.dtpBTarih.Size = new System.Drawing.Size(151, 20);
            this.dtpBTarih.TabIndex = 0;
            this.dtpBTarih.ValueChanged += new System.EventHandler(this.dtpBTarih_ValueChanged);
            // 
            // dtpSTarih
            // 
            this.dtpSTarih.Location = new System.Drawing.Point(324, 25);
            this.dtpSTarih.Margin = new System.Windows.Forms.Padding(2);
            this.dtpSTarih.Name = "dtpSTarih";
            this.dtpSTarih.Size = new System.Drawing.Size(151, 20);
            this.dtpSTarih.TabIndex = 1;
            this.dtpSTarih.ValueChanged += new System.EventHandler(this.dtpSTarih_ValueChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(75, 28);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(62, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Tarih Aralığı";
            // 
            // lvRapor
            // 
            this.lvRapor.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3,
            this.columnHeader4,
            this.columnHeader5,
            this.columnHeader6,
            this.columnHeader7});
            this.lvRapor.GridLines = true;
            this.lvRapor.Location = new System.Drawing.Point(25, 70);
            this.lvRapor.Margin = new System.Windows.Forms.Padding(2);
            this.lvRapor.Name = "lvRapor";
            this.lvRapor.Size = new System.Drawing.Size(617, 188);
            this.lvRapor.TabIndex = 3;
            this.lvRapor.UseCompatibleStateImageBehavior = false;
            this.lvRapor.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "UcusID";
            this.columnHeader1.Width = 1;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Nereden";
            this.columnHeader2.Width = 129;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Nereye";
            this.columnHeader3.Width = 142;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Tarih";
            this.columnHeader4.Width = 160;
            // 
            // columnHeader5
            // 
            this.columnHeader5.Text = "ToplamYolcu";
            this.columnHeader5.Width = 101;
            // 
            // columnHeader6
            // 
            this.columnHeader6.Text = "Ucret";
            this.columnHeader6.Width = 79;
            // 
            // columnHeader7
            // 
            this.columnHeader7.Text = "ToplamUcret";
            this.columnHeader7.Width = 129;
            // 
            // txtTKazanc
            // 
            this.txtTKazanc.Location = new System.Drawing.Point(560, 278);
            this.txtTKazanc.Margin = new System.Windows.Forms.Padding(2);
            this.txtTKazanc.Name = "txtTKazanc";
            this.txtTKazanc.ReadOnly = true;
            this.txtTKazanc.Size = new System.Drawing.Size(82, 20);
            this.txtTKazanc.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(475, 282);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(81, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Toplam Kazanç";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(475, 305);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(70, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Toplam Uçuş";
            // 
            // txtTUcus
            // 
            this.txtTUcus.Location = new System.Drawing.Point(560, 301);
            this.txtTUcus.Margin = new System.Windows.Forms.Padding(2);
            this.txtTUcus.Name = "txtTUcus";
            this.txtTUcus.ReadOnly = true;
            this.txtTUcus.Size = new System.Drawing.Size(82, 20);
            this.txtTUcus.TabIndex = 6;
            // 
            // frmRaporlama
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.ClientSize = new System.Drawing.Size(679, 354);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtTUcus);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtTKazanc);
            this.Controls.Add(this.lvRapor);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dtpSTarih);
            this.Controls.Add(this.dtpBTarih);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmRaporlama";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Raporlama İşlemleri";
            this.Load += new System.EventHandler(this.frmRaporlama_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DateTimePicker dtpBTarih;
        private System.Windows.Forms.DateTimePicker dtpSTarih;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListView lvRapor;
        private System.Windows.Forms.TextBox txtTKazanc;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtTUcus;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.ColumnHeader columnHeader5;
        private System.Windows.Forms.ColumnHeader columnHeader6;
        private System.Windows.Forms.ColumnHeader columnHeader7;
    }
}