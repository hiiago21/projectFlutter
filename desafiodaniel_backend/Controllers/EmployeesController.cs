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
    [Route("Employees")]
    [ApiController]
    public class EmployeesController : ControllerBase
    {
        private readonly DesafioDanielContext _context;

        public EmployeesController(DesafioDanielContext context)
        {
            _context = context;
        }

        // GET: api/Employees
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EmployeeDto>>> GetEmployees()
        {
            return await _context.Employees.OrderBy(e => e.IdEmployee).Select(e => new EmployeeDto{
                IdEmployee = e.IdEmployee,
                Name = e.Name,
                BirthDate = e.BirthDate.Date,
                Salary = e.Salary,
                Sex = e.Sex
            }).ToListAsync();
        }

        // GET: api/Employees/5
        [HttpGet("{id}")]
        public async Task<ActionResult<EmployeeDto>> GetEmployees(decimal id)
        {
            var employees = await _context.Employees.Select(e => new EmployeeDto{
                IdEmployee = e.IdEmployee,
                Name = e.Name,
                BirthDate = e.BirthDate.Date,
                Salary = e.Salary,
                Sex = e.Sex
            }).Where(e => e.IdEmployee == id).SingleOrDefaultAsync();

            if (employees == null)
            {
                return NotFound();
            }

            return employees;
        }

        // PUT: api/Employees/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEmployees(decimal id, EmployeeDto employeeDto)
        {   
            Employee employee = new Employee{
                IdEmployee = employeeDto.IdEmployee,
                Name = employeeDto.Name,
                BirthDate = employeeDto.BirthDate.Date,
                Salary = employeeDto.Salary,
                Sex = employeeDto.Sex
            };

            if (id != employee.IdEmployee)
            {
                return BadRequest();
            }

            if (!EmployeesExists(id))
            {
                return NotFound();
            }

            _context.Entry(employee).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EmployeesExists(id))
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

        // POST: api/Employees
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<EmployeeDto>> PostEmployees(EmployeeCreateDto employeeDto)
        {    
            Employee employee = new Employee{
                Name = employeeDto.Name,
                BirthDate = employeeDto.BirthDate.Date,
                Salary = employeeDto.Salary,
                Sex = employeeDto.Sex
            };
            
            try
            {
                _context.Employees.Add(employee);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                throw;
            }

            return CreatedAtAction("GetEmployees", new { id = employee.IdEmployee }, new EmployeeDto{
                IdEmployee = employee.IdEmployee,
                Name = employee.Name,
                BirthDate = employee.BirthDate.Date,
                Salary = employee.Salary,
                Sex = employee.Sex
            });
        }

        // DELETE: api/Employees/5
        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteEmployees(decimal id)
        {
            var employees = await _context.Employees.FindAsync(id);
            if (employees == null)
            {
                return NotFound();
            }

            try
            {
                _context.Employees.Remove(employees);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                throw;
            }

            return NoContent();
        }

        private bool EmployeesExists(decimal id)
        {
            return _context.Employees.Any(e => e.IdEmployee == id);
        }

    }
}
