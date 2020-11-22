using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Threading.Tasks;
using Baza.Models;
using Baza.Search;
using Domain;
using Meta.Numerics.Statistics;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
//using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using WebApplication.Helpers;

namespace WebApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class RasporedController : BaseController
    {
        private readonly BAZAContext db;
        public IConfiguration Configuration { get; }
        private readonly EmailNotifier notifier;

        public RasporedController(BAZAContext db, IConfiguration configuration, EmailNotifier notifier)
        {
            this.db = db;
            this.Configuration = configuration;
            this.notifier = notifier;
        }

        //string query = @"
        //        select 
        //        s.ime
        //        ,s.prezime
        //        ,s.indeks
        //        ,ls.redosled
        //        ,r.pocetak_laba as pocetakLaba
        //        ,r.ucionica
        //        from
        //        dbo.RASPORED as r
        //        inner join dbo.STUDENT as s
        //        on r.student = s.ID
        //        inner join dbo.LAB_SPECIFICNA as ls
        //        on r.lab_vezba = ls.ID
        //        ";
        //DataTable table = new DataTable();
        //using (var con = new SqlConnection(Configuration.GetConnectionString("DefaultConnection")))
        //using (var cmd = new SqlCommand(query, con))
        //using (var da = new SqlDataAdapter(cmd))
        //{
        //    cmd.CommandType = CommandType.Text;
        //    da.Fill(table);
        //}

        [HttpGet]
        public async Task<IActionResult> Get([FromQuery] RasporedSearchModel search)
        {
            var query = db.Raspored.Include(x => x.StudentNavigation).Include(x => x.LabVezbaNavigation).AsQueryable();
            var labQuery = db.LabVezba.AsQueryable();
            bool self = false;

            if (this.IsStudent)
            {
                search.studentId = this.StudentId;
                self = true;
            }

            if (search.studentId != null)
            {
                query = query.Where(x => x.Student == search.studentId);
            }

            query = query.OrderBy(x => x.StudentNavigation.Indeks);

            var list = query.Select(x => new RasporedModel
            {
                Student = new StudentModel
                {
                    Ime = x.StudentNavigation.Ime,
                    Prezime = x.StudentNavigation.Prezime,
                    Indeks = x.StudentNavigation.Indeks
                },
                LabVezbaSpecificna = new LabVezbaSpecificna
                {
                    Redosled = x.LabVezbaNavigation.Redosled
                },
                PocetakLaba = x.LabVezbaNavigation.VremeOd ?? DateTime.Now,
                ZavrsetakLaba = x.LabVezbaNavigation.VremeDo,
                Ucionica = x.Ucionica,
                Izmenjen = x.Izmenjen ?? false,
                NazivLabVezbe = labQuery.Where(lab => lab.Id == x.LabVezbaNavigation.IdLabVezbe).ToArray()[0].Naziv,
                Id = x.Id
            }).ToList();

            if (self)
            {
                await query.ForEachAsync(x => x.Izmenjen = false);
                db.SaveChanges();
            }

            return Ok(list);
        }

        [HttpGet("filter")]
        public async Task<IActionResult> GetFiltered([FromQuery] RasporedSearchModel search, [FromQuery] int labId, [FromQuery] int specId)
        {
            var query = db.Raspored.Include(x => x.StudentNavigation).Include(x => x.LabVezbaNavigation).AsQueryable();
            var labQuery = db.LabVezba.AsQueryable();
            bool self = false;

            if (this.IsStudent)
            {
                search.studentId = this.StudentId;
                self = true;
            }

            if (search.studentId != null)
            {
                query = query.Where(x => x.Student == search.studentId);
            }

            query = query.OrderBy(x => x.StudentNavigation.Indeks);

            if (labId != -1)
            {
                query = query.Where(x => x.LabVezbaNavigation.IdLabVezbe == labId);
                if (specId != -1)
                {
                    query = query.Where(x => x.LabVezbaNavigation.Id == specId);
                }
            }

            var list = query.Select(x => new RasporedModel
            {
                Student = new StudentModel
                {
                    Ime = x.StudentNavigation.Ime,
                    Prezime = x.StudentNavigation.Prezime,
                    Indeks = x.StudentNavigation.Indeks
                },
                LabVezbaSpecificna = new LabVezbaSpecificna
                {
                    Redosled = x.LabVezbaNavigation.Redosled
                },
                PocetakLaba = x.LabVezbaNavigation.VremeOd ?? DateTime.Now,
                ZavrsetakLaba = x.LabVezbaNavigation.VremeDo,
                Ucionica = x.Ucionica,
                Izmenjen = x.Izmenjen ?? false,
                NazivLabVezbe = labQuery.Where(lab => lab.Id == x.LabVezbaNavigation.IdLabVezbe).ToArray()[0].Naziv,
                Id = x.Id
            });

            if (self)
            {
                await query.ForEachAsync(x => x.Izmenjen = false);
                db.SaveChanges();
            }

            return Ok(list);
        }

        [HttpGet]
        [Route("prosek")]
        public IActionResult VR_prosek()
        {
            string query = "USP_PROSEK";
            DataTable table = new DataTable();
            using (var con = new SqlConnection(Configuration.GetConnectionString("DefaultConnection")))
            using (var cmd = new SqlCommand(query, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                da.Fill(table);
            }

            return Ok(table);
        }


        [HttpPost]
        public string Post(Raspored rs)
        {
            try
            {
                rs.Izmenjen = true;
                db.Raspored.Add(rs);
                db.SaveChanges();

                return "Added Successfully!!";
            }
            catch (Exception)
            {
                return "Failed to Add!!";
            }
        }


        [HttpPut]
        public IActionResult Put(Raspored r)
        {
            try
            {

                var rasporedDB = db.Raspored
                    .Include(x => x.StudentNavigation)
                    .Include(x => x.LabVezbaNavigation)
                    .ThenInclude(x => x.IdLabVezbeNavigation)
                    .FirstOrDefault(x => x.Id == r.Id);

                rasporedDB.Ucionica = r.Ucionica;
                rasporedDB.PocetakLaba = Convert.ToDateTime(r.PocetakLaba);
                rasporedDB.ZavrsetakLaba = Convert.ToDateTime(r.ZavrsetakLaba);
                rasporedDB.Izmenjen = true;

                notifier.Send(rasporedDB.StudentNavigation.Username, $"Obaveštenje o lab vežbama. Došlo je do izmene za {rasporedDB.LabVezbaNavigation.IdLabVezbeNavigation.Naziv} - {rasporedDB.LabVezbaNavigation.Redosled} termin {rasporedDB.PocetakLaba}");

                db.SaveChanges();

                return Ok();
            }
            catch (Exception)
            {

                return BadRequest();
            }
        }

        [HttpDelete]
        public string Delete(int rs)
        {
            try
            {
                string query = @"
                    delete from dbo.RASPORED 
                    where lab_vezba=" + rs + @"
                    ";

                DataTable table = new DataTable();
                using (var con = new SqlConnection(Configuration.GetConnectionString("DefaultConnection")))
                using (var cmd = new SqlCommand(query, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.Text;
                    da.Fill(table);
                }

                return "Deleted Successfully!!";
            }
            catch (Exception)
            {

                return "Failed to Delete!!";
            }
        }

        [HttpPost("multiple")]
        public IActionResult PostMultipleRaspored([FromBody] RasporedFromCsv[] data)
        {
            try
            {
                foreach (var raspored in data)
                {
                    var student = db.Student.FirstOrDefault(x => x.Indeks == raspored.Indeks);

                    if (student is null && raspored.Indeks.HasValue)
                    {
                        student = new Student()
                        {
                            Indeks = raspored.Indeks,
                            Ime = raspored.Ime,
                            Prezime = raspored.Prezime,
                            Username = raspored.Email
                        };
                        db.Student.Add(student);
                    }

                    var lab = db.LabVezba.FirstOrDefault(x => x.Naziv == raspored.NazivLabVezbe && !string.IsNullOrEmpty(raspored.NazivLabVezbe));

                    if (lab is null)
                    {
                        lab = new LabVezba
                        {
                            Naziv = raspored.NazivLabVezbe,
                            Tag = raspored.Tag
                        };

                        db.LabVezba.Add(lab);
                    }

                    var specificna = db.LabSpecificna.FirstOrDefault(x => x.IdLabVezbeNavigation.Naziv == raspored.NazivLabVezbe && x.Redosled == raspored.LabVezba);

                    if (specificna is null)
                    {
                        specificna = new LabSpecificna
                        {
                            Redosled = raspored.LabVezba,
                            IdLabVezbeNavigation = lab
                        };

                        db.LabSpecificna.Add(specificna);
                    }

                    var rasporedDB = db.Raspored.FirstOrDefault(x => (student == null || x.Student == student.Id) && x.LabVezba == specificna.Id);

                    if (rasporedDB is null)
                    {
                        rasporedDB = new Raspored
                        {
                            LabVezbaNavigation = specificna,
                            PocetakLaba = raspored.Pocetak,
                            StudentNavigation = student,
                            Ucionica = raspored.Ucionica,
                            ZavrsetakLaba = raspored.Kraj
                        };
                        db.Raspored.Add(rasporedDB);
                    }
                    else
                    {
                        rasporedDB.PocetakLaba = raspored.Pocetak;
                        rasporedDB.ZavrsetakLaba = raspored.Kraj;
                        rasporedDB.Izmenjen = true;
                    }
                }

                db.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest();
            }
        }

        //DODATO 
        [AllowAnonymous]
        [HttpPost("uporedi")]   //dodati na frontu rute i to
        public IActionResult Uporedi([FromBody] UporediUzorkeModel parametri)
        {
            var lab = db.LabVezba.FirstOrDefault(x => x.Id == parametri.LabVezbaId);

            List<int> trenutnaGeneracija = TrenutnoVremeZadrzavanja(lab.Tag, lab.Naziv, parametri.Redosled);
            List<int> prosleGeneracije = VremeZadrzavanja(lab.Tag, lab.Naziv, parametri.Redosled);

            string message = UporediUzorke(trenutnaGeneracija, prosleGeneracije);


            //ispisi na frontu ili kako god
            //ali to prilikom pravljenja formice za profesora da bira jel oce da izmeni ili ne....
            return Ok(message);
        }


        [AllowAnonymous]
        [HttpPost("linearno-pomeranje")]
        public IActionResult LinearnoPomeranje([FromBody] LinearnoPomeranjeModel parametri)
        {
            var specificna = db.LabSpecificna.FirstOrDefault(x => x.Id == parametri.LabVezbaSpecificnaId);

            if (specificna is null) return BadRequest();

            var specificne = db.LabSpecificna.Where(x => x.VremeOd >= specificna.VremeOd
            && x.Redosled == specificna.Redosled
            && x.VremeOd.Value.Date == specificna.VremeOd.Value.Date);

            foreach (var spec in specificne)
            {
                spec.VremeOd = spec.VremeOd.Value.AddMinutes(parametri.Pomeraj);
            }

            db.SaveChanges();

            return Ok();
        }

        [AllowAnonymous]
        [HttpPost("slot")]   //dodati na frontu rute i to
        public IActionResult PredloziVrednostSlota([FromBody] UporediUzorkeModel parametri)
        {
            var lab = db.LabVezba.FirstOrDefault(x => x.Id == parametri.LabVezbaId);

            List<int> prosleGeneracije = VremeZadrzavanja(lab.Tag, lab.Naziv, parametri.Redosled);

            string message = PredloziSlot(prosleGeneracije);


            //ispisi na frontu ili kako god
            //ali to prilikom pravljenja formice za profesora da bira jel oce da izmeni ili ne....
            return Ok(message);
        }
        #region protocno

        [AllowAnonymous]
        [HttpPost("raspodeli")]
        public IActionResult Test([FromBody] RaspodeliProtocnoModel parametri)
        {
            var res = ProtocniRaspored(parametri).Select(x => x.First()).ToList();

            //TODO: POKUPI STUDENTE
            var query = db.Student.AsQueryable();
            query = query.Where(s => s.LabVezbaStudent.Any(x => x.LabVezbaId == parametri.LabVezbaId));

            query = query.OrderBy(x => x.Indeks);

            var list = query.ToList();

            //TODO: ZA SVAKOG DODAJ RASPORED

            var spec = db.LabSpecificna.Where(x => x.IdLabVezbe == parametri.LabVezbaId && x.Redosled == parametri.Redosled);

            db.LabSpecificna.RemoveRange(spec);
            db.SaveChanges();

            var skip = 0;
            var i = 0;
            foreach (var num in res)
            {
                var specificna = new LabSpecificna
                {
                    IdLabVezbe = parametri.LabVezbaId,
                    Redosled = parametri.Redosled,
                    //razmisli
                    VremeOd = parametri.Pocetak.AddMinutes(i * parametri.Slot)
                };
                i++;

                if (num == 0) continue;

                var studentiUSlot = list.Skip(skip).Take((int)num);
                skip += (int)num;

                if (!studentiUSlot.Any()) break;

                foreach (var student in studentiUSlot)
                {
                    if (student.Indeks >= parametri.minIndeks)
                    {
                        var raspored = db.Raspored.FirstOrDefault(x => x.Student == student.Id && x.LabVezba == specificna.Id);

                        if (raspored == null)
                        {
                            raspored = new Raspored
                            {
                                StudentNavigation = student,
                                Ucionica = parametri.Ucionica,
                                LabVezbaNavigation = specificna
                            };
                            db.Raspored.Add(raspored);
                        }

                        raspored.Izmenjen = true;

                        //notifier.Send(student.Username, $"Obaveštenje o lab vežbama. Došlo je do izmene za {specificna.IdLabVezbeNavigation.Naziv} - {specificna.Redosled} termin {specificna.VremeOd}");
                    }
                }

            }

            db.SaveChanges();
            return Ok();
        }
        [AllowAnonymous]
        [HttpPost("smanjenkapacitet")]
        public IActionResult SmanjenKapacitet([FromBody] RaspodeliProtocnoModel parametri)
        {
            //parametri.LabVezbaId = 1;
            //parametri.Redosled = 1;
            //parametri.Ucionica = "565asd";
            //parametri.Trajanje = 30;
            //parametri.Kapacitet = 2;
            //parametri.Slot = 5;
            //parametri.Kraj = new DateTime(2020, 11, 11, 23, 0, 0);

            // DateTime pocetakSpec = DateTime.Now;
            int? index = 0;

            var specificna = db.LabSpecificna.FirstOrDefault(x => x.Id == parametri.LabVezbaSpecificnaId);
            parametri.IzabraniTermin = specificna.VremeOd.Value;

            DateTime pocetakSpec = parametri.IzabraniTermin;

            if (specificna != null)
            {
                parametri.Redosled = specificna.Redosled.Value;
                //parametri.Pocetak = specificna.VremeOd.Value;

                var spec = db.LabSpecificna.Where(x => x.IdLabVezbe == parametri.LabVezbaId
                                               && x.Redosled == parametri.Redosled
                                               && x.VremeOd >= parametri.IzabraniTermin)
               .Include(x => x.Raspored)
               .ThenInclude(x => x.StudentNavigation);

                if (spec.Count() > 0)
                {
                    var spec1 = spec.FirstOrDefault();
                    var ras = spec1.Raspored.FirstOrDefault();
                    index = ras.StudentNavigation.Indeks;

                    parametri.Redosled = spec1.Redosled.Value;
                    parametri.Ucionica = ras.Ucionica;

                    foreach (var s in spec)
                    {
                        db.Raspored.RemoveRange(s.Raspored);
                    }
                }
                else
                {
                    return BadRequest();
                }

                db.LabSpecificna.RemoveRange(spec);
               // db.SaveChanges();
            }
            else
            {
                return BadRequest();
            }

            //POKUPI STUDENTE KOJI NISU USLI NA DANASNJU VEZBU
            var query = db.Student.AsQueryable();
            query = query.Where(s => s.LabVezbaStudent.Any(x => x.LabVezbaId == specificna.IdLabVezbe) && s.Indeks >= index);

            query = query.OrderBy(x => x.Indeks);

            var list = query.ToList();

            var res = ProtocniDinamickiRaspored(parametri).Select(x => x.First()).ToList();
            var skip = 0;
            var i = 0;
            foreach (var num in res)
            {
                specificna = new LabSpecificna
                {
                    IdLabVezbe = parametri.LabVezbaId,
                    Redosled = parametri.Redosled,
                    //razmisli
                    VremeOd = pocetakSpec.AddMinutes(i * parametri.Slot)
                };

                db.LabSpecificna.Add(specificna);

                var studentiUSlot = list.Skip(skip).Take((int)num);
                skip += (int)num;

                foreach (var student in studentiUSlot)
                {
                    var raspored = new Raspored
                    {
                        StudentNavigation = student,
                        Ucionica = parametri.Ucionica,
                        LabVezbaNavigation = specificna
                    };
                    db.Raspored.Add(raspored);


                    raspored.Izmenjen = true;

                    //notifier.Send(student.Username, $"Obaveštenje o lab vežbama. Došlo je do izmene za {specificna.IdLabVezbeNavigation.Naziv} - {specificna.Redosled} termin {specificna.VremeOd}");
                }

                i++;
            }

            //db.SaveChanges();
            return Ok();
        }

        public List<List<double>> ProtocniRaspored([FromBody] RaspodeliProtocnoModel parametri)
        {
            var lab = db.LabVezba.Find(parametri.LabVezbaId);

            int kapacitet = parametri.Kapacitet;
            DateTime pocetak = parametri.Pocetak;
            DateTime kraj = parametri.Kraj;
            int trajanje = parametri.Trajanje;
            int slot = parametri.Slot;


            List<double> listaSurvivalRate = SurvivalRate(StudentiUSlotu(VremeZadrzavanja(lab.Tag, lab.Naziv, parametri.Redosled), slot));

            List<List<double>> sli = new List<List<double>>();

            int brojSlotova = (int)((kraj - pocetak).TotalMinutes - trajanje) / slot + 1;
            double k;

            for (int i = 0; i < brojSlotova; i++)
            {
                List<double> pom = new List<double>();

                if (i == 0)
                {
                    for (int j = 0; j < listaSurvivalRate.Count(); j++)
                        pom.Add(Math.Round(kapacitet * listaSurvivalRate[j]));

                    sli.Add(pom);
                }
                else
                {
                    double sum = 0.00;
                    for (int j = 1; j < i + 1; j++)
                    {
                        if (j >= sli[i - j].Count())
                            sum += 0;
                        else
                            sum += sli[i - j][j];
                    }
                    k = Convert.ToDouble(kapacitet) - sum;
                    if (k <= 0)
                        k = 0;

                    for (int l = 0; l < listaSurvivalRate.Count(); l++)
                        pom.Add(Math.Round(k * listaSurvivalRate[l]));

                    sli.Add(pom);
                }
            }
            return sli;
        }
        private List<List<double>> ProtocniDinamickiRaspored(RaspodeliProtocnoModel parametri)
        {
            var lab = db.LabVezba.Find(parametri.LabVezbaId);

            int kapacitet = parametri.Kapacitet;
            DateTime pocetak = parametri.Pocetak;
            DateTime kraj = parametri.Kraj;
            int trajanje = parametri.Trajanje;
            int slot = parametri.Slot;


            List<double> listaSurvivalRate = SurvivalRate(StudentiUSlotu(VremeZadrzavanja(lab.Tag, lab.Naziv, parametri.Redosled), slot));


            List<List<double>> sli = new List<List<double>>();
            List<List<double>> slipom = new List<List<double>>();

            int brojSlotova = (int)((kraj - pocetak).TotalMinutes - trajanje) / slot + 1;

            DateTime vremepom = pocetak;

            int indeks_slota_termina = 0;

            while (vremepom != parametri.IzabraniTermin)
            {
                DateTime d = vremepom.AddMinutes(slot);
                vremepom = d;
                indeks_slota_termina++;
            }

            double k;

            for (int i = 0; i < brojSlotova; i++)
            {
                List<double> pom = new List<double>();

                if (i == indeks_slota_termina)
                {
                    kapacitet = parametri.NoviKapacitet;
                }
                if (i == 0)
                {
                    for (int j = 0; j < listaSurvivalRate.Count(); j++)
                    {
                        pom.Add(Math.Round(kapacitet * listaSurvivalRate[j]));
                    }

                    sli.Add(pom);
                }
                else
                {
                    double sum = 0.00;
                    for (int j = 1; j < (i + 1); j++)
                    {
                        if (j >= sli[i - j].Count())
                        {
                            sum += 0;
                        }
                        else
                        {
                            sum += sli[i - j][j];
                        }
                    }
                    k = Convert.ToDouble(kapacitet) - sum;
                    if (k <= 0)
                        k = 0;

                    for (int l = 0; l < listaSurvivalRate.Count(); l++)
                    {
                        pom.Add(Math.Round(k * listaSurvivalRate[l]));
                    }

                    sli.Add(pom);
                }
            }

            for (int t = indeks_slota_termina; t < sli.Count(); t++)
            {
                slipom.Add(sli[t]);
            }
            return slipom;
        }
        private List<int> VremeZadrzavanja(string tag, string naziv, int redosled)
        {
            List<int> lista = new List<int>();
            string query = "USP_ZADRZAVANJE";
            DataTable table = new DataTable();
            using (var con = new SqlConnection(Configuration.GetConnectionString("DefaultConnection")))
            using (var cmd = new SqlCommand(query, con))
            {

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@tag", tag);//tag);
                cmd.Parameters.AddWithValue("@naziv", naziv);//naziv);
                cmd.Parameters.AddWithValue("@redosled", redosled);//, redosled);
                con.Open();

                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    if (dr["vreme_zadrzavanja"] != System.DBNull.Value)
                        lista.Add(Convert.ToInt32(dr["vreme_zadrzavanja"]));

                }
                con.Close();
                return lista;
            }
        }

        private List<int> TrenutnoVremeZadrzavanja(string tag, string naziv, int redosled)
        {
            List<int> lista = new List<int>();
            string query = "USP_TRENUTNO_ZADRZAVANJE";
            DataTable table = new DataTable();
            using (var con = new SqlConnection(Configuration.GetConnectionString("DefaultConnection")))
            using (var cmd = new SqlCommand(query, con))
            {

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@tag", tag);//tag);
                cmd.Parameters.AddWithValue("@naziv", naziv);//naziv);
                cmd.Parameters.AddWithValue("@redosled", redosled);//, redosled);
                con.Open();

                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    if (dr["trenutno_vreme_zadrzavanja"] != System.DBNull.Value)
                        lista.Add(Convert.ToInt32(dr["trenutno_vreme_zadrzavanja"]));

                }
                con.Close();
                return lista;
            }
        }

        private List<int> StudentiUSlotu(List<int> lista, int sample)
        {
            List<int> li = new List<int>();
            int i = 1;
            int max = lista.Max();

            //na pocetku su svi u ucionici
            li.Add(lista.Count());

            while (max >= i * sample)
            {
                //li[i] = 0;
                li.Add(0);

                for (int j = 0; j < lista.Count(); j++)
                {
                    if (lista[j] > i * sample)
                        li[i]++;
                }
                i++;
            }

            return li;
        }

        private List<double> SurvivalRate(List<int> lista)
        {
            List<double> li = new List<double>();

            int n = lista[0];

            for (int i = 0; i < lista.Count(); i++)
            {
                li.Add((double)lista[i] / n);
            }

            return li;
        }

        private string UporediUzorke(List<int> trenutnaGeneracija, List<int> prosleGeneracije)
        {
            Sample sample1 = new Sample();
            Sample sample2 = new Sample();
            string poruka = "";
            bool sporiji;



            foreach (int i in trenutnaGeneracija)
                sample1.Add(i);

            foreach (int i in prosleGeneracije)
                sample2.Add(i);
            if (trenutnaGeneracija.Count != 0 && prosleGeneracije.Count != 0)
            {
                TestResult tTest = Sample.StudentTTest(sample1, sample2);

                double mi1 = sample1.Mean;
                double mi2 = sample2.Mean;
                double mi = 0;  //koristice se kao predlog za novu vrednost vremenskog slota,tj koliko put atreba smanjiti ili povacati slot

                if (tTest.Probability < 0.05)
                {
                    if (tTest.Statistic.Value > 0)
                    {
                        sporiji = true;
                        mi = mi1 / mi2;
                        poruka += $"Trenutna generacija je sporija od proslih {mi:N2} puta, u pogledu na srednju vrednost zadrzavanja.";
                    }
                    else
                    {
                        sporiji = false;
                        mi = mi2 / mi1;
                        poruka += $"Trenutna generacija je brza od proslih {mi:N2} puta, u pogledu na srednju vrednost zadrzavanja.";
                    }
                }
                if (poruka == "")
                    poruka += "Generacija se ponasa ocekivano.";
            }
            else
            {
                poruka = "Nema podataka za trazenu statistiku!";
            }
            return poruka;
        }

        private string PredloziSlot(List<int> prosleGeneracije)
        {
            Sample sample = new Sample();

            string poruka = "";

            foreach (int i in prosleGeneracije)
                sample.Add(i);

            double mi = sample.Mean;
            double odVredost = mi / 8;
            double doVrednost = mi / 4;

            poruka += $"Preporucuje se vremenski slot u vrednosti od {odVredost:N0} do {doVrednost:N0} minuta.";

            return poruka;
        }

        #endregion
    }
}
