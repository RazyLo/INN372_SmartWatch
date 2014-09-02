using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWatch
{
    public partial class Home_Caretaker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = (string)(Session["RoleID"]);
            this.lbl_careid.Text = id;
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Server.Transfer("Login.aspx");
        }

        //protected void btn_myassign_Click(object sender, EventArgs e)
        //{
        //    string roleID = this.lbl_careid.Text.ToString().ToUpper();
        //    Data.DataBase.SelectAllAssignmentDetailsDataTable table = new Data.DataBase.SelectAllAssignmentDetailsDataTable();
        //    BusinessTier.CareTakerOperation caretaker = new BusinessTier.CareTakerOperation();
        //    table = caretaker.SelectAssignmentDetailsByRole(roleID);
        //    this.gv_myassign.DataSource = table;
        //    this.gv_myassign.DataBind();
        //}

        //protected void btn_mypatients_Click(object sender, EventArgs e)
        //{
        //    string pid = this.txtbox_seach.Text.Trim().ToString().ToUpper();
        //    Data.DataBase.patientsDataTable table = new Data.DataBase.patientsDataTable();
        //    BusinessTier.CareTakerOperation caretaker = new BusinessTier.CareTakerOperation();
        //    if (pid != null)
        //    {
        //        if (pid.Length > 0)
        //        {
        //            table = caretaker.SearchPatientByID(pid);
        //            if (table.Rows.Count > 0)
        //            {
        //                this.gv_mypatient.DataSource = table;
        //                this.gv_mypatient.DataBind();
        //            }
        //            else
        //            {
        //                this.lbl_search.Text = "No such patient, please check patient id";
        //                this.lbl_search.BackColor = System.Drawing.Color.Red;
        //            }
        //        }
        //        else
        //        {
        //            table = caretaker.SelectMyPatientViaID("C0001");
        //            this.gv_mypatient.DataSource = table;
        //            this.gv_mypatient.DataBind();
        //        }
        //    }
        //}
    }
}