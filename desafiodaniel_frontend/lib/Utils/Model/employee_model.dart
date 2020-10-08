import 'package:desafiodaniel_frontend/Utils/Providers/employees_provider.dart';

class EmployeeModel {
  EmployeesProvider dp = new EmployeesProvider();

  getAll() async {
    return await dp.fetchAllEmployees();
  }

  getById(id) async {
    return await dp.fetchAllEmployee(id);
  }
}
