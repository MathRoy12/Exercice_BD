using S09_Labo.Models;

namespace S09_Labo.ViewModels
{
    public class UtilisateurEtFavorisViewModel
    {
        // Nécessaire à partir de la migration 1.5
        //public Utilisateur Utilisateur { get; set; } = null!;

        public List<Chanteur> ChanteursFavoris { get; set; } = null!;
    }
}
