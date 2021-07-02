using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookStore.Core
{
    public interface IBookServices
    {
        List<Book> GetBooks();
        Book AddBook(Book book);
        Book GetBook(string Id);
        void DeleteBook(string Id);
        Book UpdateBook(Book book);
    }
}
