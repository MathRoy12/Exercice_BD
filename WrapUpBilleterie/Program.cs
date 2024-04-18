using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using WrapUpBilleterie.Data;

namespace WrapUpBilleterie
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddRazorPages();

            // Add DbContext
            builder.Services.AddDbContext<R22_BilleterieContext>(
                options => {
                    options.UseSqlServer(builder.Configuration.GetConnectionString("R22_Billeterie"));
                    options.UseLazyLoadingProxies();
                });
            
            // Add Authentication
            builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(options =>
            {
                options.LoginPath = "/Clients/Connexion";
                options.LogoutPath = "/Clients/Deconnexion";
            });

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints => {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Clients}/{action=Index}/{id?}"
                    );
            });

            app.MapRazorPages();

            app.Run();
        }
    }
}