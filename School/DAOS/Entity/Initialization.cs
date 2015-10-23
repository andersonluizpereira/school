using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAOS.Entity
{
    public static class Initialization
    {
        private static readonly object locker = new object();
        private volatile static bool initialized = false;

        public static void Setup()
        {
            if (!initialized)
            {
                lock (locker)
                {
                    if (!initialized)
                    {
                        initialized = true;
                        MongoDbHelper.Register("CachedDb");
                        MongoDbEntityMap.Init();
                    }
                }
            }
        }
    }
}
