namespace wfKamAirlines
{
    partial class frmUcak
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmUcak));
            this.btnVazgec = new System.Windows.Forms.Button();
            this.btnSil = new System.Windows.Forms.Button();
            this.btnDegistir = new System.Windows.Forms.Button();
            this.btnKaydet = new System.Windows.Forms.Button();
            this.btnYeni = new System.Windows.Forms.Button();
            this.lvUcakBilgileri = new System.Windows.Forms.ListView();
            this.columnHeader9 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader17 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader18 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader19 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader20 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader5 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.label11 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.txtUcusMes = new System.Windows.Forms.TextBox();
            this.txtKontenjani = new System.Windows.Forms.TextBox();
            this.txtUcakTuru = new System.Windows.Forms.TextBox();
            this.txtUcakID = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtUcakAdi = new System.Windows.Forms.TextBox();
            this.txtBakAciklamasi = new System.Windows.Forms.TextBox();
            this.txtSonBakTar = new System.Windows.Forms.TextBox();
            this.txtBakYapMuh = new System.Windows.Forms.TextBox();
            this.txtUcusSur = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.txtBYMID = new System.Windows.Forms.TextBox();
            this.cbMuhendis = new System.Windows.Forms.ComboBox();
            this.dtpSonBakimT = new System.Windows.Forms.DateTimePicker();
            this.SuspendLayout();
            // 
            // btnVazgec
            // 
            this.btnVazgec.Location = new System.Drawing.Point(71, 362);
            this.btnVazgec.Name = "btnVazgec";
            this.btnVazgec.Size = new System.Drawing.Size(54, 22);
            this.btnVazgec.TabIndex = 85;
            this.btnVazgec.Text = "Vazgeç";
            this.btnVazgec.UseVisualStyleBackColor = true;
            this.btnVazgec.Click += new System.EventHandler(this.btnVazgec_Click);
            // 
            // btnSil
            // 
            this.btnSil.BackColor = System.Drawing.Color.Transparent;
            this.btnSil.Enabled = false;
            this.btnSil.Location = new System.Drawing.Point(203, 362);
            this.btnSil.Name = "btnSil";
            this.btnSil.Size = new System.Drawing.Size(54, 22);
            this.btnSil.TabIndex = 84;
            this.btnSil.Text = "Sil";
            this.btnSil.UseVisualStyleBackColor = false;
            this.btnSil.Click += new System.EventHandler(this.btnSil_Click);
            // 
            // btnDegistir
            // 
            this.btnDegistir.BackColor = System.Drawing.Color.Transparent;
            this.btnDegistir.Enabled = false;
            this.btnDegistir.Location = new System.Drawing.Point(203, 323);
            this.btnDegistir.Name = "btnDegistir";
            this.btnDegistir.Size = new System.Drawing.Size(54, 22);
            this.btnDegistir.TabIndex = 83;
            this.btnDegistir.Text = "Değiştir";
            this.btnDegistir.UseVisualStyleBackColor = false;
            this.btnDegistir.Click += new System.EventHandler(this.btnDegistir_Click);
            // 
            // btnKaydet
            // 
            this.btnKaydet.BackColor = System.Drawing.Color.Transparent;
            this.btnKaydet.Enabled = false;
            this.btnKaydet.Location = new System.Drawing.Point(137, 323);
            this.btnKaydet.Name = "btnKaydet";
            this.btnKaydet.Size = new System.Drawing.Size(54, 22);
            this.btnKaydet.TabIndex = 82;
            this.btnKaydet.Text = "Kaydet";
            this.btnKaydet.UseVisualStyleBackColor = false;
            this.btnKaydet.Click += new System.EventHandler(this.btnKaydet_Click);
            // 
            // btnYeni
            // 
            this.btnYeni.Location = new System.Drawing.Point(71, 323);
            this.btnYeni.Name = "btnYeni";
            this.btnYeni.Size = new System.Drawing.Size(54, 22);
            this.btnYeni.TabIndex = 81;
            this.btnYeni.Text = "Yeni";
            this.btnYeni.UseVisualStyleBackColor = true;
            this.btnYeni.Click += new System.EventHandler(this.btnYeni_Click);
            // 
            // lvUcakBilgileri
            // 
            this.lvUcakBilgileri.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader9,
            this.columnHeader17,
            this.columnHeader18,
            this.columnHeader19,
            this.columnHeader20,
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3,
            this.columnHeader4,
            this.columnHeader5});
            this.lvUcakBilgileri.FullRowSelect = true;
            this.lvUcakBilgileri.GridLines = true;
            this.lvUcakBilgileri.Location = new System.Drawing.Point(283, 22);
            this.lvUcakBilgileri.Name = "lvUcakBilgileri";
            this.lvUcakBilgileri.Size = new System.Drawing.Size(464, 375);
            this.lvUcakBilgileri.TabIndex = 80;
            this.lvUcakBilgileri.UseCompatibleStateImageBehavior = false;
            this.lvUcakBilgileri.View = System.Windows.Forms.View.Details;
            this.lvUcakBilgileri.DoubleClick += new System.EventHandler(this.lvUcakBilgileri_DoubleClick);
            // 
            // columnHeader9
            // 
            this.columnHeader9.Text = "HavaalanıID";
            this.columnHeader9.Width = 1;
            // 
            // columnHeader17
            // 
            this.columnHeader17.Text = "Uçak Adı";
            this.columnHeader17.Width = 90;
            // 
            // columnHeader18
            // 
            this.columnHeader18.Text = "Uçak Türü";
            this.columnHeader18.Width = 110;
            // 
            // columnHeader19
            // 
            this.columnHeader19.Text = "Kontenjan";
            this.columnHeader19.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.columnHeader19.Width = 65;
            // 
            // columnHeader20
            // 
            this.columnHeader20.Text = "Uçuş Mesafesi";
            this.columnHeader20.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader20.Width = 90;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Uçuş Süresi";
            this.columnHeader1.Width = 0;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Mühendis";
            this.columnHeader2.Width = 100;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Bakım Tarihi";
            this.columnHeader3.Width = 80;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Açıklama";
            this.columnHeader4.Width = 150;
            // 
            // columnHeader5
            // 
            this.columnHeader5.Text = "PersonelID";
            this.columnHeader5.Width = 1;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.ForeColor = System.Drawing.Color.Black;
            this.label11.Location = new System.Drawing.Point(18, 79);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(58, 13);
            this.label11.TabIndex = 79;
            this.label11.Text = "Uçak Türü";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.ForeColor = System.Drawing.Color.Black;
            this.label14.Location = new System.Drawing.Point(18, 131);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(77, 13);
            this.label14.TabIndex = 78;
            this.label14.Text = "Uçuş Mesafesi";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.ForeColor = System.Drawing.Color.Black;
            this.label12.Location = new System.Drawing.Point(18, 105);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(57, 13);
            this.label12.TabIndex = 77;
            this.label12.Text = "Kontenjanı";
            // 
            // txtUcusMes
            // 
            this.txtUcusMes.Location = new System.Drawing.Point(131, 128);
            this.txtUcusMes.Name = "txtUcusMes";
            this.txtUcusMes.Size = new System.Drawing.Size(79, 20);
            this.txtUcusMes.TabIndex = 76;
            // 
            // txtKontenjani
            // 
            this.txtKontenjani.Location = new System.Drawing.Point(131, 102);
            this.txtKontenjani.Name = "txtKontenjani";
            this.txtKontenjani.Size = new System.Drawing.Size(79, 20);
            this.txtKontenjani.TabIndex = 75;
            // 
            // txtUcakTuru
            // 
            this.txtUcakTuru.Location = new System.Drawing.Point(131, 76);
            this.txtUcakTuru.Name = "txtUcakTuru";
            this.txtUcakTuru.Size = new System.Drawing.Size(131, 20);
            this.txtUcakTuru.TabIndex = 74;
            // 
            // txtUcakID
            // 
            this.txtUcakID.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.txtUcakID.Location = new System.Drawing.Point(12, 22);
            this.txtUcakID.Name = "txtUcakID";
            this.txtUcakID.ReadOnly = true;
            this.txtUcakID.Size = new System.Drawing.Size(1, 20);
            this.txtUcakID.TabIndex = 73;
            this.txtUcakID.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(18, 53);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 13);
            this.label1.TabIndex = 72;
            this.label1.Text = "Uçak Adı";
            // 
            // txtUcakAdi
            // 
            this.txtUcakAdi.Location = new System.Drawing.Point(131, 50);
            this.txtUcakAdi.Name = "txtUcakAdi";
            this.txtUcakAdi.Size = new System.Drawing.Size(79, 20);
            this.txtUcakAdi.TabIndex = 71;
            // 
            // txtBakAciklamasi
            // 
            this.txtBakAciklamasi.Location = new System.Drawing.Point(131, 232);
            this.txtBakAciklamasi.Multiline = true;
            this.txtBakAciklamasi.Name = "txtBakAciklamasi";
            this.txtBakAciklamasi.Size = new System.Drawing.Size(131, 82);
            this.txtBakAciklamasi.TabIndex = 89;
            // 
            // txtSonBakTar
            // 
            this.txtSonBakTar.Enabled = false;
            this.txtSonBakTar.Location = new System.Drawing.Point(131, 206);
            this.txtSonBakTar.Name = "txtSonBakTar";
            this.txtSonBakTar.Size = new System.Drawing.Size(79, 20);
            this.txtSonBakTar.TabIndex = 88;
            // 
            // txtBakYapMuh
            // 
            this.txtBakYapMuh.Location = new System.Drawing.Point(131, 180);
            this.txtBakYapMuh.Name = "txtBakYapMuh";
            this.txtBakYapMuh.Size = new System.Drawing.Size(114, 20);
            this.txtBakYapMuh.TabIndex = 87;
            // 
            // txtUcusSur
            // 
            this.txtUcusSur.Location = new System.Drawing.Point(131, 154);
            this.txtUcusSur.Name = "txtUcusSur";
            this.txtUcusSur.Size = new System.Drawing.Size(79, 20);
            this.txtUcusSur.TabIndex = 86;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(18, 183);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(107, 13);
            this.label2.TabIndex = 93;
            this.label2.Text = "Bakımını Yapan Müh.";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(18, 235);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(89, 13);
            this.label3.TabIndex = 92;
            this.label3.Text = "Bakım Açıklaması";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.ForeColor = System.Drawing.Color.Black;
            this.label4.Location = new System.Drawing.Point(18, 209);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(87, 13);
            this.label4.TabIndex = 91;
            this.label4.Text = "Son Bakım Tarihi";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.ForeColor = System.Drawing.Color.Black;
            this.label5.Location = new System.Drawing.Point(18, 157);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(64, 13);
            this.label5.TabIndex = 90;
            this.label5.Text = "Uçuş Süresi";
            // 
            // txtBYMID
            // 
            this.txtBYMID.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.txtBYMID.Location = new System.Drawing.Point(12, 184);
            this.txtBYMID.Name = "txtBYMID";
            this.txtBYMID.ReadOnly = true;
            this.txtBYMID.Size = new System.Drawing.Size(1, 20);
            this.txtBYMID.TabIndex = 95;
            this.txtBYMID.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // cbMuhendis
            // 
            this.cbMuhendis.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbMuhendis.DropDownWidth = 100;
            this.cbMuhendis.FormattingEnabled = true;
            this.cbMuhendis.Location = new System.Drawing.Point(245, 180);
            this.cbMuhendis.Name = "cbMuhendis";
            this.cbMuhendis.Size = new System.Drawing.Size(17, 21);
            this.cbMuhendis.TabIndex = 96;
            this.cbMuhendis.SelectedIndexChanged += new System.EventHandler(this.cbMuhendis_SelectedIndexChanged);
            // 
            // dtpSonBakimT
            // 
            this.dtpSonBakimT.Enabled = false;
            this.dtpSonBakimT.Location = new System.Drawing.Point(210, 206);
            this.dtpSonBakimT.Name = "dtpSonBakimT";
            this.dtpSonBakimT.Size = new System.Drawing.Size(17, 20);
            this.dtpSonBakimT.TabIndex = 97;
            this.dtpSonBakimT.ValueChanged += new System.EventHandler(this.dtpSonBakimT_ValueChanged);
            // 
            // frmUcak
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.ClientSize = new System.Drawing.Size(775, 418);
            this.Controls.Add(this.dtpSonBakimT);
            this.Controls.Add(this.cbMuhendis);
            this.Controls.Add(this.txtBYMID);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtBakAciklamasi);
            this.Controls.Add(this.txtSonBakTar);
            this.Controls.Add(this.txtBakYapMuh);
            this.Controls.Add(this.txtUcusSur);
            this.Controls.Add(this.btnVazgec);
            this.Controls.Add(this.btnSil);
            this.Controls.Add(this.btnDegistir);
            this.Controls.Add(this.btnKaydet);
            this.Controls.Add(this.btnYeni);
            this.Controls.Add(this.lvUcakBilgileri);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.txtUcusMes);
            this.Controls.Add(this.txtKontenjani);
            this.Controls.Add(this.txtUcakTuru);
            this.Controls.Add(this.txtUcakID);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtUcakAdi);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmUcak";
            this.Text = "Uçak Tanımlama Ekranı";
            this.Load += new System.EventHandler(this.frmUcak_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnVazgec;
        private System.Windows.Forms.Button btnSil;
        private System.Windows.Forms.Button btnDegistir;
        private System.Windows.Forms.Button btnKaydet;
        private System.Windows.Forms.Button btnYeni;
        private System.Windows.Forms.ListView lvUcakBilgileri;
        private System.Windows.Forms.ColumnHeader columnHeader9;
        private System.Windows.Forms.ColumnHeader columnHeader17;
        private System.Windows.Forms.ColumnHeader columnHeader18;
        private System.Windows.Forms.ColumnHeader columnHeader19;
        private System.Windows.Forms.ColumnHeader columnHeader20;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox txtUcusMes;
        private System.Windows.Forms.TextBox txtKontenjani;
        private System.Windows.Forms.TextBox txtUcakTuru;
        private System.Windows.Forms.TextBox txtUcakID;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtUcakAdi;
        private System.Windows.Forms.TextBox txtBakAciklamasi;
        private System.Windows.Forms.TextBox txtSonBakTar;
        private System.Windows.Forms.TextBox txtBakYapMuh;
        private System.Windows.Forms.TextBox txtUcusSur;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ColumnHeader columnHeader5;
        private System.Windows.Forms.TextBox txtBYMID;
        private System.Windows.Forms.ComboBox cbMuhendis;
        private System.Windows.Forms.DateTimePicker dtpSonBakimT;
    }
}