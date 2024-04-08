using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using R20_Labo.Data;
using R20_Labo.Models;
using R20_Labo.ViewModels;
using System.Security.Claims;
using System.Security.Principal;

namespace R20_Labo.Controllers
{
    public class JeuController : Controller
    {
        private readonly SussyKartContext _context;

        public JeuController(SussyKartContext context)
        {
            _context = context;
        }


        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Tutoriel()
        {
            return View();
        }

        public IActionResult Jouer()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Jouer(ParticipationVM pvm)
        {
            // Le paramètre pvm est déjà rempli par la View Jouer et il est reçu par cette action... qui est vide.
            IIdentity? identite = HttpContext.User.Identity;
            if (identite != null && identite.IsAuthenticated)
            {
                string pseudo = HttpContext.User.FindFirstValue(ClaimTypes.Name);
                Utilisateur? utilisateur = await _context.Utilisateurs.FirstOrDefaultAsync(x => x.Pseudo == pseudo);
                if (utilisateur != null)
                {
                    string query = "EXEC Courses.USP_CreerParticipation @Position, @Chrono, @NbJoueurs, @NomCourse, @UtilisateurID";
                    List<SqlParameter> parameters = new List<SqlParameter>
                    {
                        new SqlParameter { ParameterName = "@Position", Value = pvm.Position },
                        new SqlParameter { ParameterName = "@Chrono", Value = pvm.Chrono },
                        new SqlParameter { ParameterName = "@NbJoueurs", Value = pvm.NbJoueurs },
                        new SqlParameter { ParameterName = "@NomCourse", Value = pvm.NomCourse },
                        new SqlParameter { ParameterName = "@UtilisateurID", Value = utilisateur.UtilisateurId }
                    };
                    try
                    {
                        await _context.Database.ExecuteSqlRawAsync(query, parameters.ToArray());
                        // Message optionnel
                        ViewData["message"] = "Participation ajoutée !";
                        return View();
                    }
                    catch (Exception)
                    {
                        // Message optionnel
                        ViewData["message"] = "L'insertion a échoué.";
                        return View();
                    }
                }
            }
            // Message optionnel
            ViewData["message"] = "Personne n'est connecté";
            return View();
        }
    }
}
