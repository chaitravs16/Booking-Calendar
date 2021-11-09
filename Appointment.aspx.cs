using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ClinicalLabs
{
    public partial class Appointment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=NDS234;Initial Catalog=Photography;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPhotographers();
                Label1.Visible = Label2.Visible = Label17.Visible = false;
                Butt.Disabled = true;
            }
        }

        public void BindPhotographers()
        {
            string com = "Select * from Photographers";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlPhotographer.DataSource = dt;
            ddlPhotographer.DataBind();
            ddlPhotographer.DataTextField = "Name";
            ddlPhotographer.DataValueField = "Id";
            ddlPhotographer.DataBind();
            ddlPhotographer.Items.Insert(0, new ListItem("--Select--","0"));
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Calendar1.SelectedDate.ToShortDateString() == "1/1/0001" || Calendar1.SelectedDate.ToShortDateString() == "01-01-0001")
            {
                Label1.Visible = true;
                Label1.Text = "Please Select Date";
                Label17.Visible = true;
                Label17.ForeColor = System.Drawing.Color.Red;
                Label17.Text = "Please Select Date";
                Butt.Disabled = true;
            }
            else
            {
                DateTime t1 = DateTime.Parse(TextBox5.Text);
                DateTime t2 = DateTime.Parse(TextBox6.Text);

                if (TimeSpan.Compare(t1.TimeOfDay, t2.TimeOfDay) == 0 || TimeSpan.Compare(t1.TimeOfDay, t2.TimeOfDay) == 1)
                {
                    Label17.Visible = true;
                    Label17.ForeColor = System.Drawing.Color.Red;
                    Label17.Text = "Please Select Correct Time";
                    Butt.Disabled = true;
                }
                else {
                    string datee = Convert.ToDateTime(Calendar1.SelectedDate.ToShortDateString()).ToString();
                    string starttime = TextBox5.Text;
                    string endtime = TextBox6.Text;
                    int photographerid = Convert.ToInt32(ddlPhotographer.SelectedValue.ToString());
                    con.Open();
                    SqlCommand cmd1 = con.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    cmd1.CommandText = "select * from Booking where PhotographerId=" + photographerid + " and BDate = Convert(datetime,'" + datee + "',103) and ((CAST(StartTime as time) >= '" + starttime + "' or CAST(StartTime as time) < '" + endtime + "') or  (CAST(EndTime as time) >= '" + starttime + "' or CAST(EndTime as time) < '" + endtime + "'))";
                    cmd1.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    da.Fill(dt);
                    // GridView1.DataSource = dt;
                    //GridView1.DataBind();
                    con.Close();
                    if (dt.Rows.Count > 0)
                    {
                        Label2.Visible = true;
                        Label2.Text = "TIME SLOT NOT AVAILABLE.";
                        Label17.Visible = true;
                        Label17.ForeColor = System.Drawing.Color.Red;
                        Label17.Text = "TIME SLOT NOT AVAILABLE.";
                    }
                    else
                    {
                        Label2.Visible = false;
                        Label17.Visible = true;
                        Label17.ForeColor = System.Drawing.Color.Green;
                        Label17.Text = "Time Slot Available";
                        Label4.Text = ddlPhotographer.SelectedItem.Text;
                        Label6.Text = TextBox1.Text + " " + TextBox2.Text + " <br/>";
                        Label8.Text = TextBox3.Text + " <br/>";
                        Label10.Text = TextBox4.Text + " <br/>";
                        Label12.Text = Calendar1.SelectedDate.ToShortDateString() + " (DD/MM/YYYY)" + " <br/>";
                        //Label14.Text = DropDownList1.SelectedItem.Value + " <br/>";
                        Label14.Text = TextBox5.Text + " - " + TextBox6.Text + " <br/>";
                        Butt.Disabled = false;
                    }
                }
            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date <= DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.White;
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string fname = TextBox1.Text;
            string lname = TextBox2.Text;
            string mail = TextBox3.Text;
            string phone = TextBox4.Text;
            string starttime = TextBox5.Text;
            string endtime = TextBox6.Text;
            string appid = string.Empty;
            string date = Calendar1.SelectedDate.ToShortDateString();
            string photographer = ddlPhotographer.SelectedItem.Text;

            string datee = Convert.ToDateTime(date).ToShortDateString();
            int photographerid = Convert.ToInt32(ddlPhotographer.SelectedValue.ToString());
            con.Open();
            SqlCommand cmd1 = con.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "select * from Booking where PhotographerId=" + photographerid + " and BDate = Convert(datetime,'" + datee + "',103) and ((CAST(StartTime as time) >= '" + starttime + "' or CAST(StartTime as time) < '" + endtime + "') or  (CAST(EndTime as time) >= '" + starttime + "' or CAST(EndTime as time) < '" + endtime + "'))";
            cmd1.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                //Label4.Text = "An Error occured please try again..";
                Server.Transfer("Appointment.aspx");
            }

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT into Booking values (" + photographerid + ",Convert(datetime,'"+date+"',103),'" + starttime + "','" + endtime + "','" + fname + "','" + lname + "','" + mail + "','" + phone + "',1,0); SELECT CAST(scope_identity() AS int)";
            int id = (int)cmd.ExecuteScalar();
            con.Close();

            Application["n_photographerid"] = ddlPhotographer.SelectedItem.Value;
            Application["n_photographer"] = ddlPhotographer.SelectedItem.Text;
            Application["n_fname"] = fname;
            Application["n_lname"] = lname;
            Application["n_mail"] = mail;
            Application["n_phone"] = phone;
            Application["n_starttime"] = starttime;
            Application["n_endtime"] = endtime;
            Application["n_date"] = date + "(DD/MM/YYYY)";
            Application["n_appid"] = id;
            Response.Redirect("AppointmentDetails.aspx");

        }

    }
}