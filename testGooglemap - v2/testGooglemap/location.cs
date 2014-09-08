using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace testGooglemap
{
    public class location
    {
        private decimal Latitude;
        private decimal Logitude;

        public location ()
        {
            
        
        }

        public DataTable GetPatient_Location ()
        {
            DataTable location = new DataTable("location");
            location.Columns.Add(new DataColumn("PatientID", typeof(string)));
            location.Columns.Add(new DataColumn("Latitude",typeof(decimal)));
            location.Columns.Add(new DataColumn("Logitude",typeof(decimal)));

            location.Rows.Add("Patient_1", -27.4780, 153.0285);
            location.Rows.Add("Patient_2", -27.4580, 153.0280);
            location.Rows.Add("Patient_3", -27.4480, 153.0180);
            location.Rows.Add("Patient_4", -27.4380, 153.0390);
            location.Rows.Add("Patient_5", -27.4280, 153.0280);
            location.Rows.Add("Patient_6", -27.4180, 153.0180);
            location.Rows.Add("Patient_7", -27.4680, 153.0490);
            location.Rows.Add("Patient_8", -27.4580, 153.0480);
            location.Rows.Add("Patient_9", -27.4480, 153.0480);

            return location;
        }



    }
}