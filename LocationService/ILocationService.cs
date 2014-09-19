using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace LocationService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface ILocationService
    {
        [OperationContract]
        [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "/GetLocation")]
        string GetLocation ( Location location);
        //string ReturnAlertInfo ( string ID );
        [OperationContract]
        [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "/Alert")]
        string Alert (Notification notification);
    }

    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class Location
    {
        [DataMember]
        public float Latitude
        {
            get;
            set;
        }
        [DataMember]
        public float Longitude
        {
            get;
            set;
        }
        [DataMember]
        public string Patient_ID
        {
            get;
            set;
        }
    }

    [DataContract]
    public class Notification
    {
        [DataMember]
        public string Patient_ID
        {
            get;
            set;
        }

        [DataMember]
        public string Message
        {
            get;
            set;
        }
    }
    
}
