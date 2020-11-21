using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Baza;
using Baza.Models;
using Domain;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using WebApplication.Helpers;
using System.Security.Cryptography;

namespace WebApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : BaseController
    {
        private readonly BAZAContext db;
        private readonly IOptions<AppSettings> settings;

        public AccountController(BAZAContext db, IOptions<AppSettings> settings)
        {
            this.db = db;
            this.settings = settings;
        }

        [HttpPost("Login")]
        public IActionResult Login([FromBody] LoginModel obj)
        {
            IAccount user;
            if (obj.Username.Contains("ni.ac.rs"))
            {
                user = db.Profesor.FirstOrDefault(x => x.Username == obj.Username);
            }
            else
            {
                user = db.Student.FirstOrDefault(x => x.Username == obj.Username);
            }

            if (user == null) return BadRequest("User not found");

            string hPass = String.Concat(SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(obj.Password)).Select(x => x.ToString("x2")));

            if (user.Username == obj.Username && user.Password == hPass)
            {
                var tokenHandler = new JwtSecurityTokenHandler();
                var key = Encoding.ASCII.GetBytes(settings.Value.Secret);
                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(new Claim[]
                    {
                        new Claim("Username", user.Username),
                        new Claim(user.GetType() == typeof(Student)?"StudentId":"ProfesorId", user.Id.ToString())
                    }),
                    Expires = DateTime.UtcNow.AddDays(7),
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
                };
                var token = tokenHandler.WriteToken(tokenHandler.CreateToken(tokenDescriptor));

                return Ok(new { 
                    token, 
                    account= new
                    {
                        user.Ime,
                        user.Prezime,
                        type = user.GetType() == typeof(Student) ? 2 : 1,
                        id = user.Id
                    }
                }); // auth succeed 
            }

            return BadRequest();
        }

        [HttpGet("who-am-i")]
        [Authorize]
        public IActionResult WhoAmI()
        {
            IAccount user;
            if (!this.IsStudent)
            {
                user = db.Profesor.First(x => x.Id == this.ProfesorId );
            }
            else
            {
                user = db.Student.First(x => x.Id == this.StudentId);
            }

            return Ok(new
            {
                user.Ime,
                user.Prezime,
                type = this.IsStudent ? 2 : 1,
                id = user.Id
            });
        }
    }
}
