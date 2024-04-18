using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace WrapUpBilleterie.Models
{
    [Table("Client", Schema = "Clients")]
    [Index("Courriel", Name = "UC_Client_Courriel", IsUnique = true)]
    public partial class Client
    {
        [Key]
        [Column("ClientID")]
        public int ClientId { get; set; }
        [StringLength(50)]
        public string Nom { get; set; } = null!;
        [StringLength(50)]
        public string Prenom { get; set; } = null!;
        [StringLength(256)]
        public string Courriel { get; set; } = null!;
        [MaxLength(16)]
        public byte[] MdpSel { get; set; } = null!;
        [MaxLength(32)]
        public byte[] MotDePasseHache { get; set; } = null!;
    }
}
