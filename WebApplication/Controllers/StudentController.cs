using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Baza.Models;
using Baza.Search;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using WebApplication.Helpers;

namespace WebApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : BaseController
    {
        private readonly BAZAContext db;
        private readonly IOptions<AppSettings> settings;

        public StudentController(BAZAContext db, IOptions<AppSettings> settings)
        {
            this.db = db;
            this.settings = settings;
        }

        [HttpGet]
        public IActionResult Get([FromQuery]StudentSearchModel pretraga)
        {
            var query = db.Student.AsQueryable();
            if (pretraga.labVezbaId != null)
            {
                query = query.Where(s => s.LabVezbaStudent.Any(x => x.LabVezbaId == pretraga.labVezbaId));
            }

            query = query.OrderBy(x => x.Indeks);

            var list = query.Select(studentDB => new Student
            {
                Id = studentDB.Id,
                Ime = studentDB.Ime,
                Indeks = studentDB.Indeks,
                Prezime = studentDB.Prezime,
                Username = studentDB.Username,
                Notifikacije = studentDB.Notifikacije
            }).ToList();

            return Ok(list);
        }

        [HttpPost]
        public IActionResult Post([FromBody] Student s)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(s.Password))
                {
                    string hPass = String.Concat(SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(s.Password)).Select(x => x.ToString("x2")));
                    s.Password = hPass;
                }

                db.Student.Add(s);
                db.SaveChanges();

                return Ok();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost("multiple")]
        public IActionResult PostMultiple([FromBody]Student[] students)
        {
            try
            {
                var indeksi = students.Select(x => x.Indeks);
                var exist = db.Student.Where(x => indeksi.Contains(x.Indeks)).Select(x=>x.Indeks).ToList();
                foreach (var s in students)
                {
                    if (exist.Contains(s.Indeks)) continue;

                    if (!string.IsNullOrWhiteSpace(s.Password))
                    {
                        string hPass = String.Concat(SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(s.Password)).Select(x => x.ToString("x2")));
                        s.Password = hPass;
                    }

                    db.Student.Add(s);
                }
                db.SaveChanges();

                return Ok();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPut]
        public string Put(Student s)
        {
            try
            {
                var studentDB = db.Student.FirstOrDefault(x => x.Id == s.Id);

                studentDB.Ime = s.Ime;
                studentDB.Prezime = s.Prezime;
                studentDB.Indeks = s.Indeks;
                studentDB.Username = s.Username;
                studentDB.Notifikacije = s.Notifikacije;

                if (!string.IsNullOrWhiteSpace(s.Password))
                {
                    string hPass = String.Concat(SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(s.Password)).Select(x => x.ToString("x2")));
                    studentDB.Password = hPass;
                }

                db.SaveChanges();

                return "Updated Successfully!!";
            }
            catch (Exception)
            {

                return "Failed to Update!!";
            }
        }

        [HttpDelete]
        public string Delete(int id)
        {
            try
            {
                var studentDB = db.Student.FirstOrDefault(x => x.Id == id);

                db.Student.Remove(studentDB);

                db.SaveChanges();

                return "Deleted Successfully!!";
            }
            catch (Exception)
            {

                return "Failed to Delete!!";
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetStudent(int id)
        {
            var studentDB = db.Student.FirstOrDefault(x => x.Id == id);
            if (studentDB == null)
            {
                return BadRequest();
            }

            var s = new Student
            {
                Id = studentDB.Id,
                Ime = studentDB.Ime,
                Indeks = studentDB.Indeks,
                Prezime = studentDB.Prezime,
                Notifikacije = studentDB.Notifikacije
            };

            return Ok(s);

        }

        [HttpPut("notification")]
        public IActionResult UpdateNotification([FromForm] int id, [FromForm] bool notification)
        {
            var studentDB = db.Student.FirstOrDefault(x => x.Id == id);
            if (studentDB == null)
            {
                return BadRequest();
            }

            studentDB.Notifikacije = notification;
            db.SaveChanges();

            return Ok();
        }
    }
}
