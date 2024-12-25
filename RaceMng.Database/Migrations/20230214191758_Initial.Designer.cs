﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using RaceMng.Database.Context;

#nullable disable

namespace RaceMng.Database.Migrations
{
    [DbContext(typeof(RaceMngContext))]
    [Migration("20230214191758_Initial")]
    partial class Initial
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .UseCollation("Czech_CI_AS")
                .HasAnnotation("ProductVersion", "7.0.2")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("RaceMng.Database.Models.Category", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("BirthYearFrom")
                        .HasColumnType("int");

                    b.Property<int>("BirthYearTo")
                        .HasColumnType("int");

                    b.Property<int>("Distance")
                        .HasColumnType("int");

                    b.Property<bool>("IsValid")
                        .HasColumnType("bit");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)");

                    b.Property<int>("Position")
                        .HasColumnType("int");

                    b.Property<int>("RaceId")
                        .HasColumnType("int")
                        .HasColumnName("Race_Id");

                    b.Property<int>("SexId")
                        .HasColumnType("int")
                        .HasColumnName("Sex_Id");

                    b.HasKey("Id");

                    b.HasIndex("RaceId");

                    b.HasIndex("SexId");

                    b.ToTable("Category", "rc");
                });

            modelBuilder.Entity("RaceMng.Database.Models.Competitor", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("BirthYear")
                        .HasColumnType("int");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<int>("SexId")
                        .HasColumnType("int")
                        .HasColumnName("Sex_Id");

                    b.Property<string>("Team")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.HasKey("Id");

                    b.HasIndex("SexId");

                    b.ToTable("Competitor", "rc");
                });

            modelBuilder.Entity("RaceMng.Database.Models.CompetitorCategory", b =>
                {
                    b.Property<int>("CategoryId")
                        .HasColumnType("int")
                        .HasColumnName("Category_Id");

                    b.Property<int>("CompetitorId")
                        .HasColumnType("int")
                        .HasColumnName("Competitor_Id");

                    b.Property<DateTime>("Created")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<int?>("Number")
                        .HasColumnType("int");

                    b.Property<TimeOnly?>("Time")
                        .HasColumnType("time");

                    b.HasKey("CategoryId", "CompetitorId");

                    b.HasIndex("CompetitorId");

                    b.ToTable("CompetitorCategory", "rc");
                });

            modelBuilder.Entity("RaceMng.Database.Models.Race", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateOnly>("Date")
                        .HasColumnType("date");

                    b.Property<bool>("IsValid")
                        .HasColumnType("bit");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)");

                    b.HasKey("Id");

                    b.ToTable("Race", "rc");
                });

            modelBuilder.Entity("RaceMng.Database.Models.Sex", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(10)
                        .IsUnicode(false)
                        .HasColumnType("varchar(10)");

                    b.HasKey("Id");

                    b.ToTable("Sex", "rc");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Name = "Muž"
                        },
                        new
                        {
                            Id = 2,
                            Name = "Žena"
                        });
                });

            modelBuilder.Entity("RaceMng.Database.Models.Category", b =>
                {
                    b.HasOne("RaceMng.Database.Models.Race", "Race")
                        .WithMany("Categories")
                        .HasForeignKey("RaceId")
                        .IsRequired()
                        .HasConstraintName("FK_RaceCategory");

                    b.HasOne("RaceMng.Database.Models.Sex", "Sex")
                        .WithMany("Categories")
                        .HasForeignKey("SexId")
                        .IsRequired()
                        .HasConstraintName("FK_SexCategory");

                    b.Navigation("Race");

                    b.Navigation("Sex");
                });

            modelBuilder.Entity("RaceMng.Database.Models.Competitor", b =>
                {
                    b.HasOne("RaceMng.Database.Models.Sex", "Sex")
                        .WithMany("Competitors")
                        .HasForeignKey("SexId")
                        .IsRequired()
                        .HasConstraintName("FK_SexCompetitor");

                    b.Navigation("Sex");
                });

            modelBuilder.Entity("RaceMng.Database.Models.CompetitorCategory", b =>
                {
                    b.HasOne("RaceMng.Database.Models.Category", "Category")
                        .WithMany()
                        .HasForeignKey("CategoryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("RaceMng.Database.Models.Competitor", "Competitor")
                        .WithMany()
                        .HasForeignKey("CompetitorId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Category");

                    b.Navigation("Competitor");
                });

            modelBuilder.Entity("RaceMng.Database.Models.Race", b =>
                {
                    b.Navigation("Categories");
                });

            modelBuilder.Entity("RaceMng.Database.Models.Sex", b =>
                {
                    b.Navigation("Categories");

                    b.Navigation("Competitors");
                });
#pragma warning restore 612, 618
        }
    }
}
