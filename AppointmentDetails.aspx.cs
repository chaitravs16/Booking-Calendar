using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicalLabs
{
    public partial class AppointmentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fname = string.Empty;
            string lname = string.Empty;
            string mail = string.Empty;
            string phone = string.Empty;
            string date = string.Empty;
            string starttime = string.Empty;
            string endtime = string.Empty;
            string photographer = string.Empty;
            string appid = string.Empty;

            fname = Application["n_fname"].ToString();
            lname = Application["n_lname"].ToString();
            mail = Application["n_mail"].ToString();
            phone = Application["n_phone"].ToString();
            starttime = Application["n_starttime"].ToString();
            endtime = Application["n_endtime"].ToString();
            date = Application["n_date"].ToString();
            photographer = Application["n_photographer"].ToString();
            appid = Application["n_appid"].ToString();

            Label9.Text = "Booking Calendar";
            Label10.Text = fname; 
            Label11.Text = lname;
            Label12.Text = mail;
            Label13.Text = phone;
            Label14.Text = starttime + " --- " + endtime;
            Label1.Text = photographer;
            Label15.Text = date;
            Label2.Text = "<br/>" + "Date: " + DateTime.Now.ToShortDateString() + "  " + DateTime.Now.ToShortTimeString() + "<br/>";
            Label3.Text = "<br/>" + "Photographer Booking Details" + "<br/>";
            Label16.Text = appid;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Appointment.aspx");
        }
    }
}