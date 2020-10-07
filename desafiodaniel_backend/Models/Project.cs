using System;
using System.Collections.Generic;

namespace desafiodaniel_backend.Models
{
    public partial class Project
    {
        public Project()
        {
            ProjectsEmployees = new HashSet<ProjectEmployee>();
        }

        public decimal NProject { get; set; }
        public string Name { get; set; }
        public decimal IdDep { get; set; }
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime FinalDate { get; set; }

        public virtual Department IdDepNavigation { get; set; }
        public virtual ICollection<ProjectEmployee> ProjectsEmployees { get; set; }
    }
}
