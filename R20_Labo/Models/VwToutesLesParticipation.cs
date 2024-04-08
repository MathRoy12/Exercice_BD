using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace R20_Labo.Models
{
    [Keyless]
    public partial class VwToutesLesParticipation
    {
        [Column("ParticipationCourseID")]
        public int ParticipationCourseId { get; set; }
        [Column("UtilisateurID")]
        public int UtilisateurId { get; set; }
        [StringLength(30)]
        public string Pseudo { get; set; } = null!;
        [Column("CourseID")]
        public int CourseId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string Nom { get; set; } = null!;
        public int NbJoueurs { get; set; }
        public int Position { get; set; }
        public int Chrono { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime DateParticipation { get; set; }
    }
}
