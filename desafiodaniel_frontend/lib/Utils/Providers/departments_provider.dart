import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import '../../Entities/department.dart';

class DepartmentsProvider {
  Future<List<Department>> fetchAllDepartments() async {
    try {
      //Client endPoint = Client();
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);

      // We can't use localhost inside an emulator.
      // Using localhost we get a SocketException.
      // We use the 10.0.2.2 ip to access the localhost inside the android VM.
      final response = await http.get('https://10.0.2.2:5001/Departments');
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        List<Department> departments =
            List<Department>.from(l.map((i) => Department.fromJson(i)));
        return departments;
      } else {
        throw Exception('Failed to load owners for code.');
      }
    } on SocketException {
      print("SocketException: connection with the external server not found.");
    } catch (e) {
      print("Deu ruim: $e");
    }
  }

  Future<Department> fetchDepartmentById(String id) async {
    try {
      //Client endPoint = Client();
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);

      // We can't use localhost inside an emulator.
      // Using localhost we get a SocketException.
      // We use the 10.0.2.2 ip to access the localhost inside the android VM.
      final response = await http.get('https://10.0.2.2:5001/Departments/$id');
      if (response.statusCode == 200) {
        return Department.fromJson(json.decode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('Department with id:$id not found.');
      } else {
        throw Exception(
            '${response.statusCode}: Failed to load owners for $id id.');
      }
    } on SocketException {
      print("SocketException: connection with the external server not found.");
    } catch (e) {
      print("Deu ruim: $e");
    }
  }

  Future<void> deleteDepartmentById(String id) async {
    try {
      //Client endPoint = Client();
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);

      // We can't use localhost inside an emulator.
      // Using localhost we get a SocketException.
      // We use the 10.0.2.2 ip to access the localhost inside the android VM.
      final response =
          await http.delete('https://10.0.2.2:5001/Departments/$id');

      if (response.statusCode == 204) {
        print("Delete Successful");
        return;
      } else if (response.statusCode == 404) {
        throw Exception('Department with id:$id not found.');
      } else {
        throw Exception(
            '${response.statusCode}: Failed to load owners for $id id.');
      }
    } on SocketException {
      print("SocketException: connection with the external server not found.");
    } catch (e) {
      print("Deu ruim: $e");
    }
  }

  Future<Department> postDepartment(Department department) async {
    try {
      //Client endPoint = Client();
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);

      var departmentBody = department.toPostJson();
      print(departmentBody.toString());
      // We can't use localhost inside an emulator.
      // Using localhost we get a SocketException.
      // We use the 10.0.2.2 ip to access the localhost inside the android VM.
      final response = await http.post('https://10.0.2.2:5001/Departments',
          body: departmentBody);
      if (response.statusCode == 201) {
        return Department.fromJson(json.decode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('Department not found.');
      } else {
        throw Exception(
            '${response.statusCode}: Failed to create a new department.');
      }
    } on SocketException {
      print("SocketException: connection with the external server not found.");
    } catch (e) {
      print("Deu ruim: $e");
    }
  }
}
