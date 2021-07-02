using BookStore.Core;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BooksController : ControllerBase
    {
        private readonly IBookServices bookServices;
        public BooksController(IBookServices BookServices)
        {
            bookServices = BookServices;
        }
        [HttpGet]
        public IActionResult GetBooks()
        {
            return Ok(bookServices.GetBooks());
        }
        [HttpPost]
        public IActionResult AddBook(Book book)
        {
            bookServices.AddBook(book);
            return CreatedAtRoute("GetBook", new Book { Id = book.Id }, book);
        }
        [HttpGet ("{id}",Name ="GetBook")]
        public IActionResult GetBook(string id)
        {
            return Ok(bookServices.GetBook(id));
        }
        [HttpDelete("{id}")]
        public IActionResult DeleteBook(string id)
        {
            bookServices.DeleteBook(id);
            return NoContent();
        }
        [HttpPut]
        public IActionResult UpdateBook(Book book)
        {
            return Ok(bookServices.UpdateBook(book));
        }
    }
}
