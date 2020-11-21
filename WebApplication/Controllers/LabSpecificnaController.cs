using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Baza.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LabSpecificnaController : BaseController
    {
        private readonly BAZAContext db;

        public LabSpecificnaController(BAZAContext db)
        {
            this.db = db;
        }

        public class LabSpecificnaPretraga
        {
            public int labVezbaId { get; set; }
        }

        [HttpGet]
        public IActionResult Get([FromQuery]LabSpecificnaPretraga pretraga)
        {
            var list = db.LabSpecificna.Where(x=>x.IdLabVezbe == pretraga.labVezbaId).Select(lab_specificnaDB => new LabSpecificna
            {
                Id = lab_specificnaDB.Id,
                VremeOd = Convert.ToDateTime(lab_specificnaDB.VremeOd),
                VremeDo = Convert.ToDateTime(lab_specificnaDB.VremeDo),
                Redosled = lab_specificnaDB.Redosled,
                IdLabVezbe = lab_specificnaDB.IdLabVezbe

            }).ToList();

            return Ok(list);
        }

        [HttpPost]
        public string Post(LabSpecificna lv)
        {
            try
            {
                db.LabSpecificna.Add(lv);
                db.SaveChanges();

                return "Added Successfully!!";
            }
            catch (Exception)
            {
                return "Failed to Add!!";
            }
        }

        [HttpPut]
        public string Put(LabSpecificna lv)
        {
            try
            {
                var lab_specificnaDB = db.LabSpecificna.FirstOrDefault(x => x.Id == lv.Id);

                lab_specificnaDB.VremeOd = lv.VremeOd;
                lab_specificnaDB.VremeDo = lv.VremeDo;
                lab_specificnaDB.Redosled = lv.Redosled;
                lab_specificnaDB.IdLabVezbe = lv.IdLabVezbe;

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
                var lab_specificnaDB = db.LabSpecificna.FirstOrDefault(x => x.Id == id);

                db.LabSpecificna.Remove(lab_specificnaDB);

                db.SaveChanges();

                return "Deleted Successfully!!";
            }
            catch (Exception)
            {

                return "Failed to Delete!!";
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetLabS(int id)
        {
            var lab_specificnaDB = db.LabSpecificna.FirstOrDefault(x => x.Id == id);
            if (lab_specificnaDB == null) return BadRequest();

            var s = new LabSpecificna
            {
                Id = lab_specificnaDB.Id,
                VremeOd = Convert.ToDateTime(lab_specificnaDB.VremeOd),
                VremeDo = Convert.ToDateTime(lab_specificnaDB.VremeDo),
                Redosled = lab_specificnaDB.Redosled,
                IdLabVezbe = lab_specificnaDB.IdLabVezbe
            };

            return Ok(s);
        }
    }
}
