import 'package:flutter/material.dart';
import '../../Entities/department.dart';
import '../Providers/departments_provider.dart';

class DepartmentModel extends ChangeNotifier {
  DepartmentsProvider _provider = DepartmentsProvider();

  Department department;

  DepartmentModel.withProvider(this._provider);

  DepartmentModel();

  void update(String id) async {
    department = await _provider.fetchDepartment(id);
    notifyListeners();
  }
}
