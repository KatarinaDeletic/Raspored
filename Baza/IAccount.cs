using System;
using System.Collections.Generic;
using System.Text;

namespace Baza
{
    public interface IAccount
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public string Ime { get; set; }
        public string Prezime { get; set; }
    }
}
