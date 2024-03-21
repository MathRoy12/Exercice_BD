namespace Labo_R15.ViewModels;

public class NbSpecialiteViewModel
{
    public string Specialite { get; set; }
    public int Nb { get; set; }

    public NbSpecialiteViewModel(string specialite, int nb)
    {
        Nb = nb;
        Specialite = specialite;
    }
}