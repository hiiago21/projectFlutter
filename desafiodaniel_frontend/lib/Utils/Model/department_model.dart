import 'package:desafiodaniel_frontend/Utils/Providers/departments_provider.dart';

class DepartmentModel {
  DepartmentsProvider dp = new DepartmentsProvider();

  getAll() async {
    return await dp.fetchAllDepartments();
  }

  getById(id) async {
    return await dp.fetchDepartmentById(id);
  }
}
