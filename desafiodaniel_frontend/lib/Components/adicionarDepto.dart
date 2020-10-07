import 'package:flutter/material.dart';

class AdicionarDepartamento extends StatefulWidget {
  @override
  _AdicionarDepartamentoState createState() => _AdicionarDepartamentoState();
  static const routeName = '/AdicionarDepartamento';
}

class _AdicionarDepartamentoState extends State<AdicionarDepartamento> {

  void _adicionarDepartamento(){

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Criar Departamento'),
          centerTitle: true,
        ),
        body:
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Nome do departamento',
                              labelStyle: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Descrição do departamento',
                              labelStyle: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: _adicionarDepartamento,
                      child: const Text('Adicionar', style: TextStyle(fontSize: 20)),
                    ),
                  )
                ],
              ),
            )));
  }
}
