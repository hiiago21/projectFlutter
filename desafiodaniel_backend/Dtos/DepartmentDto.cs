using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace desafiodaniel_backend.Dtos{
    
    public class DepartmentCreateDto{

        [StringLength(50)]
        [Required]
        public string Name {get;set;}

        [StringLength(300)]
        public string Description {get;set;}

    }
    
    public class DepartmentDto{
        
        public decimal IdDep { get; set; }

        public string Name {get;set;}

        public string Description {get;set;}
        
        public virtual IEnumerable<ProjectDto> Projects {get; set;}
    }
}