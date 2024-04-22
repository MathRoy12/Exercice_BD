using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace WrapUpBilleterie.Models
{
    [Table("Spectacle", Schema = "Spectacles")]
    [Index("Nom", Name = "UQ_Spectacle_Nom", IsUnique = true)]
    public partial class Spectacle
    {
        public Spectacle()
        {
            Affiches = new HashSet<Affiche>();
            Representations = new HashSet<Representation>();
        }

        [Key]
        [Column("SpectacleID")]
        public int SpectacleId { get; set; }
        [StringLength(100)]
        public string Nom { get; set; } = null!;
        [Column(TypeName = "date")]
        public DateTime Debut { get; set; }
        [Column(TypeName = "date")]
        public DateTime Fin { get; set; }
        public int Prix { get; set; }

        [InverseProperty("Spectacle")]
        public virtual ICollection<Affiche> Affiches { get; set; }
        [InverseProperty("Spectacle")]
        public virtual ICollection<Representation> Representations { get; set; }
    }
}
