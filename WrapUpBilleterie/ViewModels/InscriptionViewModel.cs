using System.ComponentModel.DataAnnotations;

namespace WrapUpBilleterie.ViewModels
{
    public class InscriptionViewModel
    {
        [Required(ErrorMessage = "Un nom d'utilisateur est requis")]
        public string Nom { get; set; } = null!;

        [Required(ErrorMessage = "Un prénom d'utilisateur est requis")]
        public string Prenom { get; set; } = null!;

        [Required(ErrorMessage = "Un courriel d'utilisateur est requis")]
        public string Courriel { get; set; } = null!;

        [Required(ErrorMessage = "Un mot de passe est requis")]
        [StringLength(50, MinimumLength = 6, ErrorMessage = "Le mot de passe doit avoir entre 6 et 50 caractères.")]
        [DataType(DataType.Password)]
        public string MotDePasse { get; set; } = null!;

        [Required(ErrorMessage = "Veuillez confirmer le mot de passe")]
        [DataType(DataType.Password)]
        [Compare(nameof(MotDePasse), ErrorMessage = "Les deux mots de passe sont différents.")]
        public string MotDePasseConfirmation { get; set; } = null!;
    }
}
