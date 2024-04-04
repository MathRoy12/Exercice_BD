using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace R19_Labo.Models
{
    [Table("Fruit", Schema = "Fruits")]
    [Index("Identifiant", Name = "UC_Fruit_Identifiant", IsUnique = true)]
    public partial class Fruit
    {
        public Fruit()
        {
            EtudiantFruits = new HashSet<EtudiantFruit>();
        }

        [Key]
        [Column("FruitID")]
        public int FruitId { get; set; }
        [StringLength(30)]
        [Unicode(false)]
        public string Nom { get; set; } = null!;
        [StringLength(30)]
        [Unicode(false)]
        public string Couleur { get; set; } = null!;
        public Guid Identifiant { get; set; }
        public byte[]? Photo { get; set; }

        [InverseProperty("Fruit")]
        public virtual ICollection<EtudiantFruit> EtudiantFruits { get; set; }
    }
}
