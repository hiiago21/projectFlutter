import 'package:desafiodaniel_frontend/Components/adicionarProjeto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Utils/Models/department_model.dart';
import '../Utils/Models/project_model.dart';
import '../Utils/Models/employee_model.dart';
import 'AdicionarFuncionario.dart';
import 'adicionarDepto.dart';
import 'adicionarProjeto.dart';
import 'AlterarDepto.dart';
import 'AlterarFuncionario.dart';
import 'home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DepartmentModel()),
        ChangeNotifierProvider(create: (context) => ProjectModel()),
        ChangeNotifierProvider(create: (context) => EmployeeModel()),
      ],
      child: ZionApp(),
    ),
  );
}

class ZionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
        initialRoute: '/home',
        routes: {
          '/home': (context) => Home(),
          '/AdicionarDepartamento': (context) => AdicionarDepartamento(),
          '/AlterarDepto': (context) => AlterarDepto(),
          '/AdicionarFuncionario': (context) => AdicionarFuncionario(),
          '/AlterarFuncionario': (context) => AlterarFuncionario(),
          '/AdicionarProjeto': (context) => AdicionarProjeto(),
        });
  }
}
