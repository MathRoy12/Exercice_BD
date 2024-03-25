using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace S09_Labo.Models
{
    [Keyless]
    public partial class VwChanteurNbChanson
    {
        [Column("ChanteurID")]
        public int ChanteurId { get; set; }
        [StringLength(50)]
        public string Nom { get; set; } = null!;
        [Column(TypeName = "date")]
        public DateTime DateNaissance { get; set; }
        [Column("Nombre de chansons")]
        public int? NombreDeChansons { get; set; }
    }
}
