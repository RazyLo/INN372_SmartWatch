using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace SmartWatch
{
    public partial class Home_Admin_Caretakers : System.Web.UI.Page
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
            //defaultStatus();
            string input = this.txtbox_search.Text.ToString();
            BusinessTier.Admin admin = new BusinessTier.Admin();
            Data.DataBase.caretakersDataTable table = new Data.DataBase.caretakersDataTable();
            if ( input.Length > 0 )
            {
                table = admin.SearchCareTakerByID(input);
                if ( table.Rows.Count > 0 )
                {
                    this.gv_caretakerview.DataSource = table;
                    this.gv_caretakerview.DataBind();
                }
                else
                {
                    this.lbl_searchwarning.Text = "Invalid ID, Please confirm the IDs before search...";
                    this.lbl_searchwarning.BackColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                table = admin.SelectAllCareTakers();
                this.gv_caretakerview.DataSource = table;
                this.gv_caretakerview.DataBind();
            }
        }

        protected void gv_caretakerview_RowDeleting ( object sender, GridViewDeleteEventArgs e )
        {
            BusinessTier.Admin admin = new BusinessTier.Admin();
            string care_ID = this.gv_caretakerview.Rows[e.RowIndex].Cells[2].Text;
            admin.DeleteCareTaker(care_ID);
        }

        protected void gv_caretakerview_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int index = e.NewSelectedIndex;
            string cid = this.gv_caretakerview.Rows[index].Cells[2].Text;
            string name = this.gv_caretakerview.Rows[index].Cells[3].Text;
            string gender = this.gv_caretakerview.Rows[index].Cells[4].Text;
            string contact_no = this.gv_caretakerview.Rows[index].Cells[5].Text;
            string age = this.gv_caretakerview.Rows[index].Cells[6].Text;

            this.txtbox_careID.Text = cid;
            this.txtbox_name.Text = name;
            this.txtbox_gender.Text = gender;
            this.txtbox_contactno.Text = contact_no;
            this.txtbox_age.Text = age;
        }

        protected void btn_addcare_Click ( object sender, EventArgs e )
        {
            //defaultStatus();
            string cid = this.txtbox_careID.Text;
            string name = txtbox_name.Text;
            string gender = txtbox_gender.Text;
            string contactno = txtbox_contactno.Text;
            int age = int.Parse(this.txtbox_age.Text);

            if ( cid.Length > 0 && name.Length > 0 && gender.Length > 0 && contactno.Length > 0 && age.ToString().Length > 0 )
            {
                BusinessTier.Admin admin = new BusinessTier.Admin();
                Data.DataBase.caretakersDataTable table = new Data.DataBase.caretakersDataTable();
                table = admin.SearchCareTakerByID(cid);
                if ( table.Rows.Count > 0 )
                {
                    this.lbl_idwarning.Text = "This ID is already exsit";
                    this.lbl_idwarning.BackColor = System.Drawing.Color.Red;
                }
                else
                {
                    admin.AddCareTaker(cid, name, gender, contactno, age);
                    this.gv_caretakerview.DataSource = admin.SelectAllCareTakers();
                    this.gv_caretakerview.DataBind();
                }
            }
            else
            {
                errorWarning();
            }
        }

        protected void btn_update_Click ( object sender, EventArgs e )
        {
            //defaultStatus();
            string cid = this.txtbox_careID.Text;
            string name = txtbox_name.Text;
            string gender = txtbox_gender.Text;
            string contactno = txtbox_contactno.Text;
            int age = int.Parse(this.txtbox_age.Text);

            if ( cid.Length > 0 && name.Length > 0 && gender.Length > 0 && contactno.Length > 0 && age.ToString().Length > 0 )
            {
                BusinessTier.Admin admin = new BusinessTier.Admin();
                Data.DataBase.caretakersDataTable table = new Data.DataBase.caretakersDataTable();
                table = admin.SearchCareTakerByID(cid);
                if ( table.Rows.Count > 0 )
                {
                    admin.UpdateCareTaker(name, gender, contactno, age, cid);
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

        public void errorWarning ()
        {
            string warning = "All fields are required";
            this.lbl_idwarning.Text = warning;
            this.lbl_idwarning.BackColor = System.Drawing.Color.Red;
            this.lbl_namewarning.Text =warning;
            this.lbl_namewarning.BackColor = System.Drawing.Color.Red;
            this.lbl_genderwarning.Text=warning;
            this.lbl_genderwarning.BackColor = System.Drawing.Color.Red;
            this.lbl_contactwarning.Text=warning;
            this.lbl_contactwarning.BackColor = System.Drawing.Color.Red;
            this.lbl_agewarning.Text="Number is required";
            this.lbl_agewarning.BackColor = System.Drawing.Color.Red;
        }

        public void defaultStatus ()
        {
            this.lbl_idwarning.Text = "";
            this.lbl_idwarning.BackColor = System.Drawing.Color.White;
            this.lbl_namewarning.Text ="";
            this.lbl_namewarning.BackColor = System.Drawing.Color.White;
            this.lbl_searchwarning.Text ="";
            this.lbl_searchwarning.BackColor = System.Drawing.Color.White;
            this.lbl_genderwarning.Text="";
            this.lbl_genderwarning.BackColor = System.Drawing.Color.White;
            this.lbl_contactwarning.Text="";
            this.lbl_contactwarning.BackColor = System.Drawing.Color.White;
            this.lbl_agewarning.Text="";
            this.lbl_agewarning.BackColor = System.Drawing.Color.White;
        }

    }
}