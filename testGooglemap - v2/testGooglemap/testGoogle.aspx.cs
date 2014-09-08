using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace testGooglemap
{
    public partial class testGoogle : System.Web.UI.Page
    {
        protected void Page_Load ( object sender, EventArgs e )
        {
            
            location locations = new location();

            this.gv_location.DataSource = locations.GetPatient_Location();
            this.gv_location.DataBind();
        }

        protected void btn_getlo_Click ( object sender, EventArgs e )
        {

        }

        protected void btn_getlo_Click1 ( object sender, EventArgs e )
        {

        }
        /*
        protected string ConvertDataTabletoString ()
        {
            location locations = new location();
            DataTable dt = locations.GetPatient_Location();
            System.Web.Script.Serialization.JavaScriptSerializer serializer = 
                new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach ( DataColumn col in dt.Columns )
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }
         * */
    }
}