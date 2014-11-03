using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;

namespace SmartWatch
{
    public class Timers
    {
        bool isTaken = false;
        public void GetSystemTime ()
        {
            string time = DateTime.Now.ToShortTimeString();
            
        }

        public void start ()
        {
            
            TimerCallback callback = new TimerCallback(Tick);
            Timer stateTimer = new Timer(callback, null, 0, 3000);

        }

        
        public void Tick ( Object stateInfo )
        {
            
                if ( isTaken == false )
                {
                    BusinessTier.SendNotification sender = new BusinessTier.SendNotification();
                    sender.SendNotificationToUser(" ", DateTime.Now.ToShortDateString() +  " Did you take your medecine ? ");
                    isTaken = true;
                }
            
        }
         

    }
}