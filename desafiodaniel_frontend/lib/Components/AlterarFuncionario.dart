import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Entities/employee.dart';

class AlterarFuncionario extends StatefulWidget {
  final Employee emplo;

  AlterarFuncionario({this.emplo}) : super();

  @override
  _AlterarFuncionarioState createState() => _AlterarFuncionarioState();
  static const routeName = '/AlterarFuncionario';
}

class _AlterarFuncionarioState extends State<AlterarFuncionario> {
  DateTime _selectDate;

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime(2003),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }

      setState(() {
        _selectDate = value;
      });
    });
  }

  void _alterarFuncionario() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Alterar Funcionario'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 0),
        child: Container(
          padding: new EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: widget.emplo.name,
                          labelStyle: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: widget.emplo.salary.toString(),
                        labelStyle: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectDate == null
                            ? 'Data de Nascimento'
                            : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectDate)}',
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Selecionar Data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _showDatePicker,
                    )
                  ],
                ),
              ),
              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  FloatingActionButton(
                    heroTag: "BCancel",
                    onPressed: () {},
                    tooltip: 'Cancel',
                    child: Icon(Icons.cancel),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  FloatingActionButton(
                    heroTag: "BCheck",
                    onPressed: () {},
                    tooltip: 'Check',
                    child: Icon(Icons.check_circle),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
