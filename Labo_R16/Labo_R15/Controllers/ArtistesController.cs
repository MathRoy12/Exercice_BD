using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Labo_R15.Data;
using Labo_R15.Models;
using Labo_R15.ViewModels;
using Microsoft.Data.SqlClient;

namespace Labo_R15.Controllers
{
    public class ArtistesController : Controller
    {
        private readonly S08EmployesContext _context;

        public ArtistesController(S08EmployesContext context)
        {
            _context = context;
        }

        // GET: Artistes
        public async Task<IActionResult> Index()
        {
            var s08EmployesContext = _context.Artistes.Include(a => a.Employe);
            return View(await s08EmployesContext.ToListAsync());
        }

        public async Task<IActionResult> Index2()
        {
            IEnumerable<VwListeArtiste> artistes = await _context.VwListeArtistes.ToListAsync();
            return View(artistes);
        }

        // GET: Artistes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Artistes == null)
            {
                return NotFound();
            }

            var artiste = await _context.Artistes
                .Include(a => a.Employe)
                .FirstOrDefaultAsync(m => m.ArtisteId == id);
            if (artiste == null)
            {
                return NotFound();
            }

            return View(artiste);
        }

        // GET: Artistes/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Artistes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Artiste,Employe")] ArtisteEmployeVM VM)
        {
            string query = "EXEC [Employes].[USP_AjouterArtiste] @Prenom, @Nom, @NoTel, @Courriel, @Specialite";

            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter { ParameterName = "@Prenom", Value = VM.Employe.Prenom },
                new SqlParameter { ParameterName = "@Nom", Value = VM.Employe.Nom },
                new SqlParameter { ParameterName = "@NoTel", Value = VM.Employe.NoTel },
                new SqlParameter { ParameterName = "@Courriel", Value = VM.Employe.Courriel },
                new SqlParameter { ParameterName = "@Specialite", Value = VM.Artiste.Specialite },
            };
            await _context.Database.ExecuteSqlRawAsync(query, parameters.ToArray());

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        // GET: Artistes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Artistes == null)
            {
                return NotFound();
            }

            var artiste = await _context.Artistes.FindAsync(id);
            if (artiste == null)
            {
                return NotFound();
            }

            ViewData["EmployeId"] = new SelectList(_context.Employes, "EmployeId", "EmployeId", artiste.EmployeId);
            return View(artiste);
        }

        // POST: Artistes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ArtisteId,Specialite,EmployeId")] Artiste artiste)
        {
            if (id != artiste.ArtisteId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(artiste);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ArtisteExists(artiste.ArtisteId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return RedirectToAction(nameof(Index));
            }

            ViewData["EmployeId"] = new SelectList(_context.Employes, "EmployeId", "EmployeId", artiste.EmployeId);
            return View(artiste);
        }

        // GET: Artistes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Artistes == null)
            {
                return NotFound();
            }

            var artiste = await _context.Artistes
                .Include(a => a.Employe)
                .FirstOrDefaultAsync(m => m.ArtisteId == id);
            if (artiste == null)
            {
                return NotFound();
            }

            return View(artiste);
        }

        // POST: Artistes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Artistes == null)
            {
                return Problem("Entity set 'S08EmployesContext.Artistes'  is null.");
            }

            var artiste = await _context.Artistes.FindAsync(id);
            if (artiste != null)
            {
                _context.Artistes.Remove(artiste);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ArtisteExists(int id)
        {
            return (_context.Artistes?.Any(e => e.ArtisteId == id)).GetValueOrDefault();
        }

        public async Task<IActionResult> Query1()
        {
            // Données des employés embauchés en 2023 (Utilisez VwListeArtiste)
            IEnumerable<VwListeArtiste> artistes =
                await _context.VwListeArtistes.Where(a => a.DateEmbauche.Year == 2023).ToListAsync();

            // N'oubliez pas d'envoyer artistes à la vue Razor ! 
            return View(artistes);
        }

        public async Task<IActionResult> Query2()
        {
            // Données des employés avec la spécialité "modélisation 3D" (Utilisez VwListeArtiste)

            IEnumerable<VwListeArtiste> artistes =
                await _context.VwListeArtistes.Where(a => a.Specialite == "modélisation 3D").ToListAsync();
            return View(artistes);
        }

        public async Task<IActionResult> Query3()
        {
            // Prénom et nom de tous les employés, classés par prénom ascendant
            // Concaténez prénoms et noms (avec une espace au centre) pour simplement obtenir une liste de strings.
            List<string> data = await _context.Employes.OrderBy(e => e.Prenom).Select(e => e.Prenom + " " + e.Nom).ToListAsync();
            return View(data);
        }

        public async Task<IActionResult> Query4()
        {
            // Toutes les données des employés artistes (Sans VwListeArtiste)
            List<ArtisteEmployeVM> data = await _context.Artistes.Select(a => new ArtisteEmployeVM {Artiste = a, Employe = a.Employe}).ToListAsync();
            return View(data);
        }
        
        public async Task<IActionResult> Query5()
        {
            // Combien d'artistes par spécialité ?
            List<NbSpecialiteViewModel> data = await _context.Artistes.GroupBy(a => a.Specialite).Select(a => new NbSpecialiteViewModel(a.Key, a.Count())).ToListAsync();
            return View(data);
        }
    }
}