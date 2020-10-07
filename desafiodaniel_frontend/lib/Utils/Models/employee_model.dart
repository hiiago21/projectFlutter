import 'package:flutter/material.dart';
import '../../Entities/employee.dart';
import '../Providers/employees_provider.dart';

class EmployeeModel extends ChangeNotifier {
  EmployeesProvider _provider = EmployeesProvider();

  Employee employee;
  List<Employee> employees;

  EmployeeModel.withProvider(this._provider);

  EmployeeModel();

  void update(String id) async {
    //department = await _provider.fetchDepartment(id);
    employees = await _provider.fetchAllEmployees();

    notifyListeners();
  }
}
