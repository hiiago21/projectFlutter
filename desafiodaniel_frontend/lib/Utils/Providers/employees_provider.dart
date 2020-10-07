import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import '../../Entities/employee.dart';

class EmployeesProvider {
  Future<List<Employee>> fetchAllEmployees() async {
    try {
      //Client endPoint = Client();
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);

      // We can't use localhost inside an emulator.
      // Using localhost we get a SocketException.
      // We use the 10.0.2.2 ip to access the localhost inside the android VM.
      final response = await http.get('http://10.0.2.2:5000/Employees');
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        List<Employee> employees =
            List<Employee>.from(l.map((i) => Employee.fromJson(i)));
        return employees;
      } else {
        throw Exception('Failed to load owners for code.');
      }
    } on SocketException {
      print("SocketException: connection with the external server not found.");
      throw Exception('Failed to load owners for code.');
    } catch (e) {
      print("Deu ruim: $e");
      throw Exception('Deu ruim');
    }
  }

  Future<Employee> fetchEmployeeById(String id) async {
    try {
      //Client endPoint = Client();
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);

      // We can't use localhost inside an emulator.
      // Using localhost we get a SocketException.
      // We use the 10.0.2.2 ip to access the localhost inside the android VM.
      final response = await http.get('http://10.0.2.2:5000/Employees/$id');
      if (response.statusCode == 200) {
        return Employee.fromJson(json.decode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('Employee with id:$id not found.');
      } else {
        throw Exception(
            '${response.statusCode}: Failed to load owners for $id id.');
      }
    } on SocketException {
      print("SocketException: connection with the external server not found.");
      throw Exception('Failed to load owners for code.');
    } catch (e) {
      print("Deu ruim: $e");
      throw Exception('Failed to load owners for code.');
    }
  }
}
