using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWatch
{
    public partial class Home_Admin_Patients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string roleID = ( string )(Session["RoleID"]);
            this.roleID_lbl.Text = roleID;
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Server.Transfer("Login.aspx");
        }

        //protected void btn_search_Click ( object sender, EventArgs e )
        //{
        //    try
        //    {
        //        //defaultstatus();
        //        string input = this.txtbox_search.Text.ToString();
        //        BusinessTier.Admin admin = new BusinessTier.Admin();
        //        Data.DataBase.patientsDataTable table =  new Data.DataBase.patientsDataTable();
                
        //        if ( input.Length > 0 )
        //        {
        //            table = admin.SearchPatientByID(input);
        //            if ( table.Rows.Count > 0 )
        //            {
        //                this.gv_patientview.DataSource = table;
        //                this.gv_patientview.DataBind();
        //            }
        //            else
        //            {
        //                this.lbl_searchwarning.Text = "Invalid ID, Please confirm the IDs before search...";
        //                this.lbl_searchwarning.BackColor = System.Drawing.Color.Red;
        //            }
        //        }
        //        else
        //        {
        //            table = admin.SelectAllPatients();
        //            this.gv_patientview.DataSource = table;
        //            this.gv_patientview.DataBind();
        //        } 
        //    }
        //    catch ( Exception ex )
        //    {
        //        this.lbl_searchwarning.Text = ex.Message;
        //    }
        //}

        //protected void btn_addpatient_Click ( object sender, EventArgs e )
        //{
        //    //defaultstatus();
        //    string pid = this.txtbox_patientid.Text;
        //    string name = this.txtbox_name.Text;
        //    string gender = this.txtbox_gender.Text;
        //    string tempdate = this.txtbox_birthday.Text;
        //    string tempage = this.txtbox_age.Text;
        //    string medical = this.txtbox_medical.Text;

        //    if ( pid.Length > 0 && name.Length > 0 && gender.Length > 0 && tempdate.Length > 0 && tempage.Length > 0 && medical.Length > 0 )
        //    {
        //        BusinessTier.Admin admin = new BusinessTier.Admin();
        //        Data.DataBase.patientsDataTable table = new Data.DataBase.patientsDataTable();
        //        table = admin.SearchPatientByID(pid);
        //        if ( table.Rows.Count > 0 )
        //        {
        //            this.lbl_idwarning.Text = "This ID is already exsit";
        //            this.lbl_idwarning.BackColor = System.Drawing.Color.Red;
        //        }
        //        else
        //        {
        //            try
        //            {
        //                int age = int.Parse(tempage);
        //                DateTime date = DateTime.Parse(tempdate);
        //                admin.AddPatient(pid, name, gender, date.Date, age, medical);
        //            }
        //            catch ( Exception ex )
        //            {
        //                this.lbl_agewarning.Text = ex.Message.ToString();
        //                this.lbl_birthdaywarning.Text = ex.Message.ToString();
        //            }
        //        }
        //    }
        //    else
        //    {
        //        errorWarning();
        //    }
        //}


        //protected void btn_update_Click ( object sender, EventArgs e )
        //{
        //    //defaultstatus();
        //    string pid = this.txtbox_patientid.Text;
        //    string name = this.txtbox_name.Text;
        //    string gender = this.txtbox_gender.Text;
        //    string tempdate = this.txtbox_birthday.Text;
        //    string tempage = this.txtbox_age.Text;
        //    string medical = this.txtbox_medical.Text;

        //    if ( pid.Length > 0 && name.Length > 0 && gender.Length > 0 && tempdate.Length > 0 && tempage.Length > 0 && medical.Length > 0 )
        //    {
        //        BusinessTier.Admin admin = new BusinessTier.Admin();
        //        Data.DataBase.patientsDataTable table = new Data.DataBase.patientsDataTable();
        //        table = admin.SearchPatientByID(pid);
        //        if ( table.Rows.Count > 0 )
        //        {
        //            try
        //            {
        //                DateTime date =DateTime.Parse(tempdate);
        //                int age = int.Parse(tempage);
        //                admin.UpdatePatientByID(name, gender, date.Date, age, medical, pid);
        //            }
        //            catch ( Exception ex )
        //            {
        //                this.lbl_searchwarning.Text = ex.Message;
        //            }
        //        }
        //        else
        //        {
        //            this.lbl_idwarning.Text = "This ID is not exsit";
        //            this.lbl_idwarning.BackColor = System.Drawing.Color.Red;
        //        }
        //    }
        //    else
        //    {
        //        errorWarning();
        //    }
        //}

        //protected void gv_patientview_SelectedIndexChanging ( object sender, GridViewSelectEventArgs e )
        //{
        //    //defaultstatus();
        //    int index = e.NewSelectedIndex;
        //    string pid = this.gv_patientview.Rows[index].Cells[2].Text;
        //    string name = this.gv_patientview.Rows[index].Cells[3].Text;
        //    string gender = this.gv_patientview.Rows[index].Cells[4].Text;
        //    string date = this.gv_patientview.Rows[index].Cells[5].Text;
        //    string age = this.gv_patientview.Rows[index].Cells[6].Text;
        //    string medical = this.gv_patientview.Rows[index].Cells[7].Text;

        //    this.txtbox_patientid.Text = pid;
        //    this.txtbox_name.Text = name;
        //    this.txtbox_gender.Text = gender;
        //    this.txtbox_birthday.Text = date;
        //    this.txtbox_age.Text = age;
        //    this.txtbox_medical.Text = medical;
        //}

        //protected void gv_patientview_RowDeleting ( object sender, GridViewDeleteEventArgs e )
        //{
        //    //defaultstatus();
        //    BusinessTier.Admin admin = new BusinessTier.Admin();
        //    string P_id = this.gv_patientview.Rows[e.RowIndex].Cells[2].Text;
        //    admin.DeletePatient(P_id);
        //}

        //protected void defaultstatus ()
        //{
        //    this.lbl_idwarning.Text = "";
        //    this.lbl_idwarning.BackColor = System.Drawing.Color.White;
        //    this.lbl_namewarning.Text ="";
        //    this.lbl_namewarning.BackColor = System.Drawing.Color.White;
        //    this.lbl_searchwarning.Text ="";
        //    this.lbl_searchwarning.BackColor = System.Drawing.Color.White;
        //    this.lbl_genderwarning.Text="";
        //    this.lbl_genderwarning.BackColor = System.Drawing.Color.White;
        //    this.lbl_agewarning.Text="";
        //    this.lbl_agewarning.BackColor = System.Drawing.Color.White;
        //    this.lbl_birthdaywarning.Text = "";
        //    this.lbl_birthdaywarning.BackColor = System.Drawing.Color.White;
        //    this.lbl_medicalwarning.Text = "";
        //    this.lbl_medicalwarning.BackColor = System.Drawing.Color.White;
        //}





        //protected void errorWarning ()
        //{
        //    string warning = "This field is required";
        //    this.lbl_idwarning.Text = warning;
        //    this.lbl_idwarning.BackColor = System.Drawing.Color.Red;
        //    this.lbl_namewarning.Text = warning;
        //    this.lbl_namewarning.BackColor = System.Drawing.Color.Red;
        //    this.lbl_genderwarning.Text=warning;
        //    this.lbl_genderwarning.BackColor = System.Drawing.Color.Red;
        //    this.lbl_agewarning.Text= "Number is required";
        //    this.lbl_agewarning.BackColor = System.Drawing.Color.Red;
        //    this.lbl_birthdaywarning.Text = "Date is required";
        //    this.lbl_birthdaywarning.BackColor = System.Drawing.Color.Red;
        //    this.lbl_medicalwarning.Text = warning;
        //    this.lbl_medicalwarning.BackColor = System.Drawing.Color.Red;

        //}
    }
}