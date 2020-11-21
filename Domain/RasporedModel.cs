using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class RasporedModel
    {
        public int Id { get; set; }
        public StudentModel Student { get; set; }
        public LabVezbaSpecificna LabVezbaSpecificna { get; set; }
        public DateTime PocetakLaba { get; set; }
        public DateTime? ZavrsetakLaba { get; set; }
        public string Ucionica { get; set; }
        public bool Izmenjen { get; set; }
        public string? NazivLabVezbe { get; set; }
    }
}
