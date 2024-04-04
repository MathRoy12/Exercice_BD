using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using R19_Labo.Models;

namespace R19_Labo.Data
{
    public partial class R19_LaboContext : DbContext
    {
        public R19_LaboContext()
        {
        }

        public R19_LaboContext(DbContextOptions<R19_LaboContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Changelog> Changelogs { get; set; } = null!;
        public virtual DbSet<Etudiant> Etudiants { get; set; } = null!;
        public virtual DbSet<EtudiantFruit> EtudiantFruits { get; set; } = null!;
        public virtual DbSet<Fruit> Fruits { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=R19_Labo");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Changelog>(entity =>
            {
                entity.Property(e => e.InstalledOn).HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Etudiant>(entity =>
            {
                entity.Property(e => e.Classe).IsFixedLength();
            });

            modelBuilder.Entity<EtudiantFruit>(entity =>
            {
                entity.HasOne(d => d.Etudiant)
                    .WithMany(p => p.EtudiantFruits)
                    .HasForeignKey(d => d.EtudiantId)
                    .HasConstraintName("FK_EtudiantFruit_EtudiantID");

                entity.HasOne(d => d.Fruit)
                    .WithMany(p => p.EtudiantFruits)
                    .HasForeignKey(d => d.FruitId)
                    .HasConstraintName("FK_EtudiantFruit_FruitID");
            });

            modelBuilder.Entity<Fruit>(entity =>
            {
                entity.Property(e => e.Identifiant).HasDefaultValueSql("(newid())");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
