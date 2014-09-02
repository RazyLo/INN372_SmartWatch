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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}