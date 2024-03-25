using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using S09_Labo.Models;

namespace S09_Labo.Data
{
    public partial class S09_LaboContext : DbContext
    {
        public S09_LaboContext()
        {
        }

        public S09_LaboContext(DbContextOptions<S09_LaboContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Changelog> Changelogs { get; set; } = null!;
        public virtual DbSet<Chanson> Chansons { get; set; } = null!;
        public virtual DbSet<Chanteur> Chanteurs { get; set; } = null!;
        public virtual DbSet<VwChanteurNbChanson> VwChanteurNbChansons { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=S09_Labo");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Changelog>(entity =>
            {
                entity.Property(e => e.InstalledOn).HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Chanson>(entity =>
            {
                entity.HasOne(d => d.Chanteur)
                    .WithMany(p => p.Chansons)
                    .HasForeignKey(d => d.ChanteurId)
                    .HasConstraintName("FK_Chanson_ChanteurID");
            });

            modelBuilder.Entity<VwChanteurNbChanson>(entity =>
            {
                entity.ToView("VW_ChanteurNbChansons", "Musique");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
