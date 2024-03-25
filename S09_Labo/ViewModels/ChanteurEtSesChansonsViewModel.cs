using S09_Labo.Models;

namespace S09_Labo.ViewModels
{
    public class ChanteurEtSesChansonsViewModel
    {
        public Chanteur Chanteur { get; set; } = null!;
        public List<Chanson> Chansons { get; set; } = null!;
    }
}
