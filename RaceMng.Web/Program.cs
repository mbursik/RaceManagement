﻿using Microsoft.AspNetCore.Localization.Routing;
using Microsoft.AspNetCore.Localization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using RaceMng.Database.Context;
using RaceMng.Services.Services;
using RaceMng.Web.Services;
using System.Globalization;
using Microsoft.Extensions.Options;
using System.Security.Cryptography.X509Certificates;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews().AddViewLocalization(Microsoft.AspNetCore.Mvc.Razor.LanguageViewLocationExpanderFormat.Suffix);

//builder.Services.AddSqlClient(options => options.UseSqlServer(builder.Configuration.GetConnectionString("RaceMngConnection")));
builder.Services.AddDbContext<RaceMngContext>(options =>
{
  options.UseSqlServer(builder.Configuration.GetConnectionString("RaceMngConnection"), x => x.UseDateOnlyTimeOnly());
#if DEBUG
  options.EnableSensitiveDataLogging();
#endif
});

builder.Services.AddLocalization(options => options.ResourcesPath = "Resources");
//builder.Services.AddMvc().AddViewLocalization();

var supportedCultures = new[] {
    new CultureInfo("en-US"),
    new CultureInfo("cs-CZ")
  };

builder.Services.Configure<RequestLocalizationOptions>(options =>
{
  options.DefaultRequestCulture = new RequestCulture("cs-CZ");
  options.SupportedCultures = supportedCultures;
  options.SupportedUICultures = supportedCultures;
  options.FallBackToParentCultures = true;
  options.FallBackToParentUICultures = true;
  options.RequestCultureProviders.Insert(0, new RouteDataRequestCultureProvider());
});

builder.Services.AddScoped<SexService>();
builder.Services.AddScoped<RaceService>();
builder.Services.AddScoped<CategoryService>();
builder.Services.AddScoped<CompetitorCategoryService>();
builder.Services.AddScoped<CompetitorService>();


// Add services to the container.
builder.Services.AddControllersWithViews().AddDataAnnotationsLocalization(); //.AddViewLocalization(Microsoft.AspNetCore.Mvc.Razor.LanguageViewLocationExpanderFormat.Suffix).AddDataAnnotationsLocalization();


var app = builder.Build();


using var scope = app.Services.CreateScope();
using var dbContext = scope.ServiceProvider.GetRequiredService<RaceMngContext>();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
  await dbContext.Database.MigrateAsync().ConfigureAwait(false);
  app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
}

app.UseRequestLocalization();

app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();


var localizationOptions = app.Services.GetRequiredService<IOptions<RequestLocalizationOptions>>().Value;
app.UseRequestLocalization(localizationOptions);

//app.UseEndpoints(endpoints =>
//{
//  endpoints.MapControllerRoute(
//      name: "default",
//      pattern: "{culture=cs-CZ}/{controller=Race}/{action=Index}/{id?}");
//});

app.MapControllerRoute(
    name: "default",
    pattern: "{culture=cs-CZ}/{controller=Race}/{action=Index}/{id?}");

app.Run();
