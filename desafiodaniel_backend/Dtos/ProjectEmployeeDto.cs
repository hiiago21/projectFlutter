using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace desafiodaniel_backend.Dtos
{
    public partial class ProjectEmployeeCreateDto
    {   
        [Required]
        public decimal IdProject { get; set; }
        [Required]
        public decimal IdEmployee { get; set; }
    }

    public partial class ProjectEmployeeDto
    {   
        public decimal IdProject { get; set; }
        public decimal IdEmployee { get; set; }

    }
}