import 'package:flutter/material.dart';
import 'AdicionarFuncionario.dart';
import 'AdicionarDepto.dart';
import 'AdicionarProjeto.dart';
import 'AlterarDepto.dart';
import 'AlterarFuncionario.dart';
import 'home.dart';

void main() {
  runApp(ZionApp());
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
