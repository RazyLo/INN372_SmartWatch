using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Threading;

namespace SmartWatch
{
    public partial class Caretaker_Tracking : System.Web.UI.Page
    {
        protected void Page_Load ( object sender, EventArgs e )
        {
            if ( !Page.IsPostBack )
            {
                BusinessTier.CareTakerOperation carer = new BusinessTier.CareTakerOperation();
                string id = ( string )(Session["RoleID"]);
                this.lbl_careid.Text = id;

                this.gv_location.DataSource = carer.SelectCurrentLocations();
                this.gv_location.DataBind();
                /*
                this.gv_fence_details.DataSource = carer.GetFence();
                this.gv_fence_details.DataBind();
                */
                /*
                Timers time = new Timers();
                time.start();
                 * */
            }
        }

        protected void btn_getlo_Click1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click ( object sender, EventArgs e )
        {
            string pid = Request["input_name"].Trim().ToString().ToUpper();
            BusinessTier.CareTakerOperation carer = new BusinessTier.CareTakerOperation();
            this.gv_location.DataSource = carer.GetAllLocationRecordsByID(pid);
            this.gv_location.DataBind();

           
        }

        protected void ScriptManager1_AsyncPostBackError ( object sender, AsyncPostBackErrorEventArgs e )
        {
            ScriptManager1.AsyncPostBackErrorMessage = e.Exception.Message;
        }

        protected void btn_Update_Click ( object sender, EventArgs e )
        {
            RefreshFence();
        }

        protected void RefreshFence ()
        {
            BusinessTier.CareTakerOperation carer = new BusinessTier.CareTakerOperation();
            BusinessTier.SendNotification noti_sender = new BusinessTier.SendNotification();
            string lati1 = Request["lbl_circle1_lat_name"].ToString();
            string lati2 = Request["lbl_circle2_lat_name"].ToString();

            DataTable table = new DataTable();
            table.Columns.Add("FenceNo");
            table.Columns.Add("Latitude");
            table.Columns.Add("Longitude");
            table.Columns.Add("Radius");
            table.Rows.Add("1", "-27.477806", "153.02073", "100");

            string longi1 = Request["lbl_circle1_log_name"].ToString();
            string radius1 = Request["lbl_circle1_radius_name"].ToString();
            table.Rows.Add("2", lati1, longi1, radius1);
            carer.InsertFence("2", lati1, longi1, radius1);

            string longi2 = Request["lbl_circle2_log_name"].ToString();
            string radius2 = Request["lbl_circle2_radius_name"].ToString();
            table.Rows.Add("3", lati2, longi2, radius2);
            carer.InsertFence("3", lati2, longi2, radius2);

            //noti_sender.SendFenceDataToAndroid();
            noti_sender.SendFenceChangingNotification();
            this.gv_fence_details.DataSource = table;
            this.gv_fence_details.DataBind();
        }

        protected void btn_tracking_Click ( object sender, EventArgs e )
        {

        }
        /*
        protected Data.DataBase.fencesDataTable GetAllFence ()
        {
            BusinessTier.CareTakerOperation carer = new BusinessTier.CareTakerOperation();
            return carer.GetFence();
        }
         * */
    }
}