using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace TCPClientAPP
{
    public partial class Form1 : Form
    {
        static private NetworkStream stream;
        static private StreamWriter streamw;
        static private StreamReader streamr;
        static private TcpClient client = new TcpClient();
        static private string nick = "unknown";

        private delegate void DAddItem(String s);

        private void AddItem(String s)
        {
            Chat.Items.Add(s);
        }

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }


        private void button1_Click_1(object sender, EventArgs e)
        {
            label2.Visible = false;
            Nick.Visible = false;
            Connection.Visible = false;
            Chat.Visible = true;
            Message.Visible = true;
            Enviar.Visible = true;
            pictureBox1.Visible = false;

            nick = Nick.Text;

            Conectar();
        }

        private void Form1_Load_1(object sender, EventArgs e)
        {
            label2.Visible = true;
            Nick.Visible = true;
            Connection.Visible = true;
            Chat.Visible = false;
            Message.Visible = false;
            Enviar.Visible = false;
            pictureBox1.Visible = true;
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Enviar_Click(object sender, EventArgs e)
        {
            streamw.WriteLine(Message.Text);
            streamw.Flush();
            Message.Clear();
        }

        void Listen()
        {
            while (client.Connected)
            {
                try
                {
                    this.Invoke(new DAddItem(AddItem), streamr.ReadLine());
                }
                catch
                {
                    MessageBox.Show("Unable to connect");
                    Application.Exit();
                }
            }
        }

        void Conectar()
        {
            try
            {
                client.Connect("127.0.0.1", 8000);
                if (client.Connected)
                {
                    Thread t = new Thread(Listen);

                    stream = client.GetStream();
                    streamw = new StreamWriter(stream);
                    streamr = new StreamReader(stream);

                    streamw.WriteLine(nick);
                    streamw.Flush();

                    t.Start();
                }
                else
                {
                    MessageBox.Show("Server it's not available");
                    Application.Exit();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Server it's not available");
                Application.Exit();
            }
        }

        private void Nick_TextChanged(object sender, EventArgs e)
        {

        }

        private void Message_TextChanged(object sender, EventArgs e)
        {

        }
    }
}