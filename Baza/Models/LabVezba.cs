using System;
using System.Collections.Generic;

namespace Baza.Models
{
    public partial class LabVezba
    {
        public LabVezba()
        {
            LabSpecificna = new HashSet<LabSpecificna>();
            LabVezbaStudent = new HashSet<LabVezbaStudent>();
        }

        public int Id { get; set; }
        public string Tag { get; set; }
        public string Naziv { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<LabSpecificna> LabSpecificna { get; set; }
        public virtual ICollection<LabVezbaStudent> LabVezbaStudent { get; set; }
    }
}
