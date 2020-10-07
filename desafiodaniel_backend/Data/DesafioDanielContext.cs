using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using desafiodaniel_backend.Models;

namespace desafiodaniel_backend.Data
{
    public partial class DesafioDanielContext : DbContext
    {
        public DesafioDanielContext()
        {
        }

        public DesafioDanielContext(DbContextOptions<DesafioDanielContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<ProjectEmployee> ProjectsEmployees { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Department>(entity =>
            {
                entity.HasKey(e => e.IdDep)
                    .HasName("PK_DEP");

                entity.ToTable("DEPARTMENTS");

                entity.Property(e => e.IdDep)
                    .HasColumnName("id_dep")
                    .HasColumnType("numeric(6, 0)")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Description)
                    .HasColumnName("description")
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.HasKey(e => e.IdEmployee)
                    .HasName("PK_EMP");

                entity.ToTable("EMPLOYEES");

                entity.Property(e => e.IdEmployee)
                    .HasColumnName("id_employee")
                    .HasColumnType("numeric(6, 0)")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.BirthDate)
                    .HasColumnName("birth_date")
                    .HasColumnType("date");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.Salary)
                    .HasColumnName("salary")
                    .HasColumnType("numeric(7, 2)");

                entity.Property(e => e.Sex)
                    .HasColumnName("sex")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();
            });

            modelBuilder.Entity<Project>(entity =>
            {
                entity.HasKey(e => e.NProject)
                    .HasName("PK_PROJ");

                entity.ToTable("PROJECTS");

                entity.Property(e => e.NProject)
                    .HasColumnName("n_project")
                    .HasColumnType("numeric(6, 0)")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasColumnName("description")
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.Property(e => e.FinalDate)
                    .HasColumnName("final_date")
                    .HasColumnType("date");

                entity.Property(e => e.IdDep)
                    .HasColumnName("id_dep")
                    .HasColumnType("numeric(6, 0)");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.StartDate)
                    .HasColumnName("start_date")
                    .HasColumnType("date");

                entity.HasOne(d => d.IdDepNavigation)
                    .WithMany(p => p.Projects)
                    .HasForeignKey(d => d.IdDep)
                    .HasConstraintName("FK_PROJ_DEP");
            });

            modelBuilder.Entity<ProjectEmployee>(entity =>
            {
                entity.HasKey(e => new { e.NProject, e.IdEmployee })
                    .HasName("PK_PROj_EMP");

                entity.ToTable("PROJECTS_EMPLOYEES");

                entity.Property(e => e.NProject)
                    .HasColumnName("n_project")
                    .HasColumnType("numeric(6, 0)");

                entity.Property(e => e.IdEmployee)
                    .HasColumnName("id_employee")
                    .HasColumnType("numeric(6, 0)");

                entity.HasOne(d => d.IdEmployeeNavigation)
                    .WithMany(p => p.ProjectsEmployees)
                    .HasForeignKey(d => d.IdEmployee)
                    .HasConstraintName("FK_PE_EMP");

                entity.HasOne(d => d.NProjectNavigation)
                    .WithMany(p => p.ProjectsEmployees)
                    .HasForeignKey(d => d.NProject)
                    .HasConstraintName("FK_PE_PROJ");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
