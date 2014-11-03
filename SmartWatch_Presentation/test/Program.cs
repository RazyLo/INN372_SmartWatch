using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Net;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Collections.Specialized;
using System.Threading;


namespace test
{
    class Program
    {
        static void Main ( string[] args )
        {

            BusinessTier.CareTakerOperation carer = new BusinessTier.CareTakerOperation();
            BusinessTier.SendNotification sender = new BusinessTier.SendNotification();
            start();
            //Console.WriteLine(carer.InsertFence("2" ,"24.55555", "154.5555", "104"));
            //Console.WriteLine(sender.SendFenceDataToAndroid());
           
            //Console.WriteLine(sender.GetStatus());
            //Console.WriteLine(now.ToString());
            //BusinessTier.CareTakerOperation carer = new BusinessTier.CareTakerOperation();
            //Console.WriteLine(sender.GetStatus());
            //BusinessTier.SendNotification sender = new BusinessTier.SendNotification();
            //Console.WriteLine(SendNotificationToUser());
            //Console.WriteLine(sender.SendNotificationToCarer("P0003", "Clement,Here is the test!"));

            //start();
            Console.ReadKey();
             
        }


        public static string SendNotificationToUser ()
        {
            var Google_App_ID = "AIzaSyAZOnC96yzFJEdC2b8nmvllN9MzUgqTj7I";
            //Jessica 's Key
            //string Register_ID = "APA91bEQHpL80ki4kUj21gLkU6ehD9WmGAYVgJBRMDHUc_1C2CgUFYQGbw20rJgVOj-YJdo9s1RlpuSGzpqgryTbkrUVork0FNP2Djv7hFj67TIsI8arFIodbi9TX3ryICIJ2lis-ED46jDRmQR9wBWsbXqCCnKxgw";
            
            // Clement' s Key
            //string Register_ID = "APA91bHFaDZuWZGawlOkxiUkeuFttyRa-WU2bhVOZgyQaMC2gwSIBLE2rHXzIdFSRMraQ6WUKh_NPcl9KmY90ZQs7sywQUdaQKbgHv0e5EqUupIFic0sZBfgvMOZHLm6NZ4DNHq11waFhe2Hc5RrBKzf_wteIlJb9g";
           
            // Mingzu's Key
            
            string Register_ID = "APA91bGadsOnWF9e61xhAtSacxTwV2x3my2ibcSBDnYS08Ta98Q863wm2LPojPwmgkhOdS9k2DcNQ_TZDgSfv0yPaK6MweLNmS_hAB4fDimX8WXePRKMBpslbyRM-e0ugvnKvzuYLOaqSyjDRYRSy-FnashrMPAlug";

            var Sender_ID = "544968562871";
            var message = "Patient: " + " P0002 " + " ; Message: " + " Panic";
            
            String Response_From_Server;
            try
            {
                WebRequest requests = WebRequest.Create("https://android.googleapis.com/gcm/send");
                requests.Method = "post";
                requests.ContentType = "application/x-www-form-urlencoded;charset=UTF-8";
                requests.Headers.Add(string.Format("Authorization: key={0}", Google_App_ID));
                requests.Headers.Add(string.Format("Sender: id={0}", Sender_ID));

                string postData = "collapse_key=score_update&time_to_live=108&delay_while_idle=1&data.message=" + message + "&data.time=" + 
                                System.DateTime.Now.ToString() + "&registration_id=" + Register_ID + "";

                Byte[] byteArray = Encoding.UTF8.GetBytes(postData);
                requests.ContentLength = byteArray.Length;

                Stream dataStream = requests.GetRequestStream();
                dataStream.Write(byteArray, 0, byteArray.Length);

                dataStream.Close();

                WebResponse responses = requests.GetResponse();

                dataStream = responses.GetResponseStream();

                StreamReader readers = new StreamReader(dataStream);

                Response_From_Server = readers.ReadToEnd();
                readers.Close();
                dataStream.Close();
                responses.Close();
                return Response_From_Server;
            }
            catch ( Exception e )
            {
                Console.WriteLine(e.Message + "here");
                return e.Message;
            }
        }//end SendNotificationToUser

        static bool isTaken = false;
        static public void Tick ( Object stateInfo )
        {
            //Console.WriteLine("Tick: {0}", DateTime.Now.ToString("h:mm:ss"));
            
                if ( isTaken == false )
                {
                    //BusinessTier.SendNotification sender = new BusinessTier.SendNotification();
                    //sender.SendNotificationToCarer(" ", " Did you take your medecine ?");
                    //isTaken = true;
                    Console.WriteLine("Tick: {0}", DateTime.Now.ToString("h:mm:ss"));
                }
            
        }

        static public void start ()
        {
            TimerCallback callback = new TimerCallback(Tick);
            /*
            Console.WriteLine("Creating timer: {0}\n",
                               DateTime.Now.ToString("h:mm:ss"));
            */
            // create a one second timer tick
            Timer stateTimer = new Timer(callback, null, 0, 1000);

            // loop here forever
            
        }
    }
}
