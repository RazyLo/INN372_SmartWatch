using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWatch
{
    public partial class Home_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string roleID = (string)(Session["RoleID"]);
            this.roleID_lbl.Text = roleID;
        }
        /*
        protected void Button11_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Server.Transfer("Login.aspx");
        }

        protected void search_btn_Click1 ( object sender, EventArgs e )
        {
            Data.DataBase.assignmentsDataTable table = new Data.DataBase.assignmentsDataTable();
            BusinessTier.Admin admin = new BusinessTier.Admin();

            string input = this.textbox_assgin.Text.ToString();
            if ( input.Length > 0 )
            {
                int assign_id = int.Parse(input);
                table = admin.SelectAssignmentByID(assign_id);
            }
            else
            {
                table = admin.SelectAllAssignments();
            }
            this.gv_assignments.DataSource = table;
            this.gv_assignments.DataBind();
        }

        protected void btn_add_Click ( object sender, EventArgs e )
        {
            string pid = this.txtbox_pid.Text.Trim().ToString().ToUpper();
            string did = this.txtbox_did.Text.Trim().ToString().ToUpper();
            string cid = this.txtbox_cid.Text.Trim().ToString().ToUpper();
            bool hasThePatient;
            bool hasTheDoctor;
            bool hasTheCare;

            if ( pid.Length > 0 && did.Length > 0 && cid.Length > 0 )
            {
                BusinessTier.Admin admin = new BusinessTier.Admin();
                hasThePatient = admin.CheckPatientBeforeAssign(pid);
                hasTheDoctor = admin.isMember(did);
                hasTheCare = admin.isMember(cid);
                
                if ( hasThePatient == true )
                {
                    this.lbl_pidwarning.Text = "Duplicate patient ID";
                }
                if ( hasThePatient == false )
                {
                    if ( hasTheCare == true && hasTheDoctor == true )
                    {
                        admin.AddAssignment(pid, did, cid);
                        this.gv_assignments.DataSource = admin.SelectAllAssignments();
                        this.gv_assignments.DataBind();
                    }
                    else
                    {
                        this.lbl_didwarning.Text="Check this ID before assgin";
                        this.lbl_cidwarning.Text="Check this ID before assign";
                    }
                }
            }

        }

        protected void gv_assignments_SelectedIndexChanging ( object sender, GridViewSelectEventArgs e )
        {
            int index = e.NewSelectedIndex;
            string pid = this.gv_assignments.Rows[index].Cells[3].Text;
            string did = this.gv_assignments.Rows[index].Cells[4].Text;
            string cid = this.gv_assignments.Rows[index].Cells[5].Text;

            this.txtbox_pid.Text = pid;
            this.txtbox_did.Text = did;
            this.txtbox_cid.Text = cid;
        }

        protected void btn_update_Click ( object sender, EventArgs e )
        {
            string pid = this.txtbox_pid.Text.Trim().ToString().ToUpper();
            string did = this.txtbox_did.Text.Trim().ToString().ToUpper();
            string cid = this.txtbox_cid.Text.Trim().ToString().ToUpper();
            BusinessTier.Admin admin = new BusinessTier.Admin();

            if ( pid.Length > 0 && did.Length > 0 && cid.Length > 0 )
            {
                if ( admin.CheckPatientBeforeAssign(pid) == true )
                {
                    if ( admin.isMember(did) == true && admin.isMember(cid) == true )
                    {
                        admin.updateAssignment(pid, did, cid);
                    }
                    else
                    {
                        this.lbl_didwarning.Text = "Check if this ID is exsited";
                        this.lbl_cidwarning.Text = "Check if this ID is exsited";
                    }
                }
                else
                {
                    this.lbl_pidwarning.Text = "No such patient ID";
                }
            }

        }

        protected void gv_assignments_RowDeleting ( object sender, GridViewDeleteEventArgs e )
        {
            defaultStatus();
            BusinessTier.Admin admin = new BusinessTier.Admin();
            
            int assign_id = int.Parse(this.gv_assignments.Rows[e.RowIndex].Cells[2].Text);
            string pid = this.gv_assignments.Rows[e.RowIndex].Cells[3].Text;
            if ( admin.SearchPatientByID(pid).Rows.Count > 0 )
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "deleteError()", true);
            }
            else
            {
                admin.DeleteAssignmentByID(assign_id);
            }
        }

        protected void defaultStatus ()
        {
            this.lbl_cidwarning.Text = "";
            this.lbl_didwarning.Text = "";
            this.lbl_pidwarning.Text = "";
        }
        */

    }
}