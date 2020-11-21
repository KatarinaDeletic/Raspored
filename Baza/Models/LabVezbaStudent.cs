using System;
using System.Collections.Generic;

namespace Baza.Models
{
    public partial class LabVezbaStudent
    {
        public int Id { get; set; }
        public int? LabVezbaId { get; set; }
        public int? StudentId { get; set; }

        public virtual LabVezba LabVezba { get; set; }
        public virtual Student Student { get; set; }
    }
}
