using System;
using System.Collections.Generic;

namespace desafiodaniel_backend.Models
{
    public partial class Employee
    {
        public Employee()
        {
            ProjectsEmployees = new HashSet<ProjectEmployee>();
        }

        public decimal IdEmployee { get; set; }
        public string Name { get; set; }
        public string Sex { get; set; }
        public DateTime BirthDate { get; set; }
        public decimal Salary { get; set; }
        public virtual ICollection<ProjectEmployee> ProjectsEmployees { get; set; }
    }
}
