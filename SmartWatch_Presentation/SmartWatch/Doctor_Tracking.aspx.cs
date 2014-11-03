using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace SmartWatch
{
    public partial class Doctor_Tracking : System.Web.UI.Page
    {
        protected void Page_Load ( object sender, EventArgs e )
        {
            BusinessTier.CareTakerOperation doctor = new BusinessTier.CareTakerOperation();
            string id = ( string )(Session["RoleID"]);
            this.lbl_docID.Text = id;

            this.gv_location.DataSource = doctor.SelectCurrentLocations();
            this.gv_location.DataBind();

            /*
            Timers time = new Timers();
            time.start();
             * */
        }

        protected void btn_getlo_Click1(object sender, EventArgs e)
        {

        }
    }
}