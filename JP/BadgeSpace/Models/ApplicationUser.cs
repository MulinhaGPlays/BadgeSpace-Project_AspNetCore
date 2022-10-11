﻿using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace BadgeSpace.Models
{
    public class ApplicationUser : IdentityUser
    {
        [StringLength(14)]
        public string CPF_CNPJ { get; set; }
        public bool Empresa { get; set; }
    }
}