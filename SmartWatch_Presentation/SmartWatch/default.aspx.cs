using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace SmartWatch
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            Timers time = new Timers();
            time.start();
            */
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            Data.DataBase.usersDataTable users = new Data.DataBase.usersDataTable();
            BusinessTier.Admin admin = new BusinessTier.Admin();
            // Saves info on the login page.
            string id = TextBox1.Text;
            string password = TextBox2.Text;
            string role = DropDownList1.Text;

            if ( admin.isMember(id) )
            {
                users = admin.UserLogin(id, password, role);
                if ( users.Rows.Count > 0 )
                {
                    Session.Add("RoleID", id);
                    Session.Add("Role", role);
                    //Redirect to second page.
                    if ( role == "A" )
                    {
                        Server.Transfer("Home_Admin_Assignments.aspx");
                    }
                    if ( role == "D" )
                    {
                        Server.Transfer("Home_Doctor.aspx");
                    }
                    if ( role == "C" )
                    {
                        Server.Transfer("Home_Caretaker.aspx");
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "loginerror('detailErroe');", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "loginerror('noneUser');", true);
            }
        }
        
    }
}