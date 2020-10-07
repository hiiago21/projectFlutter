import 'package:desafiodaniel_frontend/Components/adicionarProjeto.dart';
import 'package:flutter/material.dart';
import 'adicionarDepto.dart';
import 'adicionarFuncionario.dart';
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
        '/AdicionarFuncionario': (context) => AdicionarFincionario(),
        '/AdicionarProjeto': (context) => AdicionarProjeto(),

      }
    );
  }
}
