using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace SmartWatch
{
    public partial class Home_Admin_Doctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string roleID = ( string )(Session["RoleID"]);
            this.roleID_lbl.Text = roleID;
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

        protected void btn_search_Click ( object sender, EventArgs e )
        {
            //defaultstatus();
            string input = this.txtbox_search.Text.ToString();
            BusinessTier.Admin admin = new BusinessTier.Admin();
            Data.DataBase.doctorsDataTable table = new Data.DataBase.doctorsDataTable();
            if ( input.Length > 0 )
            {
                table = admin.SearchDoctorByID(input);
                if ( table.Rows.Count > 0 )
                {
                    this.gv_doctorview.DataSource = table;
                    this.gv_doctorview.DataBind();
                }
                else
                {
                    this.lbl_searchwarning.Text = "Invalid ID, Please confirm the IDs before search...";
                    this.lbl_searchwarning.BackColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                table = admin.SelectAllDoctors();
                this.gv_doctorview.DataSource = table;
                this.gv_doctorview.DataBind();
            }
        }

        protected void btn_adddoctor_Click ( object sender, EventArgs e )
        {
            //defaultstatus();
            string did = this.txtbox_did.Text;
            string name = this.txtbox_name.Text;
            string gender = this.txtbox_gender.Text;
            string tempage = this.txtbox_age.Text;
            //int age = int.Parse(this.txtbox_age.Text);

            if ( did.Length > 0 && name.Length > 0 && gender.Length > 0 && tempage.Length > 0 )
            {
                BusinessTier.Admin admin = new BusinessTier.Admin();
                Data.DataBase.doctorsDataTable table = new Data.DataBase.doctorsDataTable();
                table = admin.SearchDoctorByID(did);
                if ( table.Rows.Count > 0 )
                {
                    this.lbl_idwarning.Text = "This ID is already exsit";
                    this.lbl_idwarning.BackColor = System.Drawing.Color.Red;
                }
                else
                {
                    int age = int.Parse(tempage);
                    admin.AddDoctor(did, name, gender, age);
                    this.gv_doctorview.DataSource = admin.SelectAllDoctors();
                    this.gv_doctorview.DataBind();
                }
            }
            else
            {
                errorWarning();
            }
        }

        protected void btn_update_Click ( object sender, EventArgs e )
        {
            //defaultstatus();
            string did = this.txtbox_did.Text;
            string name = this.txtbox_name.Text;
            string gender = this.txtbox_gender.Text;
            string tempage = this.txtbox_age.Text;

            if ( did.Length > 0 && name.Length > 0 && gender.Length > 0 && tempage.ToString().Length > 0 )
            {
                Data.DataBase.doctorsDataTable table = new Data.DataBase.doctorsDataTable();
                BusinessTier.Admin admin = new BusinessTier.Admin();
                table = admin.SearchDoctorByID(did);
                if ( table.Rows.Count > 0 )
                {
                    int age = int.Parse(tempage);
                    admin.UpdateDoctorByID(name, gender, age, did);
                }
                else
                {
                    this.lbl_idwarning.Text = "This ID is not exsit";
                    this.lbl_idwarning.BackColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                errorWarning();
            }
        }

        protected void gv_doctorview_RowDeleting ( object sender, GridViewDeleteEventArgs e )
        {
            //defaultstatus();
            BusinessTier.Admin admin = new BusinessTier.Admin();
            string D_id = this.gv_doctorview.Rows[e.RowIndex].Cells[2].Text;
            admin.DeleteDoctor(D_id);
        }

        protected void gv_doctorview_SelectedIndexChanging ( object sender, GridViewSelectEventArgs e )
        {
            //defaultstatus();
            int index = e.NewSelectedIndex;
            string did = this.gv_doctorview.Rows[index].Cells[2].Text;
            string name = this.gv_doctorview.Rows[index].Cells[3].Text;
            string gender = this.gv_doctorview.Rows[index].Cells[4].Text;
            string age = this.gv_doctorview.Rows[index].Cells[5].Text;

            this.txtbox_did.Text = did;
            this.txtbox_name.Text = name;
            this.txtbox_gender.Text = gender;
            this.txtbox_age.Text = age;
        }

        protected void defaultstatus ()
        {
            this.lbl_idwarning.Text = "";
            this.lbl_idwarning.BackColor = System.Drawing.Color.White;
            this.lbl_namewarning.Text ="";
            this.lbl_namewarning.BackColor = System.Drawing.Color.White;
            this.lbl_searchwarning.Text ="";
            this.lbl_searchwarning.BackColor = System.Drawing.Color.White;
            this.lbl_genderwarning.Text="";
            this.lbl_genderwarning.BackColor = System.Drawing.Color.White;
            this.lbl_agewarning.Text="";
            this.lbl_agewarning.BackColor = System.Drawing.Color.White;
        }

        protected void errorWarning ()
        {
            string warning = "All fields are required";
            this.lbl_idwarning.Text = warning;
            this.lbl_idwarning.BackColor = System.Drawing.Color.Red;
            this.lbl_namewarning.Text =warning;
            this.lbl_namewarning.BackColor = System.Drawing.Color.Red;
            this.lbl_genderwarning.Text=warning;
            this.lbl_genderwarning.BackColor = System.Drawing.Color.Red;
            this.lbl_agewarning.Text= "Number is required";
            this.lbl_agewarning.BackColor = System.Drawing.Color.Red;
        }
    }
}