using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using desafiodaniel_backend;
using desafiodaniel_backend.Models;

using desafiodaniel_backend.Data;
using desafiodaniel_backend.Dtos;

namespace desafiodaniel_backend.Controllers
{
    [Route("Departments")]
    [ApiController]
    public class DepartmentsController : ControllerBase
    {
        private readonly DesafioDanielContext _context;

        public DepartmentsController(DesafioDanielContext context)
        {
            _context = context;
        }

        // GET: api/Departments
        [HttpGet]
        public async Task<ActionResult<IEnumerable<DepartmentDto>>> GetDepartments()
        {   
            return await _context.Departments.OrderBy(d => d.IdDep).Select(d => new DepartmentDto {
                IdDep = d.IdDep,                                    
                Name = d.Name,
                Description = d.Description,
                Projects = new List<ProjectDto>()
            }).ToListAsync();
        }

        // GET: api/Departments/5
        [HttpGet("{id}")]
        public async Task<ActionResult<DepartmentDto>> GetDepartments(decimal id)
        {
            var department = await _context.Departments
                                .Include(p => p.Projects)
                                .Where(d => d.IdDep == id)
                                .Select(d => new DepartmentDto{
                                    IdDep = d.IdDep,                                    
                                    Name = d.Name,
                                    Description = d.Description,
                                    Projects = d.Projects.Select(p => new ProjectDto{
                                        IdProject = p.NProject,
                                        Name = p.Name,
                                        IdDep = p.IdDep,
                                        Description = p.Description,
                                        StartDate = p.StartDate,
                                        Finaldate = p.FinalDate,
                                        Employees = new List<EmployeeDto>()
                                    }) 
                                }).SingleOrDefaultAsync();

            if (department == null)
            {
                return NotFound();
            }
            
            return department;
        }

        // PUT: api/Departments/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDepartments(decimal id, DepartmentDto departmentDto)
        {   
            Department departments = new Department{
                IdDep = departmentDto.IdDep,
                Name = departmentDto.Name,
                Description = departmentDto.Description
            };

            if (id != departments.IdDep)
            {
                return BadRequest();
            }

            if (!DepartmentsExists(id))
            {
                return NotFound();
            }

            _context.Entry(departments).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DepartmentsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Departments
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<DepartmentDto>> PostDepartments(DepartmentCreateDto departmentDto)
        {
            Department departments = new Department{
                Name = departmentDto.Name,
                Description = departmentDto.Description,
            };

            try
            {
                _context.Departments.Add(departments);
                await _context.SaveChangesAsync();
            }
            catch(DbUpdateException)
            {
                throw;
            }

            return CreatedAtAction("GetDepartments", new { id = departments.IdDep }, new DepartmentDto{ 
                IdDep = departments.IdDep,
                Name = departments.Name,
                Description = departments.Description,
                Projects = new List<ProjectDto>()
            });
        }

        // DELETE: /Departments/5
        //TODO: Tenho duvida de se é necessario usar o DTO ou não, e também se deveria retornar o objeto removido.
        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteDepartments(decimal id)
        {   
            var department = await _context.Departments.FindAsync(id);
            if (department == null)
            {
                return NotFound();
            }

            try
            {
                _context.Departments.Remove(department);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                throw;
            }

            return NoContent();
        }

        private bool DepartmentsExists(decimal id)
        {
            return _context.Departments.Any(e => e.IdDep == id);
        }
    }
}
