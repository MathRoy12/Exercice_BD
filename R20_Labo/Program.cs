using Microsoft.EntityFrameworkCore;
using R20_Labo.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddDbContext<SussyKartContext>(
    options =>
    {
        options.UseSqlServer(builder.Configuration.GetConnectionString("SussyKart"));
        options.UseLazyLoadingProxies();
    });

    
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Jeu}/{action=Index}/{id?}");
});

app.MapRazorPages();

app.Run();
