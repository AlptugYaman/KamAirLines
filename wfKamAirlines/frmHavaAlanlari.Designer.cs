namespace wfKamAirlines
{
    partial class frmHavaAlanlari
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmHavaAlanlari));
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.slblKullanici = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel2 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel3 = new System.Windows.Forms.ToolStripStatusLabel();
            this.tabHavaalani = new System.Windows.Forms.TabControl();
            this.tabHavaalaniTanimlama = new System.Windows.Forms.TabPage();
            this.btnVazgec = new System.Windows.Forms.Button();
            this.btnSil = new System.Windows.Forms.Button();
            this.btnDegistir = new System.Windows.Forms.Button();
            this.btnKaydet = new System.Windows.Forms.Button();
            this.btnYeni = new System.Windows.Forms.Button();
            this.lvHAlani = new System.Windows.Forms.ListView();
            this.columnHeader9 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader17 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader18 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader19 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader20 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.label11 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.txtSehir = new System.Windows.Forms.TextBox();
            this.txtUlke = new System.Windows.Forms.TextBox();
            this.txtKita = new System.Windows.Forms.TextBox();
            this.txtHavaAlaniID = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtNereden = new System.Windows.Forms.TextBox();
            this.tabHavaalaniSorgulama = new System.Windows.Forms.TabPage();
            this.lvUlke = new System.Windows.Forms.ListView();
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.lvHavaalani = new System.Windows.Forms.ListView();
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.lvKita = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.splitter1 = new System.Windows.Forms.Splitter();
            this.statusStrip1.SuspendLayout();
            this.tabHavaalani.SuspendLayout();
            this.tabHavaalaniTanimlama.SuspendLayout();
            this.tabHavaalaniSorgulama.SuspendLayout();
            this.SuspendLayout();
            // 
            // statusStrip1
            // 
            this.statusStrip1.BackColor = System.Drawing.SystemColors.Control;
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.slblKullanici,
            this.toolStripStatusLabel2,
            this.toolStripStatusLabel3});
            this.statusStrip1.Location = new System.Drawing.Point(0, 449);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(750, 22);
            this.statusStrip1.TabIndex = 3;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // slblKullanici
            // 
            this.slblKullanici.Name = "slblKullanici";
            this.slblKullanici.Size = new System.Drawing.Size(118, 17);
            this.slblKullanici.Text = "toolStripStatusLabel1";
            // 
            // toolStripStatusLabel2
            // 
            this.toolStripStatusLabel2.Name = "toolStripStatusLabel2";
            this.toolStripStatusLabel2.Size = new System.Drawing.Size(408, 17);
            this.toolStripStatusLabel2.Spring = true;
            // 
            // toolStripStatusLabel3
            // 
            this.toolStripStatusLabel3.Name = "toolStripStatusLabel3";
            this.toolStripStatusLabel3.Size = new System.Drawing.Size(209, 17);
            this.toolStripStatusLabel3.Text = "Havaalanı İşlemleri Düzenleyebilirsiniz.";
            // 
            // tabHavaalani
            // 
            this.tabHavaalani.Controls.Add(this.tabHavaalaniTanimlama);
            this.tabHavaalani.Controls.Add(this.tabHavaalaniSorgulama);
            this.tabHavaalani.Location = new System.Drawing.Point(0, 9);
            this.tabHavaalani.Name = "tabHavaalani";
            this.tabHavaalani.SelectedIndex = 0;
            this.tabHavaalani.Size = new System.Drawing.Size(750, 440);
            this.tabHavaalani.TabIndex = 5;
            // 
            // tabHavaalaniTanimlama
            // 
            this.tabHavaalaniTanimlama.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.tabHavaalaniTanimlama.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.tabHavaalaniTanimlama.Controls.Add(this.btnVazgec);
            this.tabHavaalaniTanimlama.Controls.Add(this.btnSil);
            this.tabHavaalaniTanimlama.Controls.Add(this.btnDegistir);
            this.tabHavaalaniTanimlama.Controls.Add(this.btnKaydet);
            this.tabHavaalaniTanimlama.Controls.Add(this.btnYeni);
            this.tabHavaalaniTanimlama.Controls.Add(this.lvHAlani);
            this.tabHavaalaniTanimlama.Controls.Add(this.label11);
            this.tabHavaalaniTanimlama.Controls.Add(this.label14);
            this.tabHavaalaniTanimlama.Controls.Add(this.label12);
            this.tabHavaalaniTanimlama.Controls.Add(this.txtSehir);
            this.tabHavaalaniTanimlama.Controls.Add(this.txtUlke);
            this.tabHavaalaniTanimlama.Controls.Add(this.txtKita);
            this.tabHavaalaniTanimlama.Controls.Add(this.txtHavaAlaniID);
            this.tabHavaalaniTanimlama.Controls.Add(this.label1);
            this.tabHavaalaniTanimlama.Controls.Add(this.txtNereden);
            this.tabHavaalaniTanimlama.Location = new System.Drawing.Point(4, 22);
            this.tabHavaalaniTanimlama.Name = "tabHavaalaniTanimlama";
            this.tabHavaalaniTanimlama.Padding = new System.Windows.Forms.Padding(3);
            this.tabHavaalaniTanimlama.Size = new System.Drawing.Size(742, 414);
            this.tabHavaalaniTanimlama.TabIndex = 0;
            this.tabHavaalaniTanimlama.Text = "Havaalanı Tanımlama";
            // 
            // btnVazgec
            // 
            this.btnVazgec.Location = new System.Drawing.Point(42, 208);
            this.btnVazgec.Name = "btnVazgec";
            this.btnVazgec.Size = new System.Drawing.Size(54, 25);
            this.btnVazgec.TabIndex = 70;
            this.btnVazgec.Text = "Vazgeç";
            this.btnVazgec.UseVisualStyleBackColor = true;
            this.btnVazgec.Click += new System.EventHandler(this.btnVazgec_Click);
            // 
            // btnSil
            // 
            this.btnSil.Enabled = false;
            this.btnSil.Location = new System.Drawing.Point(174, 208);
            this.btnSil.Name = "btnSil";
            this.btnSil.Size = new System.Drawing.Size(54, 25);
            this.btnSil.TabIndex = 69;
            this.btnSil.Text = "Sil";
            this.btnSil.UseVisualStyleBackColor = true;
            this.btnSil.Click += new System.EventHandler(this.btnSil_Click);
            // 
            // btnDegistir
            // 
            this.btnDegistir.Enabled = false;
            this.btnDegistir.Location = new System.Drawing.Point(174, 169);
            this.btnDegistir.Name = "btnDegistir";
            this.btnDegistir.Size = new System.Drawing.Size(54, 25);
            this.btnDegistir.TabIndex = 68;
            this.btnDegistir.Text = "Değiştir";
            this.btnDegistir.UseVisualStyleBackColor = true;
            this.btnDegistir.Click += new System.EventHandler(this.btnDegistir_Click);
            // 
            // btnKaydet
            // 
            this.btnKaydet.Enabled = false;
            this.btnKaydet.Location = new System.Drawing.Point(109, 169);
            this.btnKaydet.Name = "btnKaydet";
            this.btnKaydet.Size = new System.Drawing.Size(54, 25);
            this.btnKaydet.TabIndex = 67;
            this.btnKaydet.Text = "Kaydet";
            this.btnKaydet.UseVisualStyleBackColor = true;
            this.btnKaydet.Click += new System.EventHandler(this.btnKaydet_Click);
            // 
            // btnYeni
            // 
            this.btnYeni.Location = new System.Drawing.Point(42, 169);
            this.btnYeni.Name = "btnYeni";
            this.btnYeni.Size = new System.Drawing.Size(54, 25);
            this.btnYeni.TabIndex = 66;
            this.btnYeni.Text = "Yeni";
            this.btnYeni.UseVisualStyleBackColor = true;
            this.btnYeni.Click += new System.EventHandler(this.btnYeni_Click);
            // 
            // lvHAlani
            // 
            this.lvHAlani.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader9,
            this.columnHeader17,
            this.columnHeader18,
            this.columnHeader19,
            this.columnHeader20});
            this.lvHAlani.FullRowSelect = true;
            this.lvHAlani.GridLines = true;
            this.lvHAlani.Location = new System.Drawing.Point(234, 28);
            this.lvHAlani.Name = "lvHAlani";
            this.lvHAlani.Size = new System.Drawing.Size(484, 367);
            this.lvHAlani.TabIndex = 65;
            this.lvHAlani.UseCompatibleStateImageBehavior = false;
            this.lvHAlani.View = System.Windows.Forms.View.Details;
            this.lvHAlani.DoubleClick += new System.EventHandler(this.lvUcus_DoubleClick);
            // 
            // columnHeader9
            // 
            this.columnHeader9.Text = "HavaalanıID";
            this.columnHeader9.Width = 1;
            // 
            // columnHeader17
            // 
            this.columnHeader17.Text = "Havaalanı Adı";
            this.columnHeader17.Width = 200;
            // 
            // columnHeader18
            // 
            this.columnHeader18.Text = "Kıta";
            this.columnHeader18.Width = 80;
            // 
            // columnHeader19
            // 
            this.columnHeader19.Text = "Ülke";
            this.columnHeader19.Width = 80;
            // 
            // columnHeader20
            // 
            this.columnHeader20.Text = "Şehir";
            this.columnHeader20.Width = 100;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.ForeColor = System.Drawing.Color.GhostWhite;
            this.label11.Location = new System.Drawing.Point(11, 80);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(25, 13);
            this.label11.TabIndex = 64;
            this.label11.Text = "Kıta";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.ForeColor = System.Drawing.Color.GhostWhite;
            this.label14.Location = new System.Drawing.Point(11, 138);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(31, 13);
            this.label14.TabIndex = 62;
            this.label14.Text = "Şehir";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.ForeColor = System.Drawing.Color.GhostWhite;
            this.label12.Location = new System.Drawing.Point(11, 111);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(29, 13);
            this.label12.TabIndex = 61;
            this.label12.Text = "Ülke";
            // 
            // txtSehir
            // 
            this.txtSehir.Location = new System.Drawing.Point(92, 131);
            this.txtSehir.Name = "txtSehir";
            this.txtSehir.Size = new System.Drawing.Size(114, 20);
            this.txtSehir.TabIndex = 59;
            // 
            // txtUlke
            // 
            this.txtUlke.Location = new System.Drawing.Point(92, 105);
            this.txtUlke.Name = "txtUlke";
            this.txtUlke.Size = new System.Drawing.Size(114, 20);
            this.txtUlke.TabIndex = 58;
            // 
            // txtKita
            // 
            this.txtKita.Location = new System.Drawing.Point(92, 79);
            this.txtKita.Name = "txtKita";
            this.txtKita.Size = new System.Drawing.Size(114, 20);
            this.txtKita.TabIndex = 57;
            // 
            // txtHavaAlaniID
            // 
            this.txtHavaAlaniID.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.txtHavaAlaniID.Location = new System.Drawing.Point(8, 6);
            this.txtHavaAlaniID.Name = "txtHavaAlaniID";
            this.txtHavaAlaniID.ReadOnly = true;
            this.txtHavaAlaniID.Size = new System.Drawing.Size(1, 20);
            this.txtHavaAlaniID.TabIndex = 56;
            this.txtHavaAlaniID.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(11, 53);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 13);
            this.label1.TabIndex = 55;
            this.label1.Text = "Havaalaanı Adı";
            // 
            // txtNereden
            // 
            this.txtNereden.Location = new System.Drawing.Point(92, 53);
            this.txtNereden.Name = "txtNereden";
            this.txtNereden.Size = new System.Drawing.Size(136, 20);
            this.txtNereden.TabIndex = 54;
            // 
            // tabHavaalaniSorgulama
            // 
            this.tabHavaalaniSorgulama.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.tabHavaalaniSorgulama.Controls.Add(this.lvUlke);
            this.tabHavaalaniSorgulama.Controls.Add(this.lvHavaalani);
            this.tabHavaalaniSorgulama.Controls.Add(this.lvKita);
            this.tabHavaalaniSorgulama.Controls.Add(this.label7);
            this.tabHavaalaniSorgulama.Controls.Add(this.label6);
            this.tabHavaalaniSorgulama.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.tabHavaalaniSorgulama.Location = new System.Drawing.Point(4, 22);
            this.tabHavaalaniSorgulama.Name = "tabHavaalaniSorgulama";
            this.tabHavaalaniSorgulama.Padding = new System.Windows.Forms.Padding(3);
            this.tabHavaalaniSorgulama.Size = new System.Drawing.Size(742, 414);
            this.tabHavaalaniSorgulama.TabIndex = 1;
            this.tabHavaalaniSorgulama.Text = "Havaalanı Sorgulama";
            // 
            // lvUlke
            // 
            this.lvUlke.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader2});
            this.lvUlke.FullRowSelect = true;
            this.lvUlke.GridLines = true;
            this.lvUlke.Location = new System.Drawing.Point(267, 39);
            this.lvUlke.Name = "lvUlke";
            this.lvUlke.Size = new System.Drawing.Size(142, 292);
            this.lvUlke.TabIndex = 15;
            this.lvUlke.UseCompatibleStateImageBehavior = false;
            this.lvUlke.View = System.Windows.Forms.View.Details;
            this.lvUlke.DoubleClick += new System.EventHandler(this.lvUlke_DoubleClick);
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Ülke";
            this.columnHeader2.Width = 120;
            // 
            // lvHavaalani
            // 
            this.lvHavaalani.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader3});
            this.lvHavaalani.FullRowSelect = true;
            this.lvHavaalani.GridLines = true;
            this.lvHavaalani.Location = new System.Drawing.Point(498, 39);
            this.lvHavaalani.Name = "lvHavaalani";
            this.lvHavaalani.Size = new System.Drawing.Size(224, 292);
            this.lvHavaalani.TabIndex = 14;
            this.lvHavaalani.UseCompatibleStateImageBehavior = false;
            this.lvHavaalani.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Havaalanı";
            this.columnHeader3.Width = 220;
            // 
            // lvKita
            // 
            this.lvKita.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1});
            this.lvKita.FullRowSelect = true;
            this.lvKita.GridLines = true;
            this.lvKita.Location = new System.Drawing.Point(25, 39);
            this.lvKita.Name = "lvKita";
            this.lvKita.Size = new System.Drawing.Size(155, 292);
            this.lvKita.TabIndex = 13;
            this.lvKita.UseCompatibleStateImageBehavior = false;
            this.lvKita.View = System.Windows.Forms.View.Details;
            this.lvKita.DoubleClick += new System.EventHandler(this.lvKita_DoubleClick);
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Kıta";
            this.columnHeader1.Width = 150;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 35F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label7.Location = new System.Drawing.Point(429, 156);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(50, 54);
            this.label7.TabIndex = 9;
            this.label7.Text = ">";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 35F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label6.Location = new System.Drawing.Point(201, 156);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(50, 54);
            this.label6.TabIndex = 8;
            this.label6.Text = ">";
            // 
            // splitter1
            // 
            this.splitter1.Cursor = System.Windows.Forms.Cursors.VSplit;
            this.splitter1.Dock = System.Windows.Forms.DockStyle.Top;
            this.splitter1.Location = new System.Drawing.Point(0, 0);
            this.splitter1.Name = "splitter1";
            this.splitter1.Size = new System.Drawing.Size(750, 3);
            this.splitter1.TabIndex = 4;
            this.splitter1.TabStop = false;
            // 
            // frmHavaAlanlari
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.ClientSize = new System.Drawing.Size(750, 471);
            this.Controls.Add(this.tabHavaalani);
            this.Controls.Add(this.splitter1);
            this.Controls.Add(this.statusStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmHavaAlanlari";
            this.Text = "Havaalanı İşlem Ekranı";
            this.Load += new System.EventHandler(this.frmHavaAlanları_Load);
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.tabHavaalani.ResumeLayout(false);
            this.tabHavaalaniTanimlama.ResumeLayout(false);
            this.tabHavaalaniTanimlama.PerformLayout();
            this.tabHavaalaniSorgulama.ResumeLayout(false);
            this.tabHavaalaniSorgulama.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel slblKullanici;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel2;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel3;
        private System.Windows.Forms.TabControl tabHavaalani;
        private System.Windows.Forms.TabPage tabHavaalaniTanimlama;
        private System.Windows.Forms.TabPage tabHavaalaniSorgulama;
        private System.Windows.Forms.Splitter splitter1;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox txtSehir;
        private System.Windows.Forms.TextBox txtUlke;
        private System.Windows.Forms.TextBox txtKita;
        private System.Windows.Forms.TextBox txtHavaAlaniID;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtNereden;
        private System.Windows.Forms.ListView lvHAlani;
        private System.Windows.Forms.ColumnHeader columnHeader9;
        private System.Windows.Forms.ColumnHeader columnHeader17;
        private System.Windows.Forms.ColumnHeader columnHeader18;
        private System.Windows.Forms.ColumnHeader columnHeader19;
        private System.Windows.Forms.ColumnHeader columnHeader20;
        private System.Windows.Forms.Button btnVazgec;
        private System.Windows.Forms.Button btnSil;
        private System.Windows.Forms.Button btnDegistir;
        private System.Windows.Forms.Button btnKaydet;
        private System.Windows.Forms.Button btnYeni;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ListView lvUlke;
        private System.Windows.Forms.ListView lvHavaalani;
        private System.Windows.Forms.ListView lvKita;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader1;
    }
}