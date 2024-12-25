using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace RaceMng.Database.Migrations
{
    /// <inheritdoc />
    public partial class Initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "rc");

            migrationBuilder.CreateTable(
                name: "Race",
                schema: "rc",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    IsValid = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Race", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sex",
                schema: "rc",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sex", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Category",
                schema: "rc",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RaceId = table.Column<int>(name: "Race_Id", type: "int", nullable: false),
                    Name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    BirthYearFrom = table.Column<int>(type: "int", nullable: false),
                    BirthYearTo = table.Column<int>(type: "int", nullable: false),
                    Distance = table.Column<int>(type: "int", nullable: false),
                    Position = table.Column<int>(type: "int", nullable: false),
                    SexId = table.Column<int>(name: "Sex_Id", type: "int", nullable: false),
                    IsValid = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Category", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RaceCategory",
                        column: x => x.RaceId,
                        principalSchema: "rc",
                        principalTable: "Race",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_SexCategory",
                        column: x => x.SexId,
                        principalSchema: "rc",
                        principalTable: "Sex",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Competitor",
                schema: "rc",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    LastName = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    BirthYear = table.Column<int>(type: "int", nullable: false),
                    Team = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    SexId = table.Column<int>(name: "Sex_Id", type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Competitor", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SexCompetitor",
                        column: x => x.SexId,
                        principalSchema: "rc",
                        principalTable: "Sex",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "CompetitorCategory",
                schema: "rc",
                columns: table => new
                {
                    CategoryId = table.Column<int>(name: "Category_Id", type: "int", nullable: false),
                    CompetitorId = table.Column<int>(name: "Competitor_Id", type: "int", nullable: false),
                    Number = table.Column<int>(type: "int", nullable: true),
                    Time = table.Column<TimeOnly>(type: "time", nullable: true),
                    Created = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CompetitorCategory", x => new { x.CategoryId, x.CompetitorId });
                    table.ForeignKey(
                        name: "FK_CompetitorCategory_Category_Category_Id",
                        column: x => x.CategoryId,
                        principalSchema: "rc",
                        principalTable: "Category",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CompetitorCategory_Competitor_Competitor_Id",
                        column: x => x.CompetitorId,
                        principalSchema: "rc",
                        principalTable: "Competitor",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                schema: "rc",
                table: "Sex",
                columns: new[] { "Id", "Name" },
                values: new object[,]
                {
                    { 1, "Muž" },
                    { 2, "Žena" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Category_Race_Id",
                schema: "rc",
                table: "Category",
                column: "Race_Id");

            migrationBuilder.CreateIndex(
                name: "IX_Category_Sex_Id",
                schema: "rc",
                table: "Category",
                column: "Sex_Id");

            migrationBuilder.CreateIndex(
                name: "IX_Competitor_Sex_Id",
                schema: "rc",
                table: "Competitor",
                column: "Sex_Id");

            migrationBuilder.CreateIndex(
                name: "IX_CompetitorCategory_Competitor_Id",
                schema: "rc",
                table: "CompetitorCategory",
                column: "Competitor_Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CompetitorCategory",
                schema: "rc");

            migrationBuilder.DropTable(
                name: "Category",
                schema: "rc");

            migrationBuilder.DropTable(
                name: "Competitor",
                schema: "rc");

            migrationBuilder.DropTable(
                name: "Race",
                schema: "rc");

            migrationBuilder.DropTable(
                name: "Sex",
                schema: "rc");
        }
    }
}
