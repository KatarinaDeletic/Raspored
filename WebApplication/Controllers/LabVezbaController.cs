using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Baza.Models;
using Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LabVezbaController : BaseController
    {
        private readonly BAZAContext db;

        public LabVezbaController(BAZAContext db)
        {
            this.db = db;
        }

        [HttpGet]
        public IActionResult Get(bool? active)
        {
            var query = db.LabVezba.AsQueryable();
            if (active.HasValue)
                query = query.Where(x => x.Active == active.Value);

            var list = query.Select(lab_vezbaDB => new LabVezba
            {
                Id = lab_vezbaDB.Id,
                Tag = lab_vezbaDB.Tag,
                Naziv = lab_vezbaDB.Naziv
            }).ToList();

            return Ok(list);
        }

        [HttpPost]
        public string Post(LabVezba lv)
        {
            try
            {
                db.LabVezba.Add(lv);
                db.SaveChanges();

                return "Added Successfully!!";
            }
            catch (Exception)
            {
                return "Failed to Add!!";
            }
        }

        [HttpPut]
        public string Put(LabVezba lv)
        {
            try
            {
                var lab_vezbaDB = db.LabVezba.FirstOrDefault(x => x.Id == lv.Id);

                lab_vezbaDB.Tag = lv.Tag;
                lab_vezbaDB.Naziv = lv.Naziv;

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
                var lab_vezbaDB = db.LabVezba.FirstOrDefault(x => x.Id == id);

                db.LabVezba.Remove(lab_vezbaDB);

                db.SaveChanges();

                return "Deleted Successfully!!";
            }
            catch (Exception)
            {
                return "Failed to Delete!!";
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetLabVezba(int id)
        {
            var lab_vezbaDB = db.LabVezba.FirstOrDefault(x => x.Id == id);
            if (lab_vezbaDB == null) return BadRequest();

            var s = new LabVezba
            {
                Id = lab_vezbaDB.Id,
                Tag = lab_vezbaDB.Tag,
                Naziv = lab_vezbaDB.Naziv
            };

            return Ok(s);
        }

        [HttpPost("dodaj-studenta")]
        public IActionResult AddStudent(AddStudentModel addStudentModel)
        {
            var veza = db.LabVezbaStudent.FirstOrDefault(x => x.LabVezbaId == addStudentModel.LabId && x.StudentId == addStudentModel.StudentId);

            if (veza != null) return BadRequest();

            veza = new LabVezbaStudent
            {
                LabVezbaId = addStudentModel.LabId,
                StudentId = addStudentModel.StudentId
            };

            db.LabVezbaStudent.Add(veza);
            db.SaveChanges();

            return Ok();
        }
    }
}
