using System;
using System.Collections.Generic;

namespace desafiodaniel_backend.Models
{
    public partial class ProjectEmployee
    {
        public decimal NProject { get; set; }
        public decimal IdEmployee { get; set; }

        public virtual Employee IdEmployeeNavigation { get; set; }
        public virtual Project NProjectNavigation { get; set; }
    }
}
