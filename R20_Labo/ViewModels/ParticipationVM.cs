using System.ComponentModel.DataAnnotations;

namespace R20_Labo.ViewModels
{
    public class ParticipationVM
    {
        [Required]
        [Range(1, 4)]
        public int Position { get; set; }

        [Required]
        [Range(0, int.MaxValue)]
        public int Chrono { get; set; }

        [Required]
        [Range(1, 4)]
        public int NbJoueurs { get; set; }

        [Required]
        public string NomCourse { get; set; } = null!;
    }
}
