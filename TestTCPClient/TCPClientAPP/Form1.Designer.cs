namespace TCPClientAPP
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.Connection = new System.Windows.Forms.Button();
            this.Nick = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.Chat = new System.Windows.Forms.ListBox();
            this.Message = new System.Windows.Forms.TextBox();
            this.Enviar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // Connection
            // 
            this.Connection.Location = new System.Drawing.Point(171, 218);
            this.Connection.Name = "Connection";
            this.Connection.Size = new System.Drawing.Size(75, 20);
            this.Connection.TabIndex = 0;
            this.Connection.Text = "Connect";
            this.Connection.UseVisualStyleBackColor = true;
            this.Connection.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // Nick
            // 
            this.Nick.Location = new System.Drawing.Point(12, 218);
            this.Nick.Name = "Nick";
            this.Nick.Size = new System.Drawing.Size(153, 20);
            this.Nick.TabIndex = 1;
            this.Nick.TextChanged += new System.EventHandler(this.Nick_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 202);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(129, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Please enter a Nickname:";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.InitialImage = ((System.Drawing.Image)(resources.GetObject("pictureBox1.InitialImage")));
            this.pictureBox1.Location = new System.Drawing.Point(12, 27);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(231, 154);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 3;
            this.pictureBox1.TabStop = false;
            // 
            // Chat
            // 
            this.Chat.FormattingEnabled = true;
            this.Chat.Location = new System.Drawing.Point(12, 26);
            this.Chat.Name = "Chat";
            this.Chat.Size = new System.Drawing.Size(231, 160);
            this.Chat.TabIndex = 4;
            this.Chat.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
            // 
            // Message
            // 
            this.Message.Location = new System.Drawing.Point(12, 218);
            this.Message.Name = "Message";
            this.Message.Size = new System.Drawing.Size(153, 20);
            this.Message.TabIndex = 5;
            this.Message.TextChanged += new System.EventHandler(this.Message_TextChanged);
            // 
            // Enviar
            // 
            this.Enviar.Location = new System.Drawing.Point(171, 218);
            this.Enviar.Name = "Enviar";
            this.Enviar.Size = new System.Drawing.Size(75, 20);
            this.Enviar.TabIndex = 6;
            this.Enviar.Text = "Send";
            this.Enviar.UseVisualStyleBackColor = true;
            this.Enviar.Click += new System.EventHandler(this.Enviar_Click);
            // 
            // Form1
            // 
            this.ClientSize = new System.Drawing.Size(258, 250);
            this.Controls.Add(this.Enviar);
            this.Controls.Add(this.Message);
            this.Controls.Add(this.Chat);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.Nick);
            this.Controls.Add(this.Connection);
            this.Name = "Form1";
            this.Text = "SilverTextBeta";
            this.Load += new System.EventHandler(this.Form1_Load_1);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button Connect;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button Connection;
        private System.Windows.Forms.TextBox Nick;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.ListBox Chat;
        private System.Windows.Forms.TextBox Message;
        private System.Windows.Forms.Button Enviar;
    }
}

