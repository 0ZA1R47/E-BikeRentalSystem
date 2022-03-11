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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string myconnctn = @"server = localhost; user id = root; database = ebike; persistsecurityinfo=True; password=root";
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
                lblUserDetails.Text = "Username :" + Session["username"];
            }
            lblUserDetails.Text = "Username :" + Session["username"];*/
            if (!IsPostBack)
            {
                Clear();
                GridFill();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(myconnctn))
                {
                    conn.Open();
                    MySqlCommand cmnd = new MySqlCommand("BikeAddorEdit", conn);
                    cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmnd.Parameters.AddWithValue("_Bike_id", Convert.ToInt32(hfBike_id.Value == ""?"0" : hfBike_id.Value));
                    cmnd.Parameters.AddWithValue("_Bike_no", txtBikeNo.Text.Trim());
                    cmnd.Parameters.AddWithValue("_model", txtModel.Text.Trim());
                    cmnd.Parameters.AddWithValue("_colour", txtColour.Text.Trim());
                    cmnd.Parameters.AddWithValue("_statn_no", Convert.ToInt32(txtStationNo.Text.Trim()));
                    cmnd.Parameters.AddWithValue("_shel_life", txtShelfLife.Text.Trim());
                    cmnd.Parameters.AddWithValue("_mantnc", txtMaintenance.Text.Trim());
                    cmnd.Parameters.AddWithValue("_battery_status", txtBatteryStatus.Text.Trim());
                    cmnd.Parameters.AddWithValue("_mileage", Convert.ToInt32(txtMileage.Text.Trim()));
                    cmnd.ExecuteNonQuery();
                    GridFill();
                    Clear();
                    lblSuccessMessage.Text = "Data Saved Succesfully";

                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
                
            }
        }
        void Clear()
        {
            hfBike_id.Value = "";
            txtBikeNo.Text = txtModel.Text = txtColour.Text = txtStationNo.Text = txtShelfLife.Text = txtMaintenance.Text = txtBatteryStatus.Text= txtMileage.Text = "";
            btnSave.Text = "Save";
            btnDelete.Enabled = false;
            lblErrorMessage.Text = lblSuccessMessage.Text = "";
        }

        void GridFill()
        {
            using (MySqlConnection conn1 = new MySqlConnection(myconnctn))
            {
                conn1.Open();
                MySqlDataAdapter SqlDa = new MySqlDataAdapter("BikeViewAll", conn1);
                SqlDa.SelectCommand.CommandType= System.Data.CommandType.StoredProcedure;
                System.Data.DataTable dtbl = new  System.Data.DataTable();
                SqlDa.Fill(dtbl);
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
            }

        }

        protected void lnkSelect_OnClick(object sender, EventArgs e)
        {
            LinkButton link1 = sender as LinkButton;
            int bike_id = Convert.ToInt32(link1.CommandArgument);
            using (MySqlConnection conn = new MySqlConnection(myconnctn))
            {
                conn.Open();
                MySqlDataAdapter SqlDa = new MySqlDataAdapter("BikeViewByID", conn);
                SqlDa.SelectCommand.Parameters.AddWithValue("_Bike_id", bike_id);
                SqlDa.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                System.Data.DataTable dtbl = new System.Data.DataTable();
                SqlDa.Fill(dtbl);
                
                txtBikeNo.Text = dtbl.Rows[0][1].ToString();
                txtModel.Text = dtbl.Rows[0][2].ToString();
                txtColour.Text = dtbl.Rows[0][3].ToString();
                txtStationNo.Text = dtbl.Rows[0][4].ToString();
                txtShelfLife.Text = dtbl.Rows[0][5].ToString();
                txtMaintenance.Text = dtbl.Rows[0][6].ToString();
                txtBatteryStatus.Text = dtbl.Rows[0][7].ToString();
                txtMileage.Text = dtbl.Rows[0][8].ToString();

                hfBike_id.Value = dtbl.Rows[0][0].ToString();
                
                btnSave.Text = "Update";
                btnDelete.Enabled = true;

            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (MySqlConnection conn = new MySqlConnection(myconnctn))
            {
                conn.Open();
                MySqlCommand cmnd = new MySqlCommand("BikeDeleteById", conn);
                cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                cmnd.Parameters.AddWithValue("_Bike_id", Convert.ToInt32(hfBike_id.Value == "" ? "0" : hfBike_id.Value));
                cmnd.ExecuteNonQuery();
                GridFill();
                Clear();
                
                lblSuccessMessage.Text = "Data Deleted Succesfully";

            }

        }

        protected void btn_Clear_Clickk(object sender, EventArgs e)
        {
            Clear();
        }
    }
}