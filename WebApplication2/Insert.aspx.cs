using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Insert : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string host = txtHostName.Text;
            string port = txtPort.Text;
            string username = txtUserName.Text;
            string database = txtDatabase.Text;
            string table = txtTable.Text;

            string connectionString = $"Server={host};Port={port};User ID={username};Database={database};SslMode=Preferred";

            string fields = txtFields.Text;
            string values = txtValues.Text;

            string query = $"INSERT INTO {table} ({fields}) VALUES ({values})";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    lblMessage.Text = $"{rowsAffected} row(s) inserted successfully.";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = $"Error: {ex.Message}";
                }
            }
        }

        protected void btnGenerateRandomData_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtNumberOfRows.Text, out int numberOfRows) || numberOfRows <= 0)
            {
                lblMessage.Text = "Please enter a valid number of rows to generate.";
                return;
            }

            string host = txtHostName.Text;
            string port = txtPort.Text;
            string username = txtUserName.Text;
            string database = txtDatabase.Text;
            string table = txtTable.Text;

            string connectionString = $"Server={host};Port={port};User ID={username};Database={database};SslMode=Preferred";

            string fields = "title, author, date_published, email";
            var valuesBuilder = new System.Text.StringBuilder();

            Random rand = new Random();

            for (int j = 0; j < 50; j++)  
            {
                valuesBuilder.Clear();  

                for (int i = 0; i < numberOfRows; i++)
                {
                    string title = RandomBookTitle(rand);
                    string author = RandomAuthorName(rand);
                    string datePublished = RandomDate(new DateTime(2000, 1, 1), DateTime.Now, rand).ToString("yyyy-MM-dd");
                    string email = RandomEmail(rand);

                    valuesBuilder.Append($"('{title}', '{author}', '{datePublished}', '{email}')");
                    if (i < numberOfRows - 1)
                    {
                        valuesBuilder.Append(", ");
                    }
                }

                string query = $"INSERT INTO {table} ({fields}) VALUES {valuesBuilder}";

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        MySqlCommand cmd = new MySqlCommand(query, connection);
                        int rowsAffected = cmd.ExecuteNonQuery();
                        lblMessage.Text = $"{rowsAffected} row(s) inserted successfully.";
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = $"Error: {ex.Message}";
                    }
                }
            }
        }




        private string RandomBookTitle(Random rand)
        {
            string[] titles = { "The Great Adventure", "Mystery of the Lost City", "Code and Conquer", "Journey to the Unknown", "Fantasy Realm", "Harry Potter" };
            return titles[rand.Next(titles.Length)];
        }

        private string RandomAuthorName(Random rand)
        {
            string[] authors = { "John Smith", "Jane Doe", "Robert Brown", "Emily Davis", "Chris Wilson", "Molnar Levente" };
            return authors[rand.Next(authors.Length)];
        }

        private DateTime RandomDate(DateTime startDate, DateTime endDate, Random rand)
        {
            int range = (endDate - startDate).Days;
            return startDate.AddDays(rand.Next(range));
        }

        private string RandomEmail(Random rand)
        {
            string[] domains = { "example.com", "test.com", "mail.com", "random.org", "webapp.net", "gmail.com" };
            string user = Guid.NewGuid().ToString().Substring(0, 8);
            string domain = domains[rand.Next(domains.Length)];
            return $"{user}@{domain}";
        }
    }
}
