﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using RaceMng.Database.Classes;

namespace RaceMng.Database.Models.Bos;

[Table(nameof(Category), Schema = Constants.SchemaRc)]
public partial class Category
{
    [Key]
    public int Id { get; set; }

    [Column("Race_Id")]
    public int RaceId { get; set; }

    [Required]
    [StringLength(100)]
    [Unicode(false)]
    public string Name { get; set; }

    public int BirthYearFrom { get; set; }

    public int BirthYearTo { get; set; }

    public int Distance { get; set; }

    public int Position { get; set; }

    [Column("Sex_Id")]
    public int SexId { get; set; }

    public bool IsValid { get; set; }

    [ForeignKey("RaceId")]
    [InverseProperty("Categories")]
    public virtual Race Race { get; set; }

    [ForeignKey("SexId")]
    [InverseProperty("Categories")]
    public virtual Sex Sex { get; set; }
}