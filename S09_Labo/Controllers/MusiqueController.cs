using System.Runtime.Intrinsics.X86;
using S09_Labo.Data;
using S09_Labo.Models;
using S09_Labo.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using System.Security.Principal;
using Microsoft.Data.SqlClient;

namespace S09_Labo.Controllers
{
    public class MusiqueController : Controller
    {
        readonly S09_LaboContext _context;

        public MusiqueController(S09_LaboContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            // Manière habituelle de récupérer un utilisateur (Migration 1.4)
            ViewData["utilisateur"] = "visiteur";
            IIdentity? identite = HttpContext.User.Identity;
            if (identite != null && identite.IsAuthenticated)
            {
                string pseudo = HttpContext.User.FindFirstValue(ClaimTypes.Name);
                Utilisateur? utilisateur = await _context.Utilisateurs.FirstOrDefaultAsync(x => x.Pseudo == pseudo);
                if (utilisateur != null)
                {
                    // Pour dire "Bonjour X" sur l'index
                    ViewData["utilisateur"] = utilisateur.Pseudo;
                }
            }

            return View();
        }

        public async Task<IActionResult> ChanteursEtChansons()
        {
            // On va récupérer toutes les chansons et les chanteurs pour les envoyer à la vue
            ChanteursChansonsViewModel ccvm = new ChanteursChansonsViewModel()
            {
                Chanteurs = await _context.Chanteurs.ToListAsync(),
                Chansons = await _context.Chansons.ToListAsync()
            };
            return View(ccvm);
        }

        public async Task<IActionResult> Chanteurs()
        {
            // À cause du lazy loading, on charge les chansons de la BD :
            List<Chanson> chansons = await _context.Chansons.ToListAsync();

            // Ensuite on va chercher les chanteurs ET on compte leur nombre de chansons pour chacun
            List<VwChanteurNbChanson> data = await _context.VwChanteurNbChansons.ToListAsync();
            return View(data);
        }

        public async Task<IActionResult> UnChanteurEtSesChansons(string chanteurRecherche)
        {
            // Trouver un chanteur par son nom. Pas sensible à la casse
            Chanteur? chanteur = await _context.Chanteurs.Where(x => x.Nom.ToUpper() == chanteurRecherche.ToUpper())
                .FirstOrDefaultAsync();
            if (chanteur == null)
            {
                ViewData["chanteurNonTrouve"] = "Cet artiste n'existe pas.";
                return RedirectToAction("Index", "Musique");
            }

            // Obtenir la liste des chansons du chanteur (Sera modifié à la migration 1.3)
            // La fouille est basée sur le titre de la chanson au lieu de son id...
            string query = "EXEC Musique.USP_ChanteurChansons @ChanteurID";
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter("@ChanteurID", chanteur.ChanteurId)
            };
            List<Chanson> chansons =
                await _context.Chansons.FromSqlRaw(query, sqlParameters.ToArray()).ToListAsync();

            return View(new ChanteurEtSesChansonsViewModel()
            {
                Chanteur = chanteur,
                Chansons = chansons
            });
        }

        [HttpPost]
        [Authorize]
        public async Task< IActionResult > AjouterFavori(int chanteurId)
        {
            // Manière standard de récupérer l'utilisateur
            IIdentity? identite = HttpContext.User.Identity;
            string pseudo = HttpContext.User.FindFirstValue(ClaimTypes.Name);
            Utilisateur? utilisateur = await _context.Utilisateurs.FirstOrDefaultAsync(x => x.Pseudo == pseudo);
            if (utilisateur != null)
            {
                // L'id du chanteur fourni existe-t-il ?
                Chanteur? chanteur = await _context.Chanteurs.FirstOrDefaultAsync(x => x.ChanteurId == chanteurId);
                if(chanteur != null)
                {
                    // Le chanteur est-il déjà dans les favoris de l'utilisateur ?
                    bool dejaFavori = await _context.ChanteurFavoris
                        .AnyAsync(x => x.ChanteurId == chanteur.ChanteurId && x.UtilisateurId == utilisateur.UtilisateurId);
                    if (!dejaFavori)
                    {
                        // Okay ! On construit une rangée dans la table de liaison entre utilisateur et chanteur
                        ChanteurFavori favori = new ChanteurFavori()
                        {
                            ChanteurId = chanteur.ChanteurId,
                            Chanteur = chanteur,
                            UtilisateurId = utilisateur.UtilisateurId,
                            Utilisateur = utilisateur
                        };
                        // On l'ajoute à la BD
                        _context.ChanteurFavoris.Add(favori);
                        await _context.SaveChangesAsync();
                    }
                }
            }
            // On retourne à la page où on était
            return RedirectToAction("Chanteurs", "Musique");
        }
    }
}