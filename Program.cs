using Microsoft.EntityFrameworkCore;
using WaveApi;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);

// Configura los servicios para el controlador y DbContext
builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.Preserve;
    });

builder.Services.AddDbContext<WaveContext>(options =>
    options.UseMySql(builder.Configuration.GetConnectionString("DefaultConnection"),
    new MySqlServerVersion(new Version(8, 0, 25))));

builder.Services.AddDistributedMemoryCache();

// Configura la autenticación y sesiones
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/api/auth/login"; // Ruta para redirigir si no está autenticado
        options.LogoutPath = "/api/auth/logout"; // Ruta para cerrar sesión
        options.ExpireTimeSpan = TimeSpan.FromMinutes(30); // Tiempo de expiración de la sesión
        options.SlidingExpiration = true; // La sesión se extiende en cada solicitud
    });

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Tiempo de expiración de la sesión
    options.Cookie.HttpOnly = true; // Solo accesible desde el servidor
    options.Cookie.IsEssential = true; // Necesario para la funcionalidad del sitio
});

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        policy =>
        {
            policy.AllowAnyOrigin()
                .AllowAnyHeader()
                .AllowAnyMethod();
        });
});

builder.Services.AddHttpContextAccessor();

var app = builder.Build();

app.UseStaticFiles();

// Configura la autenticación y sesiones
app.UseSession();
app.UseAuthentication();
app.UseAuthorization();

app.UseCors("AllowAll");

app.UseHttpsRedirection();
app.UseRouting();
app.MapControllers();

app.Run();

