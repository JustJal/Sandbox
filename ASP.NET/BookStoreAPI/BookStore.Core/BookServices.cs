using MongoDB.Driver;
using System;
using System.Collections.Generic;

namespace BookStore.Core
{
    public class BookServices : IBookServices
    {
        private readonly IMongoCollection<Book> _books;
        public BookServices(IDbClient dbClient)
        {
            _books = dbClient.GetBooksCollection();
        }

        public Book AddBook(Book book)
        {
            _books.InsertOne(book);
            return book;
        }

        public void DeleteBook(string Id)
        {
            _books.DeleteOne(book => book.Id.Equals(Id));
        }

        public Book GetBook(string Id) => _books.Find(book => book.Id == Id).First();

        public List<Book> GetBooks() => _books.Find(book => true).ToList();

        public Book UpdateBook(Book book)
        {
            GetBook(book.Id);
            _books.ReplaceOne(b => b.Id == book.Id, book);
            return book;
        }
    }
}
