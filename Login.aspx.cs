using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrormessage.Visible = false;
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            using (MySqlConnection conn = new MySqlConnection("server = localhost; user id = root; database = ebike;persistsecurityinfo=True;password=root"))
            {
                conn.Open();
                string querry = "SELECT COUNT(1) FROM userlogin WHERE username=@username AND password=@password";
                MySqlCommand cmnd = new MySqlCommand(querry, conn);
                cmnd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                cmnd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                int count = Convert.ToInt32(cmnd.ExecuteScalar());
                if (count == 1)
                {
                    Session["username"] = txtUsername.Text.Trim();
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    lblErrormessage.Visible = true;
                }
            }


        }
    }
}