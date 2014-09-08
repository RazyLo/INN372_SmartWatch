using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartWatch
{
    public partial class Caretaker_Tracking : System.Web.UI.Page
    {
        protected void Page_Load ( object sender, EventArgs e )
        {
            string id = ( string )(Session["RoleID"]);
            this.lbl_careid.Text = id;

            location locations = new location();

            this.gv_location.DataSource = locations.GetPatient_Location();
            this.gv_location.DataBind();
        }

        protected void btn_getlo_Click1(object sender, EventArgs e)
        {

        }
    }
}