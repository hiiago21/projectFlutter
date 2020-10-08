import 'package:desafiodaniel_frontend/Utils/Providers/departments_provider.dart';
import '../../Entities/department.dart';

class DepartmentModel {
  DepartmentsProvider dp = new DepartmentsProvider();

  getAll() async {
    return await dp.fetchAllDepartments();
  }

  getById(id) async {
    return await dp.fetchDepartmentById(id);
  }

  delete(id) async {
    return await dp.deleteDepartmentById(id.toString());
  }

  post(Department dep) async {
    return await dp.postDepartment(dep);
  }
}
