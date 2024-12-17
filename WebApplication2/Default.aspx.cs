using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication2
{

    public partial class _Default : Page
    {
        private string HostName = "localhost";
        private string Port = "3307";
        private string UserName = "root";
        protected void Page_Load(object sender, EventArgs e)
        {
            txtHostName.Text = HostName;
            txtPort.Text = Port;
            txtUserName.Text = UserName;

        }
        protected void btnConnect_Click(object sender, EventArgs e)
        {
            // Kapcsolati adatok frissítése a felhasználói bemenet alapján
            string HostName = txtHostName.Text.Trim();
            string Port = txtPort.Text.Trim();
            string UserName = txtUserName.Text.Trim();
            string Database = txtDatabase.Text.Trim();
            string Table = txtTable.Text.Trim();

            if (string.IsNullOrEmpty(HostName) || string.IsNullOrEmpty(Port) ||
                string.IsNullOrEmpty(UserName) || string.IsNullOrEmpty(Database) || string.IsNullOrEmpty(Table))
            {
                lblError.Text = "All fields are required!";
                return;
            }

            DisplayData(HostName, Port, UserName, Database, Table);
        }

        private void DisplayData(string HostName, string Port, string UserName, string Database, string Table)
        {
            // Kapcsolati karakterlánc építése
            MySqlConnectionStringBuilder mySqlConnectionStringBuilder = new MySqlConnectionStringBuilder()
            {
                Server = HostName,
                Port = (uint)Convert.ToInt32(Port),
                UserID = UserName,
                Database = Database,
                SslMode = MySqlSslMode.Preferred
            };
            string ConnectionString = mySqlConnectionStringBuilder.ConnectionString;

            using (MySqlConnection MyConn2 = new MySqlConnection(ConnectionString))
            {
                // A lekérdezés a megadott táblára
                string sqlQuery = $"SELECT * FROM `{Table}` LIMIT 8000;";
                try
                {
                    MyConn2.Open();
                    MySqlCommand MyCommand2 = new MySqlCommand(sqlQuery, MyConn2);
                    MySqlDataAdapter MyAdapter = new MySqlDataAdapter();
                    DataTable dTable = new DataTable();
                    MyAdapter.SelectCommand = MyCommand2;
                    MyAdapter.Fill(dTable);

                    myGridView.DataSource = dTable;
                    myGridView.DataBind();
                    lblError.Text = ""; // Töröljük a hibaüzenetet, ha sikeres
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}
