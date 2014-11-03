using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace SmartWatch
{
    public partial class Home_Doctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = (string)(Session["RoleID"]);
            this.lbl_docID.Text = id;
            /*
            Timers time = new Timers();
            time.start();
             * */
        }
       
        protected void Button11_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Server.Transfer("default.aspx");
        }

        protected void btn_myassigns_Click ( object sender, EventArgs e )
        {
            defaultstatus();
            string roleID = this.lbl_docID.Text.ToString().ToUpper();
            Data.DataBase.SelectAllAssignmentDetailsDataTable table = new Data.DataBase.SelectAllAssignmentDetailsDataTable();
            BusinessTier.DoctorOperation doctor = new BusinessTier.DoctorOperation();
            table = doctor.SelectAssignmentDetailsByRole(roleID);
            this.gv_myassignview.DataSource = table;
            this.gv_myassignview.DataBind();
        }

        protected void btn_mypatients_Click ( object sender, EventArgs e )
        {
            defaultstatus();
            string pid = this.txtbox_search.Text.Trim().ToString().ToUpper();
            Data.DataBase.patientsDataTable table = new Data.DataBase.patientsDataTable();
            BusinessTier.CareTakerOperation caretaker = new BusinessTier.CareTakerOperation();
            if ( pid != null )
            {
                if ( pid.Length > 0 )
                {
                    table = caretaker.SearchPatientByID(pid);
                    if ( table.Rows.Count > 0 )
                    {
                        this.gv_mypatientsview.DataSource = table;
                        this.gv_mypatientsview.DataBind();
                    }
                    else
                    {
                        this.lbl_searchwarning.Text = "No such patient, please check patient id";
                        this.lbl_searchwarning.BackColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    table = caretaker.SelectMyPatientViaID("C0001");
                    this.gv_mypatientsview.DataSource = table;
                    this.gv_mypatientsview.DataBind();
                }
            }
        }

        protected void btn_update_Click ( object sender, EventArgs e )
        {
            
            string pid = this.lbl_pid.Text;
            string name = this.lbl_name.Text;
            string gender = this.lbl_gender.Text;
            string tempdate = this.lbl_date.Text;
            string tempage = this.lbl_age.Text;
            string medical = this.txtbox_medical.Text;

            BusinessTier.DoctorOperation doctor = new BusinessTier.DoctorOperation();

            if ( pid.Length > 0 && name.Length > 0 && gender.Length > 0 && tempdate.Length > 0 && tempage.Length > 0 && medical.Length > 0 )
            {
                try
                {
                    DateTime date = DateTime.Parse(tempdate);
                    int age = int.Parse(tempage);
                    doctor.UpdatePatientByID(name, gender, date.Date, age, medical, pid);
                }
                catch ( Exception ex )
                {
                    this.lbl_error.Text = ex.Message;
                }
            }
            else if ( medical.Length == 0 )
            {
                this.lbl_medicalwarning.Text = "This filed is required!";
            }
            else
            {
                this.lbl_error.Text = "Please select your patient first";
            }
        }

        protected void gv_mypatientsview_SelectedIndexChanging ( object sender, GridViewSelectEventArgs e )
        {
            
            int index = e.NewSelectedIndex;
            string pid = this.gv_mypatientsview.Rows[index].Cells[1].Text;
            string name = this.gv_mypatientsview.Rows[index].Cells[2].Text;
            string gender = this.gv_mypatientsview.Rows[index].Cells[3].Text;
            string date = this.gv_mypatientsview.Rows[index].Cells[4].Text;
            string age = this.gv_mypatientsview.Rows[index].Cells[5].Text;
            string medical = this.gv_mypatientsview.Rows[index].Cells[6].Text;

            this.lbl_pid.Text = pid;
            this.lbl_name.Text = name;
            this.lbl_gender.Text = gender;
            this.lbl_date.Text = date;
            this.lbl_age.Text = age;
            this.txtbox_medical.Text = medical;
        }

        protected void defaultstatus ()
        {
            this.lbl_age.Text = "";
            this.lbl_date.Text ="";
            this.lbl_gender.Text="";
            this.lbl_medicalwarning.Text="";
            this.lbl_name.Text="";
            this.lbl_pid.Text="";
            this.txtbox_medical.Text = "";
        }
       
    }
}