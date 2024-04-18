using System.ComponentModel.DataAnnotations;

namespace WrapUpBilleterie.ViewModels
{
    public class ConnexionViewModel
    {
        [Required(ErrorMessage = "Veuillez préciser un courriel d'utilisateur.")]
        public string Courriel { get; set; } = null!;

        [Required(ErrorMessage = "Veuillez entrer un mot de passe.")]
        public string MotDePasse { get; set; } = null!;
    }
}
