using System;
using System.Collections.Generic;

namespace desafiodaniel_backend.Models
{
    public partial class Department
    {
        public Department()
        {
            Projects = new HashSet<Project>();
        }

        public decimal IdDep { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public virtual ICollection<Project> Projects { get; set; }
    }
}
