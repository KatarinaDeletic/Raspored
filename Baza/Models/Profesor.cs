using System;
using System.Collections.Generic;

namespace Baza.Models
{
    public partial class Profesor
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
    }
}
