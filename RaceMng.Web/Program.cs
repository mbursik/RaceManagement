using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using RaceMng.Database.Context;
using RaceMng.Services.Services;
using RaceMng.Web.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
//builder.Services.AddSqlClient(options => options.UseSqlServer(builder.Configuration.GetConnectionString("RaceMngConnection")));
builder.Services.AddDbContext<RaceMngContext>(options =>
{
  options.UseSqlServer(builder.Configuration.GetConnectionString("RaceMngConnection"), x => x.UseDateOnlyTimeOnly());
#if DEBUG
  options.EnableSensitiveDataLogging();
#endif
});
builder.Services.AddScoped<SexService>();
builder.Services.AddScoped<RaceService>();
builder.Services.AddScoped<CategoryService>();
builder.Services.AddScoped<CompetitorCategoryService>();
builder.Services.AddScoped<CompetitorService>();
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


app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
