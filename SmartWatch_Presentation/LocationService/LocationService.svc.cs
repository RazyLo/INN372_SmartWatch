using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace LocationService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class LocationService : ILocationService
    {
        BusinessTier.CareTakerOperation carer = new BusinessTier.CareTakerOperation();
        BusinessTier.SendNotification sender = new BusinessTier.SendNotification();
        public string GetLocation ( Location location )
        {
            carer.InsertLocationRecord(location.Patient_ID, location.Latitude, location.Longitude);
            return "Success...Please Wait";
        }
        /*
        public string ReturnAlertInfo ( string ID )
        {
            return "Patient " + ID + " is out of fence.......!";
        }
         * */
        // This method is used to send notification to caretaker
        public string Alert ( Notification notice)
        {
            if ( carer.InsertNotification(notice.Patient_ID, notice.Message) == true )
            {
                sender.SendNotificationToCarer(notice.Patient_ID, notice.Message);
                
                return "Alert Success...Please Wait";
                //return "-27.478211,153.0288,100";
            }
            else
            {
                return "Failed...Please Contact Admin";
                //return "-27.478211,153.0288,100";
            }
        }

        //This 
        public string GetFence ()
        {
            return sender.SendFenceDataToAndroid();
        }

        public string CheckType ()
        {

            return sender.GetStatus();
        }


    }
}
