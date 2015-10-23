using DAOS.Models;
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAOS.Entity
{
    internal static class MongoDbEntityMap
    {
        public static void Init()
        {
            // set global IdGenerator
            //BsonSerializer.RegisterIdGenerator(typeof(Guid), CombGuidGenerator.Instance);

            BsonClassMap.RegisterClassMap<Teacher>(x =>
            {
                x.AutoMap();
                x.SetIdMember(x.GetMemberMap(m => m.TeacherID));
                x.IdMemberMap.SetRepresentation(BsonType.ObjectId);
                x.GetMemberMap(m => m.TeacherID).SetIgnoreIfNull(true);
            });

            // set other type ...

        }
    }
}
