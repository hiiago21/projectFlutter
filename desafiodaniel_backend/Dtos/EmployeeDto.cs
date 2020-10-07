using System;
using System.ComponentModel.DataAnnotations;
using desafiodaniel_backend.Models;

namespace desafiodaniel_backend.Dtos
{
    public class EmployeeCreateDto
    {
        [Required]
        [StringLength(150)]
        public string Name{get;set;}

        [StringLength(1)]
        public string Sex {get;set;}

        [Required]
        [DataType(DataType.Date)]
        public DateTime BirthDate {get;set;}

        [Required]
        [Range(0, 99999.99)]
        public decimal Salary{get;set;}
    }
    
    public class EmployeeDto
    {   
        [Required]
        public decimal IdEmployee{get;set;}
        public string Name{get;set;}
        public string Sex {get;set;}
        public DateTime BirthDate {get;set;}
        public decimal Salary{get;set;}
    }

    
}