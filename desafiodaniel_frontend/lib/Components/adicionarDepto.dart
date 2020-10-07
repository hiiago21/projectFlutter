import 'package:flutter/material.dart';

class AdicionarDepartamento extends StatefulWidget {
  @override
  _AdicionarDepartamentoState createState() => _AdicionarDepartamentoState();
}

class _AdicionarDepartamentoState extends State<AdicionarDepartamento> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: new EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child:
              Text("Criar Departamento", style: TextStyle(fontSize: 25.0)),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nome do departamento',
                        labelStyle: TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Descrição do departamento',
                        labelStyle: TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
