using System;
using System.Collections.Generic;

namespace Baza.Models
{
    public partial class Student
    {
        public Student()
        {
            LabVezbaStudent = new HashSet<LabVezbaStudent>();
            Raspored = new HashSet<Raspored>();
        }

        public int Id { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public int? Indeks { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public bool? Notifikacije { get; set; }

        public virtual ICollection<LabVezbaStudent> LabVezbaStudent { get; set; }
        public virtual ICollection<Raspored> Raspored { get; set; }
    }
}
