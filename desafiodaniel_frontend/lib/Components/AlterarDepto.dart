import 'package:flutter/material.dart';

import '../Entities/department.dart';
import '../Entities/department.dart';

class AlterarDepto extends StatefulWidget {
  final Department dep;
  AlterarDepto({this.dep}) : super();
  @override
  _AlterarDeptoState createState() => _AlterarDeptoState();
  static const routeName = '/AlterarDepto';
}

class _AlterarDeptoState extends State<AlterarDepto> {
  void _adicionarDepartamento() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Alterar Departamento'),
          centerTitle: true,
        ),
        body: Padding(
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
                              labelText: widget.dep.name,
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
                              labelText: widget.dep.description,
                              labelStyle: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: "Check",
                        onPressed: _adicionarDepartamento,
                        child: Icon(
                          Icons.cancel,
                          size: 42.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      FloatingActionButton(
                        heroTag: "Cancel",
                        onPressed: _adicionarDepartamento,
                        child: Icon(
                          Icons.check_circle,
                          size: 42.0,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            )));
  }
}
