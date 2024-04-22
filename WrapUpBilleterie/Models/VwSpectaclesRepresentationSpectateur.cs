using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace WrapUpBilleterie.Models
{
    [Keyless]
    public partial class VwSpectaclesRepresentationSpectateur
    {
        [Column("SpectacleID")]
        public int SpectacleId { get; set; }
        [StringLength(100)]
        public string Nom { get; set; } = null!;
        [Column(TypeName = "date")]
        public DateTime Debut { get; set; }
        [Column(TypeName = "date")]
        public DateTime Fin { get; set; }
        public int? NbRepresentation { get; set; }
        public int? NbBilletsVendus { get; set; }
        public int Prix { get; set; }
    }
}
