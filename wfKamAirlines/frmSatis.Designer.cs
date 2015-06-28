namespace wfKamAirlines
{
    partial class frmSatis
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmSatis));
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtTutar = new System.Windows.Forms.TextBox();
            this.txtKontenjan = new System.Windows.Forms.TextBox();
            this.txtKapasite = new System.Windows.Forms.TextBox();
            this.btnKaydet = new System.Windows.Forms.Button();
            this.txtUcusID = new System.Windows.Forms.TextBox();
            this.btnUcusBul = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.txtMusteriID = new System.Windows.Forms.TextBox();
            this.btnMusteriBul = new System.Windows.Forms.Button();
            this.txtMusteri = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.lvSatislar = new System.Windows.Forms.ListView();
            this.columnHeader11 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader12 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader13 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader14 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader16 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.txtnereden = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtnereye = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtKtarihi = new System.Windows.Forms.TextBox();
            this.txtVtarihi = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(235, 329);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(32, 13);
            this.label6.TabIndex = 70;
            this.label6.Text = "Tutar";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(20, 323);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(0, 13);
            this.label5.TabIndex = 69;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(235, 277);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(84, 13);
            this.label4.TabIndex = 68;
            this.label4.Text = "Uçak Kapasitesi";
            // 
            // txtTutar
            // 
            this.txtTutar.Location = new System.Drawing.Point(322, 326);
            this.txtTutar.Name = "txtTutar";
            this.txtTutar.ReadOnly = true;
            this.txtTutar.Size = new System.Drawing.Size(53, 20);
            this.txtTutar.TabIndex = 67;
            this.txtTutar.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtKontenjan
            // 
            this.txtKontenjan.Location = new System.Drawing.Point(322, 300);
            this.txtKontenjan.Name = "txtKontenjan";
            this.txtKontenjan.ReadOnly = true;
            this.txtKontenjan.Size = new System.Drawing.Size(53, 20);
            this.txtKontenjan.TabIndex = 66;
            this.txtKontenjan.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtKapasite
            // 
            this.txtKapasite.Location = new System.Drawing.Point(322, 274);
            this.txtKapasite.Name = "txtKapasite";
            this.txtKapasite.ReadOnly = true;
            this.txtKapasite.Size = new System.Drawing.Size(53, 20);
            this.txtKapasite.TabIndex = 65;
            this.txtKapasite.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtKapasite.TextChanged += new System.EventHandler(this.txtAdet_TextChanged);
            // 
            // btnKaydet
            // 
            this.btnKaydet.Enabled = false;
            this.btnKaydet.Location = new System.Drawing.Point(649, 313);
            this.btnKaydet.Name = "btnKaydet";
            this.btnKaydet.Size = new System.Drawing.Size(92, 23);
            this.btnKaydet.TabIndex = 62;
            this.btnKaydet.Text = "Satış Yap";
            this.btnKaydet.UseVisualStyleBackColor = true;
            this.btnKaydet.Click += new System.EventHandler(this.btnKaydet_Click);
            // 
            // txtUcusID
            // 
            this.txtUcusID.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.txtUcusID.Location = new System.Drawing.Point(4, 40);
            this.txtUcusID.Name = "txtUcusID";
            this.txtUcusID.ReadOnly = true;
            this.txtUcusID.Size = new System.Drawing.Size(1, 20);
            this.txtUcusID.TabIndex = 59;
            this.txtUcusID.Visible = false;
            // 
            // btnUcusBul
            // 
            this.btnUcusBul.Location = new System.Drawing.Point(180, 122);
            this.btnUcusBul.Name = "btnUcusBul";
            this.btnUcusBul.Size = new System.Drawing.Size(39, 23);
            this.btnUcusBul.TabIndex = 58;
            this.btnUcusBul.Text = "...";
            this.btnUcusBul.UseVisualStyleBackColor = true;
            this.btnUcusBul.Click += new System.EventHandler(this.btnUcusBul_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label3.Location = new System.Drawing.Point(102, 92);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(59, 18);
            this.label3.TabIndex = 56;
            this.label3.Text = "Uçuşlar";
            // 
            // txtMusteriID
            // 
            this.txtMusteriID.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.txtMusteriID.Font = new System.Drawing.Font("Microsoft Sans Serif", 6F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.txtMusteriID.Location = new System.Drawing.Point(4, 15);
            this.txtMusteriID.Name = "txtMusteriID";
            this.txtMusteriID.ReadOnly = true;
            this.txtMusteriID.Size = new System.Drawing.Size(1, 17);
            this.txtMusteriID.TabIndex = 55;
            this.txtMusteriID.Visible = false;
            // 
            // btnMusteriBul
            // 
            this.btnMusteriBul.Location = new System.Drawing.Point(180, 38);
            this.btnMusteriBul.Name = "btnMusteriBul";
            this.btnMusteriBul.Size = new System.Drawing.Size(39, 23);
            this.btnMusteriBul.TabIndex = 54;
            this.btnMusteriBul.Text = "...";
            this.btnMusteriBul.UseVisualStyleBackColor = true;
            this.btnMusteriBul.Click += new System.EventHandler(this.btnMusteriBul_Click);
            // 
            // txtMusteri
            // 
            this.txtMusteri.Location = new System.Drawing.Point(72, 39);
            this.txtMusteri.Name = "txtMusteri";
            this.txtMusteri.ReadOnly = true;
            this.txtMusteri.Size = new System.Drawing.Size(110, 20);
            this.txtMusteri.TabIndex = 53;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 39);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(41, 13);
            this.label2.TabIndex = 52;
            this.label2.Text = "Müşteri";
            // 
            // lvSatislar
            // 
            this.lvSatislar.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader11,
            this.columnHeader1,
            this.columnHeader4,
            this.columnHeader12,
            this.columnHeader13,
            this.columnHeader14,
            this.columnHeader16,
            this.columnHeader2,
            this.columnHeader3});
            this.lvSatislar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lvSatislar.FullRowSelect = true;
            this.lvSatislar.GridLines = true;
            this.lvSatislar.Location = new System.Drawing.Point(235, 15);
            this.lvSatislar.Name = "lvSatislar";
            this.lvSatislar.Size = new System.Drawing.Size(506, 253);
            this.lvSatislar.TabIndex = 60;
            this.lvSatislar.UseCompatibleStateImageBehavior = false;
            this.lvSatislar.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader11
            // 
            this.columnHeader11.Text = "Rezerv.ID";
            this.columnHeader11.Width = 0;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Nereden";
            this.columnHeader1.Width = 123;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Nereye";
            this.columnHeader4.Width = 120;
            // 
            // columnHeader12
            // 
            this.columnHeader12.Text = "MusteriID";
            this.columnHeader12.Width = 0;
            // 
            // columnHeader13
            // 
            this.columnHeader13.Text = "Müşteri Ad Soyad";
            this.columnHeader13.Width = 176;
            // 
            // columnHeader14
            // 
            this.columnHeader14.Text = "Uçuş Kodu";
            this.columnHeader14.Width = 0;
            // 
            // columnHeader16
            // 
            this.columnHeader16.Text = "Silindi";
            this.columnHeader16.Width = 0;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Fiyat";
            this.columnHeader2.Width = 82;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Uçus Tarihi";
            this.columnHeader3.Width = 177;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(235, 304);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(85, 13);
            this.label8.TabIndex = 75;
            this.label8.Text = "Kalan Kontenjan";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(20, 126);
            this.label9.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(48, 13);
            this.label9.TabIndex = 76;
            this.label9.Text = "Nereden";
            // 
            // txtnereden
            // 
            this.txtnereden.Location = new System.Drawing.Point(72, 122);
            this.txtnereden.Margin = new System.Windows.Forms.Padding(2);
            this.txtnereden.Name = "txtnereden";
            this.txtnereden.ReadOnly = true;
            this.txtnereden.Size = new System.Drawing.Size(112, 20);
            this.txtnereden.TabIndex = 77;
            this.txtnereden.TextChanged += new System.EventHandler(this.txtnereden_TextChanged);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(20, 146);
            this.label10.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(41, 13);
            this.label10.TabIndex = 78;
            this.label10.Text = "Nereye";
            // 
            // txtnereye
            // 
            this.txtnereye.Location = new System.Drawing.Point(72, 144);
            this.txtnereye.Margin = new System.Windows.Forms.Padding(2);
            this.txtnereye.Name = "txtnereye";
            this.txtnereye.ReadOnly = true;
            this.txtnereye.Size = new System.Drawing.Size(112, 20);
            this.txtnereye.TabIndex = 79;
            this.txtnereye.TextChanged += new System.EventHandler(this.txtnereye_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 168);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(43, 13);
            this.label1.TabIndex = 80;
            this.label1.Text = "K.Tarihi";
            // 
            // txtKtarihi
            // 
            this.txtKtarihi.Location = new System.Drawing.Point(72, 166);
            this.txtKtarihi.Margin = new System.Windows.Forms.Padding(2);
            this.txtKtarihi.Name = "txtKtarihi";
            this.txtKtarihi.ReadOnly = true;
            this.txtKtarihi.Size = new System.Drawing.Size(112, 20);
            this.txtKtarihi.TabIndex = 81;
            this.txtKtarihi.TextChanged += new System.EventHandler(this.txtKtarihi_TextChanged);
            // 
            // txtVtarihi
            // 
            this.txtVtarihi.Location = new System.Drawing.Point(72, 189);
            this.txtVtarihi.Margin = new System.Windows.Forms.Padding(2);
            this.txtVtarihi.Name = "txtVtarihi";
            this.txtVtarihi.ReadOnly = true;
            this.txtVtarihi.Size = new System.Drawing.Size(112, 20);
            this.txtVtarihi.TabIndex = 82;
            this.txtVtarihi.TextChanged += new System.EventHandler(this.txtVtarihi_TextChanged);
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(20, 192);
            this.label11.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(43, 13);
            this.label11.TabIndex = 80;
            this.label11.Text = "V.Tarihi";
            // 
            // frmSatis
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.ClientSize = new System.Drawing.Size(786, 364);
            this.Controls.Add(this.btnMusteriBul);
            this.Controls.Add(this.txtMusteri);
            this.Controls.Add(this.txtVtarihi);
            this.Controls.Add(this.txtKtarihi);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtnereye);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtTutar);
            this.Controls.Add(this.txtKontenjan);
            this.Controls.Add(this.txtKapasite);
            this.Controls.Add(this.btnKaydet);
            this.Controls.Add(this.lvSatislar);
            this.Controls.Add(this.txtUcusID);
            this.Controls.Add(this.btnUcusBul);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtMusteriID);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtnereden);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "frmSatis";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Satış İşlemleri Ekranı";
            this.Load += new System.EventHandler(this.frmSatis_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtTutar;
        private System.Windows.Forms.TextBox txtKontenjan;
        private System.Windows.Forms.TextBox txtKapasite;
        private System.Windows.Forms.Button btnKaydet;
        private System.Windows.Forms.TextBox txtUcusID;
        private System.Windows.Forms.Button btnUcusBul;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtMusteriID;
        private System.Windows.Forms.Button btnMusteriBul;
        private System.Windows.Forms.TextBox txtMusteri;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ListView lvSatislar;
        private System.Windows.Forms.ColumnHeader columnHeader11;
        private System.Windows.Forms.ColumnHeader columnHeader12;
        private System.Windows.Forms.ColumnHeader columnHeader13;
        private System.Windows.Forms.ColumnHeader columnHeader14;
        private System.Windows.Forms.ColumnHeader columnHeader16;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtnereden;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtnereye;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtKtarihi;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.TextBox txtVtarihi;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.ColumnHeader columnHeader4;
    }
}