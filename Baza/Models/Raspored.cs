using System;
using System.Collections.Generic;

namespace Baza.Models
{
    public partial class Raspored
    {
        public int Id { get; set; }
        public int? Student { get; set; }
        public int? LabVezba { get; set; }
        public DateTime? PocetakLaba { get; set; }
        public DateTime? ZavrsetakLaba { get; set; }
        public string Ucionica { get; set; }
        public bool? Izmenjen { get; set; }

        public virtual LabSpecificna LabVezbaNavigation { get; set; }
        public virtual Student StudentNavigation { get; set; }
    }
}
