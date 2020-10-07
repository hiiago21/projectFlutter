import 'package:desafiodaniel_frontend/Entities/employee.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdicionarProjeto extends StatefulWidget {
  static const routeName = '/AdicionarProjeto';
  @override
  _AdicionarProjetoState createState() => _AdicionarProjetoState();
}

class _AdicionarProjetoState extends State<AdicionarProjeto> {

  Employee dropValue;

  List<Employee> funcionarios = <Employee>[
    Employee(1, "Hiago", "S", "1111", 1999.0),
    Employee(2, "Hiago", "S", "1111", 1999.0),
    Employee(3, "Hiago", "S", "1111", 1999.0),
  ];

  @override
  void initState() {
    dropValue=funcionarios[0];
  }

  DateTime _selectDateStart;
  DateTime _selectDateFinal;

  _showDatePickerFinal() {
    showDatePicker(
        context: context,
        initialDate: DateTime(2003),
        firstDate: DateTime(1900),
        lastDate: DateTime.now() )
        .then((value) {
      if (value == null) {
        return;
      }

      setState(() {
        _selectDateFinal = value;
      });
    });
  }

  _showDatePickerStart() {
    showDatePicker(
        context: context,
        initialDate: DateTime(2003),
        firstDate: DateTime(1900),
        lastDate: DateTime.now() )
        .then((value) {
      if (value == null) {
        return;
      }

      setState(() {
        _selectDateStart = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Funcionario'),
        centerTitle: true,
      ),
      body:
      Padding(
        padding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 0),
        child:
          Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nome do Projeto',
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
                        labelText: 'Descrição',
                        labelStyle: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectDateStart == null
                            ? 'Data de Criação'
                            : 'Data Selecionada: ${DateFormat('dd/MM/yyyy').format(_selectDateStart)}',
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
                      onPressed: _showDatePickerStart,
                    )
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectDateStart == null
                            ? 'Data de Entrega'
                            : 'Data Selecionada: ${DateFormat('dd/MM/yyyy').format(_selectDateFinal)}',
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
                      onPressed: _showDatePickerFinal,
                    )
                  ],
                ),
              ),
            ],
          )
        )
    );
  }
}

