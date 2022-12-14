using Domain_Driven_Design.Domain.Extensoes.Autenticacao;
using Domain_Driven_Design.Domain.Interfaces.Repositorios.Usuario;
using Domain_Driven_Design.Domain.Interfaces.Servicos.Autenticacao;
using Domain_Driven_Design.Domain.Interfaces.Servicos.Estudante;
using Domain_Driven_Design.Domain.Interfaces.Servicos.Usuario;
using Domain_Driven_Design.Infra;
using Domain_Driven_Design.Infra.Repositorios.Usuario;
using Microsoft.EntityFrameworkCore;
using Web.Controllers.Utils;
using Domain_Driven_Design.Infra.Servicos.Usuario;
using Domain_Driven_Design.Infra.Servicos.Estudante;
using Domain_Driven_Design.Infra.Servicos.Autenticacao;
using Domain_Driven_Design.Domain.Interfaces.Repositorios.Estudante;
using Domain_Driven_Design.Infra.Repositorios.Estudante;
using Domain_Driven_Design.Infra.Recursos.Validacao;
using BadgeSpace.Infra.Resources.Validation;

namespace Web
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddAutoMapper(typeof(Program));
            builder.Services.AddControllersWithViews();
            builder.Services.AddRazorPages();

            builder.Services.AddHttpContextAccessor();

            builder.Services.AddAuthenticationScheme(builder.Configuration);

            builder.Services.AddDbContext<ApplicationDbContext>(
                options =>
                    options.UseSqlServer(
                        builder.Configuration.GetConnectionString("DefaultConnection")!));

            builder.Services.AddScoped<IServicoUsuario, ServicoUsuario>();
            builder.Services.AddScoped<IServicoEstudante, ServicoEstudante>();

            builder.Services.AddScoped<IRepositorioUsuario, RepositorioUsuario>();
            builder.Services.AddScoped<IRepositorioEstudante, RepositorioEstudante>();

            builder.Services.AddScoped<IServicoAuthJWT, AuthJWT>();
            builder.Services.AddScoped<IServicoAuthCookies, AuthCookies>();

            builder.Services.AddScoped<ControllerUtils>();
            builder.Services.AddScoped<ValidationMethods>();

            //API
            builder.Services.AddEndpointsApiExplorer();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseMigrationsEndPoint();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();

            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();

            app.UseAuthorization();

            //API
            app.UseCors();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.MapRazorPages();

            app.Run();
        }
    }
}