using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using System.Security.Principal;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using WrapUpBilleterie.Data;
using WrapUpBilleterie.ViewModels;
using WrapUpBilleterie.Models;

namespace WrapUpBilleterie.Controllers;

public class ClientsController : Controller
{
    readonly R22_BilleterieContext _context;

    public ClientsController(R22_BilleterieContext context)
    {
        _context = context;
    }

    public async Task<IActionResult> Index()
    {
        ViewData["PrenomNom"] = "visiteur";
        IIdentity? identite = HttpContext.User.Identity;
        if (identite != null && identite.IsAuthenticated)
        {
            string courriel = HttpContext.User.FindFirstValue(ClaimTypes.Name);
            Client? client = await _context.Clients.FirstOrDefaultAsync(x => x.Courriel == courriel);
            if (client != null)
            {
                // Pour dire "Bonjour X" sur l'index
                ViewData["PrenomNom"] = client.Prenom + " " + client.Nom;
            }
        }

        return View();
    }

    // Inscription en requête get
    public IActionResult Inscription()
    {
        return View();
    }

    // Inscription en requête post
    [HttpPost]
    public async Task<IActionResult> Inscription(InscriptionViewModel ivm)
    {
        // A COMPLETER LORS DE L'ETAPE 1
        bool existeDeja = await _context.Clients.AnyAsync(x => x.Courriel == ivm.Courriel);
        if (existeDeja)
        {
            ModelState.AddModelError("Courriel", "Ce courriel est déja pris.");
            return View(ivm);
        }

        string query = "EXEC Clients.USP_CreerClient @Nom, @Prenom, @Courriel, @MotDePasse";
        List<SqlParameter> parameters = new List<SqlParameter>
        {
            new() { ParameterName = "Nom", Value = ivm.Nom },
            new() { ParameterName = "Courriel", Value = ivm.Courriel },
            new() { ParameterName = "Prenom", Value = ivm.Prenom },
            new() { ParameterName = "MotDePasse", Value = ivm.MotDePasse }
        };
        try
        {
            await _context.Database.ExecuteSqlRawAsync(query, parameters.ToArray());
        }
        catch (Exception)
        {
            ModelState.AddModelError("", "Ya une erreur dude");
            return View(ivm);
        }

        return RedirectToAction("Index", "Spectacles");
    }

    public IActionResult Connexion()
    {
        return View();
    }

    [HttpPost]
    public async Task<IActionResult> Connexion(ConnexionViewModel cvm)
    {
        // A COMPLETER LORS DE L'ÉTAPE 1
        string query = "EXEC Clients.USP_AuthClient @Courriel, @MotDePasse";
        List<SqlParameter> parameters = new List<SqlParameter>
        {
            new() { ParameterName = "MotDePasse", Value = cvm.MotDePasse },
            new() { ParameterName = "Courriel", Value = cvm.Courriel }
        };
        Client? client = (await _context.Clients.FromSqlRaw(query, parameters.ToArray()).ToListAsync())
            .FirstOrDefault();
        if (client == null)
        {
            ModelState.AddModelError("", "T'existe pas dude");
            return View(cvm);
        }

        List<Claim> claims = new List<Claim>
        {
            new(ClaimTypes.NameIdentifier, client.ClientId.ToString()),
            new(ClaimTypes.Name, client.Courriel)
        };

        ClaimsIdentity identitie = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
        ClaimsPrincipal principal = new ClaimsPrincipal(identitie);
        await HttpContext.SignInAsync(principal);

        return RedirectToAction("Index", "Spectacles");
    }

    [HttpGet]
    public async Task<IActionResult> Deconnexion()
    {
        // Cette ligne mange le cookie 🍪 Slurp
        await HttpContext.SignOutAsync();
        return RedirectToAction("Index", "Spectacles");
    }

    // GET: Spectacles/DetailsAncien5
    [Authorize]
    public async Task<IActionResult> Profil()
    {
        IIdentity? identite = HttpContext.User.Identity;
        if (identite != null && identite.IsAuthenticated)
        {
            string courriel = HttpContext.User.FindFirstValue(ClaimTypes.Name);
            Client? client = await _context.Clients.FirstOrDefaultAsync(x => x.Courriel == courriel);
            if (client != null)
                return View(client);
        }
        return RedirectToAction("Index", "Spectacles");
    }
}