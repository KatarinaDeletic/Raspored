using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class RaspodeliProtocnoModel
    {
        public int LabVezbaId { get; set; }
        public int LabVezbaSpecificnaId { get; set; }
        public int Redosled { get; set; }
        public string Ucionica { get; set; }
        public int Trajanje { get; set; }
        public DateTime Pocetak { get; set; }
        public DateTime Kraj { get; set; }
        public int Kapacitet { get; set; }
        public int Slot { get; set; }
        public int BrojStudenata { get; set; }
        public int minIndeks { get; set; }
        public int VremeKasnjenja { get; set; }
    }
}
