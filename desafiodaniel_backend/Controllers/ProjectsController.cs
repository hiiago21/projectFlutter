using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using desafiodaniel_backend;
using desafiodaniel_backend.Models;

using desafiodaniel_backend.Dtos;
using desafiodaniel_backend.Data;

namespace desafiodaniel_backend.Controllers
{
    [Route("Projects")]
    [ApiController]
    public class ProjectsController : ControllerBase
    {
        private readonly DesafioDanielContext _context;

        public ProjectsController(DesafioDanielContext context)
        {
            _context = context;
        }

        // GET: api/Projects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProjectDto>>> GetProjects()
        {       
            return await _context.Projects.OrderBy(p => p.NProject).Select(p => new ProjectDto{
                IdProject = p.NProject,
                IdDep = p.IdDep,
                Name = p.Name,
                Description = p.Description,
                StartDate = p.StartDate.Date,
                Finaldate = p.FinalDate.Date,
                Employees = new List<EmployeeDto>()
            }).ToListAsync();
        }

        // GET: api/Projects/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ProjectDto>> GetProjects(decimal id)
        {
            var projects = await _context.Projects
                                .Include(pe => pe.ProjectsEmployees)
                                .Where(p => p.NProject == id)
                                .Select(p => new ProjectDto{
                                    IdProject = p.NProject,                                    
                                    IdDep = p.IdDep,
                                    Name = p.Name, 
                                    Description = p.Description,
                                    StartDate = p.StartDate.Date,
                                    Finaldate = p.FinalDate.Date,
                                    //Pega todos os funcionarios de um projeto.
                                    Employees = from e in _context.Employees
                                                join pe in _context.ProjectsEmployees 
                                                on e.IdEmployee equals pe.IdEmployee
                                                where pe.NProject == id
                                                select new EmployeeDto{ 
                                                    IdEmployee = e.IdEmployee, 
                                                    Name = e.Name, 
                                                    Sex = e.Sex, 
                                                    BirthDate = e.BirthDate, 
                                                    Salary = e.Salary
                                                }
                                                
                            }).SingleOrDefaultAsync();

            if (projects == null)
            {
                return NotFound();
            }

            return projects;
        }

        // PUT: api/Projects/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProjects(decimal id, ProjectDto projectDto)
        {   
            Project project = new Project{
                NProject = projectDto.IdProject,
                IdDep = projectDto.IdDep,
                Name = projectDto.Name,
                Description = projectDto.Description,
                StartDate = projectDto.StartDate.Date,
                FinalDate = projectDto.Finaldate.Date,
            };

            if (id != project.NProject)
            {
                return BadRequest();
            }
            
            if (!ProjectsExists(id))
            {
                return NotFound();
            }

            //Verifica se existe um departamento com o código passado.
            if(!_context.Departments.Any(e => e.IdDep == project.IdDep))
            {
                return NotFound(new {
                    IdDep = project.IdDep, 
                    title = "Not Found", 
                    status = "404", 
                    message="department not found"
                });
            }

            _context.Entry(project).State = EntityState.Modified;
            
            try
            {
                await _context.SaveChangesAsync();
            }
            catch(DbUpdateConcurrencyException)
            {   
                if (!ProjectsExists(id))
                {
                    return NotFound();
                }
                
                throw;
            }

            return NoContent();
        }

        // POST: api/Projects
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<ProjectDto>> PostProjects(ProjectCreateDto projectsDto)
        {   
            Project project = new Project{
                IdDep = projectsDto.IdDep,
                Name = projectsDto.Name,
                Description = projectsDto.Description,
                StartDate = projectsDto.StartDate.Date,
                FinalDate = projectsDto.Finaldate.Date,
            };
            
            //Verifica se existe um departamento com o código passado.
            if(!_context.Departments.Any(e => e.IdDep == project.IdDep)){
                return NotFound(new {IdDep = project.IdDep, title = "Not Found", status = "404", message="department not found"});
            }

            try
            {
                _context.Projects.Add(project);
                await _context.SaveChangesAsync();
            }
            catch(DbUpdateException)
            {
                throw;
            }

            return CreatedAtAction("GetProjects", new { id = project.NProject }, new ProjectDto{
                IdProject = project.NProject,
                IdDep = project.IdDep,
                Name = project.Name,
                Description = project.Description,
                StartDate = project.StartDate.Date,
                Finaldate = project.FinalDate.Date
            });
        }

        [HttpPost("AddEmployee")]
        public async Task<ActionResult<ProjectDto>> AddEmployeesToProjects(ProjectEmployeeCreateDto projectEmployeeDto){
            
            ProjectEmployee projectEmployee = new ProjectEmployee{
                NProject = projectEmployeeDto.IdProject,
                IdEmployee = projectEmployeeDto.IdEmployee
            };

            //Verifica se existe um projeto com o ID passado
            if (!ProjectsExists(projectEmployee.NProject)){
                return NotFound(new {title = "Not Found", status = "404", message = "Project not found"});
            }

            //Verifica se existe um employee com o ID passado
            if(!_context.Employees.Any(e => e.IdEmployee == projectEmployee.IdEmployee)){
                return NotFound(new {title = "Not Found", status = "404", message = "Employee not found"});
            }

            //Verifica se esse funcionario já pertence a esse projeto
            if(_context.ProjectsEmployees.Any(pe => pe.IdEmployee == projectEmployee.IdEmployee && pe.NProject == projectEmployee.NProject)){
                return BadRequest(new {title = "Bad Request", status = "400", message = "Employee is already in the project"});
            }

            try
            {
                _context.ProjectsEmployees.Add(projectEmployee);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                throw;
            }

            ProjectDto project = await _context.Projects
                                .Include(pe => pe.ProjectsEmployees)
                                .Where(p => p.NProject == projectEmployee.NProject)
                                .Select(p => new ProjectDto{
                                    IdProject = p.NProject,                                    
                                    IdDep = p.IdDep,
                                    Name = p.Name, 
                                    Description = p.Description,
                                    StartDate = p.StartDate.Date,
                                    Finaldate = p.FinalDate.Date,
                                    //Pega todos os funcionarios de um projeto.
                                    Employees = from e in _context.Employees
                                                join pe in _context.ProjectsEmployees 
                                                on e.IdEmployee equals pe.IdEmployee
                                                where pe.NProject == projectEmployee.NProject
                                                select new EmployeeDto{ 
                                                    IdEmployee = e.IdEmployee, 
                                                    Name = e.Name, 
                                                    Sex = e.Sex, 
                                                    BirthDate = e.BirthDate, 
                                                    Salary = e.Salary
                                                }
                                                
                            }).SingleOrDefaultAsync();

            return CreatedAtAction(nameof(GetProjects), project);
        }
        // DELETE: api/Projects/5
        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteProjects(decimal id)
        {   
            var projects = await _context.Projects.FindAsync(id);
            if (projects == null)
            {
                return NotFound();
            }

            _context.Projects.Remove(projects);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        
        private bool ProjectsExists(decimal id)
        {
            return _context.Projects.Any(e => e.NProject == id);
        }
    }
}