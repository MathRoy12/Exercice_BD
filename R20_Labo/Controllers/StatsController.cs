using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using R20_Labo.Data;
using R20_Labo.Models;
using R20_Labo.ViewModels;


namespace R20_Labo.Controllers
{
    public class StatsController : Controller
    {
        private readonly SussyKartContext _context;

        public StatsController(SussyKartContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        // Section 1 : Compléter ToutesParticipations (Obligatoire)
        public async Task<IActionResult> ToutesParticipations()
        {
            // Obtenir les participations grâce à une vue SQL mais ne garder que les 30 premières

            FiltreParticipationVM fpvm = new FiltreParticipationVM();
            fpvm.Participations = await _context.VwToutesLesParticipations.Take(30).ToListAsync();
            return View(fpvm);
        }

        public async Task<IActionResult> ToutesParticipationsFiltre(FiltreParticipationVM fpvm)
        {
            // Obtenir TOUTES les participations grâce à une vue SQL (et on va filtrer ensuite)
            IQueryable<VwToutesLesParticipation> query = _context.VwToutesLesParticipations.AsQueryable();

            if (fpvm.Pseudo != null)
            {
                query = query.Where(q => q.Pseudo == fpvm.Pseudo);
            }

            if (fpvm.Course != "Toutes")
            {
                query = query.Where(q => q.Nom == fpvm.Course);
            }

            // Trier soit par date, soit par chrono (fpvm.Ordre) de manière croissante ou décroissante (fpvm.TypeOrdre)
            if (fpvm.TypeOrdre == "ASC")
            {
                if (fpvm.Ordre == "Date")
                    query = query.OrderBy(q => q.DateParticipation);
                else
                    query = query.OrderBy(q => q.Chrono);
            }
            else
            {
                
                if (fpvm.Ordre == "Date")
                    query = query.OrderByDescending(q => q.DateParticipation);
                else
                    query = query.OrderByDescending(q => q.Chrono);
            }
            
            // Sauter des paquets de 30 participations si la page est supérieure à 1
            fpvm.Participations = await query.Skip((fpvm.Page - 1) * 30).ToListAsync();
            
            return View("ToutesParticipations", fpvm);
        }


    }
}

