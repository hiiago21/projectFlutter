import 'package:flutter/material.dart';
import '../../Entities/department.dart';
import '../Providers/departments_provider.dart';

class DepartmentModel extends ChangeNotifier {
  DepartmentsProvider _provider = DepartmentsProvider();

  Department department;
  List<Department> departments;
  DepartmentModel.withProvider(this._provider);

  DepartmentModel();

  void getAll() async {
    departments = await _provider.fetchAllDepartments();
    notifyListeners();
  }

  void getById(String id) async {
    department = await _provider.fetchDepartmentById(id);
    notifyListeners();
  }
}
