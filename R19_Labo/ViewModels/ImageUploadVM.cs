using R19_Labo.Models;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace R19_Labo.ViewModels
{
    public class ImageUploadVM
    {
        [Required (ErrorMessage = "Il faut joindre un fichier image.")]
        public IFormFile FormFile { get; set; } = null!;
        [Required (ErrorMessage = "Il faut spécifier le nom d'un fruit.")]
        [DisplayName("Nom du fruit en minuscules")]
        public string NomFruit { get; set; } = null!;
    }
}
