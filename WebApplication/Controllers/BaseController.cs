using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaseController : ControllerBase
    {
        public bool IsStudent
        {
            get => User.Claims.Any(x => x.Type == "StudentId");
        }

        public int StudentId
        {
            get
            {
                return Convert.ToInt32(User.Claims.FirstOrDefault(x => x.Type == "StudentId")?.Value);
            }
        }

        public int ProfesorId
        {
            get
            {
                return Convert.ToInt32(User.Claims.FirstOrDefault(x => x.Type == "ProfesorId")?.Value);
            }
        }
    }
}
