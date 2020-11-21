using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class RasporedFromCsv
    {
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Email { get; set; }
        public int? Indeks { get; set; }
        public string Tag { get; set; }
        public string NazivLabVezbe { get; set; }
        public int LabVezba { get; set; }
        public DateTime Pocetak { get; set; }    //vremeOd?
        public DateTime Kraj { get; set; }   //vremeDo?
        public string Ucionica { get; set; }
    }
}
