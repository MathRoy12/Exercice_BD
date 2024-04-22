using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using WrapUpBilleterie.Models;

namespace WrapUpBilleterie.Data
{
    public partial class R22_BilleterieContext : DbContext
    {
        public R22_BilleterieContext()
        {
        }

        public R22_BilleterieContext(DbContextOptions<R22_BilleterieContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Affiche> Affiches { get; set; } = null!;
        public virtual DbSet<Billet> Billets { get; set; } = null!;
        public virtual DbSet<Changelog> Changelogs { get; set; } = null!;
        public virtual DbSet<Client> Clients { get; set; } = null!;
        public virtual DbSet<Representation> Representations { get; set; } = null!;
        public virtual DbSet<Spectacle> Spectacles { get; set; } = null!;
        public virtual DbSet<VwSpectaclesRepresentationSpectateur> VwSpectaclesRepresentationSpectateurs { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=R22_Billeterie");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Affiche>(entity =>
            {
                entity.Property(e => e.Identifiant).HasDefaultValueSql("(newid())");

                entity.HasOne(d => d.Spectacle)
                    .WithMany(p => p.Affiches)
                    .HasForeignKey(d => d.SpectacleId)
                    .HasConstraintName("FK_Affiche_SpectacleID");
            });

            modelBuilder.Entity<Billet>(entity =>
            {
                entity.HasOne(d => d.Client)
                    .WithMany(p => p.Billets)
                    .HasForeignKey(d => d.ClientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Billet_ClientID");

                entity.HasOne(d => d.Representation)
                    .WithMany(p => p.Billets)
                    .HasForeignKey(d => d.RepresentationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Billet_RepresentationID");
            });

            modelBuilder.Entity<Changelog>(entity =>
            {
                entity.Property(e => e.InstalledOn).HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Representation>(entity =>
            {
                entity.Property(e => e.DateHeureRepresentation).HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.Spectacle)
                    .WithMany(p => p.Representations)
                    .HasForeignKey(d => d.SpectacleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Representation_SpectacleID");
            });

            modelBuilder.Entity<VwSpectaclesRepresentationSpectateur>(entity =>
            {
                entity.ToView("VW_SpectaclesRepresentationSpectateur", "Spectacles");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
