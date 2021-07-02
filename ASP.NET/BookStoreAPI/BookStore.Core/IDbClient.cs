using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookStore.Core
{
    public interface IDbClient
    {
        IMongoCollection<Book> GetBooksCollection();
    }
}
