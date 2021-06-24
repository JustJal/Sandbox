using BasicCRUD.Shared.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BasicCRUD.Server.Controllers
{
    [ApiController]
    [Route("{controller}")]
    public class PersonasController : ControllerBase
    {
        private readonly ApplicationDbContext context;

        public PersonasController(ApplicationDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Persona>>> Get()
        {
            return await context.Personas.ToListAsync();
        }

        [HttpGet("{Id}", Name = "obtenerPersona") ]
        public async Task<ActionResult<Persona>> Get(int Id)
        {
            return await context.Personas.FirstOrDefaultAsync(x => x.ID.Equals(Id));
        }
        [HttpPost]
        public async Task<ActionResult> Post(Persona persona)
        {
            context.Add(persona);
            await context.SaveChangesAsync();
            return new CreatedAtRouteResult("obtenerPersona", new{ Id = persona.ID}, persona);
        }
        [HttpPut]
        public async Task<ActionResult> Put(Persona persona)
        {
            context.Entry(persona).State = EntityState.Modified;
            await context.SaveChangesAsync();
            return NoContent();
        }
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            Persona persona = new() { ID = id };
            context.Remove(persona);
            await context.SaveChangesAsync();
            return NoContent();
        }
    }
}
