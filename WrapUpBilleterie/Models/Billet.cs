using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace WrapUpBilleterie.Models
{
    [Table("Billet", Schema = "Spectacles")]
    public partial class Billet
    {
        [Key]
        [Column("BilletID")]
        public int BilletId { get; set; }
        public int? CoutBillet { get; set; }
        public int NbBillet { get; set; }
        [Column("RepresentationID")]
        public int RepresentationId { get; set; }
        [Column("ClientID")]
        public int ClientId { get; set; }

        [ForeignKey("ClientId")]
        [InverseProperty("Billets")]
        public virtual Client Client { get; set; } = null!;
        [ForeignKey("RepresentationId")]
        [InverseProperty("Billets")]
        public virtual Representation Representation { get; set; } = null!;
    }
}
