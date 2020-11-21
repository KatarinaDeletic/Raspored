using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class LabVezbaSpecificna
    {
        public int Id { get; set; }
        public DateTime? VremeOd { get; set; }
        public DateTime? VremeDo { get; set; }
        public int? Redosled { get; set; }
        public int? IdLabVezbe { get; set; }
    }
}
