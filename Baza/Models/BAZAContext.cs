using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Baza.Models
{
    public partial class BAZAContext : DbContext
    {
        public BAZAContext()
        {
        }

        public BAZAContext(DbContextOptions<BAZAContext> options)
            : base(options)
        {
        }

        public virtual DbSet<LabSpecificna> LabSpecificna { get; set; }
        public virtual DbSet<LabVezba> LabVezba { get; set; }
        public virtual DbSet<LabVezbaStudent> LabVezbaStudent { get; set; }
        public virtual DbSet<Profesor> Profesor { get; set; }
        public virtual DbSet<Raspored> Raspored { get; set; }
        public virtual DbSet<Student> Student { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("data source=.;Initial Catalog=BAZA;Integrated Security=true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<LabSpecificna>(entity =>
            {
                entity.ToTable("LAB_SPECIFICNA");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.IdLabVezbe).HasColumnName("Id_Lab_vezbe");

                entity.Property(e => e.Redosled).HasColumnName("redosled");

                entity.Property(e => e.VremeDo)
                    .HasColumnName("vremeDo")
                    .HasColumnType("datetime");

                entity.Property(e => e.VremeOd)
                    .HasColumnName("vremeOd")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.IdLabVezbeNavigation)
                    .WithMany(p => p.LabSpecificna)
                    .HasForeignKey(d => d.IdLabVezbe)
                    .HasConstraintName("FK_LAB_SPECIFICNA_LAB_VEZBA");
            });

            modelBuilder.Entity<LabVezba>(entity =>
            {
                entity.ToTable("LAB_VEZBA");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Active)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Naziv)
                    .IsRequired()
                    .HasColumnName("naziv")
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Tag)
                    .HasColumnName("tag")
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<LabVezbaStudent>(entity =>
            {
                entity.HasOne(d => d.LabVezba)
                    .WithMany(p => p.LabVezbaStudent)
                    .HasForeignKey(d => d.LabVezbaId)
                    .HasConstraintName("FK_LabVezbaStudent_LAB_VEZBA");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.LabVezbaStudent)
                    .HasForeignKey(d => d.StudentId)
                    .HasConstraintName("FK_LabVezbaStudent_STUDENT");
            });

            modelBuilder.Entity<Profesor>(entity =>
            {
                entity.ToTable("PROFESOR");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Ime)
                    .HasColumnName("ime")
                    .HasMaxLength(50);

                entity.Property(e => e.Password)
                    .HasColumnName("password")
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Prezime)
                    .HasColumnName("prezime")
                    .HasMaxLength(50);

                entity.Property(e => e.Username)
                    .HasColumnName("username")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Raspored>(entity =>
            {
                entity.ToTable("RASPORED");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.LabVezba).HasColumnName("lab_vezba");

                entity.Property(e => e.PocetakLaba)
                    .HasColumnName("pocetak_laba")
                    .HasColumnType("datetime");

                entity.Property(e => e.Student).HasColumnName("student");

                entity.Property(e => e.Ucionica)
                    .HasColumnName("ucionica")
                    .HasMaxLength(10);

                entity.Property(e => e.ZavrsetakLaba)
                    .HasColumnName("zavrsetak_laba")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.LabVezbaNavigation)
                    .WithMany(p => p.Raspored)
                    .HasForeignKey(d => d.LabVezba)
                    .HasConstraintName("FK_RASPORED_LAB_SPECIFICNA");

                entity.HasOne(d => d.StudentNavigation)
                    .WithMany(p => p.Raspored)
                    .HasForeignKey(d => d.Student)
                    .HasConstraintName("FK_RASPORED_STUDENT");
            });

            modelBuilder.Entity<Student>(entity =>
            {
                entity.ToTable("STUDENT");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Ime)
                    .IsRequired()
                    .HasColumnName("ime")
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Indeks).HasColumnName("indeks");

                entity.Property(e => e.Notifikacije).HasColumnName("notifikacije");

                entity.Property(e => e.Password)
                    .HasColumnName("password")
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Prezime)
                    .HasColumnName("prezime")
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Username)
                    .HasColumnName("username")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
