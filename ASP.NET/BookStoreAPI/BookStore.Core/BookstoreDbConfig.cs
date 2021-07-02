using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookStore.Core
{
    public class BookstoreDbConfig
    {
        public string Database_Name { get; set; }
        public string Books_Collection_Name { get; set; }
        public string Connection_String { get; set; }
    }
}
