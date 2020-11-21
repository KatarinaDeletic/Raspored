using System;
using System.Collections.Generic;

namespace Baza.Models
{
    public partial class LabSpecificna
    {
        public LabSpecificna()
        {
            Raspored = new HashSet<Raspored>();
        }

        public int Id { get; set; }
        public DateTime? VremeOd { get; set; }
        public DateTime? VremeDo { get; set; }
        public int? Redosled { get; set; }
        public int? IdLabVezbe { get; set; }

        public virtual LabVezba IdLabVezbeNavigation { get; set; }
        public virtual ICollection<Raspored> Raspored { get; set; }
    }
}
