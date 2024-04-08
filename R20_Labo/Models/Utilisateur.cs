using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace R20_Labo.Models
{
    [Table("Utilisateur", Schema = "Utilisateurs")]
    [Index("UtilisateurId", "Pseudo", Name = "IX_Utilisateur_Utilisateur")]
    [Index("Pseudo", Name = "UC_Utilisateur_Pseudo", IsUnique = true)]
    public partial class Utilisateur
    {
        public Utilisateur()
        {
            ParticipationCourses = new HashSet<ParticipationCourse>();
        }

        [Key]
        [Column("UtilisateurID")]
        public int UtilisateurId { get; set; }
        [StringLength(30)]
        public string Pseudo { get; set; } = null!;
        [Column(TypeName = "datetime")]
        public DateTime DateInscription { get; set; }
        [StringLength(320)]
        public string Courriel { get; set; } = null!;
        public bool EstSuppr { get; set; }

        [InverseProperty("Utilisateur")]
        public virtual ICollection<ParticipationCourse> ParticipationCourses { get; set; }
    }
}
