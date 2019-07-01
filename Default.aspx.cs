using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace CRUD
{
    public partial class Default : System.Web.UI.Page

    {

        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        //string connectionString = "Data Source=(local); Initial Catalog=Practise; integrated security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridView();
            }
        }

        void PopulateGridView()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon=new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Students", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvStudents.DataSource = dtbl;
                gvStudents.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvStudents.DataSource = dtbl;
                gvStudents.DataBind();
                gvStudents.Rows[0].Cells.Clear();
                gvStudents.Rows[0].Cells.Add(new TableCell());
                gvStudents.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvStudents.Rows[0].Cells[0].Text = "No Data Found";
                gvStudents.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            

        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO Students (Name,Father,Mother,Age,Class,School) VALUES(@Name,@Father,@Mother,@Age,@Class,@School)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);


                        sqlCmd.Parameters.AddWithValue("@Name", (gvStudents.FooterRow.FindControl("txtNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Father", (gvStudents.FooterRow.FindControl("txtFatherFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Mother", (gvStudents.FooterRow.FindControl("txtMotherFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Age", (gvStudents.FooterRow.FindControl("txtAgeFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Class", (gvStudents.FooterRow.FindControl("ddlClassFooter") as DropDownList).SelectedItem.Text);
                        sqlCmd.Parameters.AddWithValue("@School", (gvStudents.FooterRow.FindControl("txtSchoolFooter") as TextBox).Text.Trim());

                        sqlCmd.ExecuteNonQuery();
                        PopulateGridView();
                        lblSuccessMessage.Text = "New Record Added";
                        lblErrorMessage.Text = "";

                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;

            }
        }

        protected void gvStudents_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvStudents.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void gvStudents_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvStudents.EditIndex = -1;
            PopulateGridView();

        }

        protected void gvStudents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
               
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE Students SET Name=@Name,Father=@Father,Mother=@Mother,Age=@Age,Class=@Class,School=@School WHERE ID=@ID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);


                    sqlCmd.Parameters.AddWithValue("@Name", (gvStudents.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Father", (gvStudents.Rows[e.RowIndex].FindControl("txtFather") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Mother", (gvStudents.Rows[e.RowIndex].FindControl("txtMother") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Age", (gvStudents.Rows[e.RowIndex].FindControl("txtAge") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Class", (gvStudents.Rows[e.RowIndex].FindControl("txtClass") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@School", (gvStudents.Rows[e.RowIndex].FindControl("txtSchool") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue(@"ID", Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value.ToString()));

                    sqlCmd.ExecuteNonQuery();
                    gvStudents.EditIndex = -1;
                    PopulateGridView();
                    lblSuccessMessage.Text = "Record Updated";
                    lblErrorMessage.Text = "";

                }
                
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;

            } 

        }

        protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM Students WHERE ID=@ID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue(@"ID", Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value.ToString()));

                    sqlCmd.ExecuteNonQuery();
                    
                    PopulateGridView();
                    lblSuccessMessage.Text = "Record Deleted Seccessfully";
                    lblErrorMessage.Text = "";

                }

            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {   
            SqlConnection sqlCon = new SqlConnection(connectionString);
            string search = "SELECT * FROM Students WHERE (Name Like '%'+@Name+'%')";
            SqlCommand sqlCmd = new SqlCommand(search, sqlCon);
            sqlCmd.Parameters.AddWithValue("@Name",SqlDbType.VarChar).Value=txtSearch.Text;
            sqlCon.Open();
            sqlCmd.ExecuteNonQuery();

            SqlDataAdapter sqlDa = new SqlDataAdapter();
            sqlDa.SelectCommand = sqlCmd;

            DataSet ds = new DataSet();
            sqlDa.Fill(ds, "Name");

          
            gvStudents.DataSource = ds;
            gvStudents.DataBind();

            sqlCon.Close();
            
            


        }
    }
}