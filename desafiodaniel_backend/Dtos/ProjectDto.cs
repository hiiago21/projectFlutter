using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace desafiodaniel_backend.Dtos
{
    public class ProjectCreateDto
    {
        [Required]
        [StringLength(150)]
        public string Name { get; set; }
        [Required]
        public decimal IdDep { get; set; }
        [StringLength(300)]
        public string Description { get; set; }
        [Required]
        [DataType(DataType.Date)]
        public DateTime StartDate { get; set; }
        [Required]
        [DataType(DataType.Date)]
        public DateTime Finaldate { get; set; }
    }
    
    public class ProjectDto
    {
        public decimal IdProject { get; set; }
        public string Name { get; set; }
        public decimal IdDep { get; set; }
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime Finaldate { get; set; }
        public virtual IEnumerable<EmployeeDto> Employees { get; set; }
    }
}