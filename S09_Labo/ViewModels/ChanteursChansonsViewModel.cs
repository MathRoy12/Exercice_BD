using S09_Labo.Models;
using S09_Labo.ViewModels;

namespace S09_Labo.ViewModels
{
    public class ChanteursChansonsViewModel
    {
        public List<Chanteur> Chanteurs { get; set; } = null!;
        public List<Chanson> Chansons { get; set; } = null!;
    }
}
