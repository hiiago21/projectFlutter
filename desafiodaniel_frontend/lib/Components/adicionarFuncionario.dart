import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdicionarFincionario extends StatefulWidget {
  @override
  _AdicionarFincionarioState createState() => _AdicionarFincionarioState();
  static const routeName = '/AdicionarDepartamento';
}

class _AdicionarFincionarioState extends State<AdicionarFincionario> {
  DateTime _selectDate;

  _showDatePicker() {
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
        _selectDate = value;
      });
    });
  }

  List<bool> _selections = [false, false, true];

  void _adicionarFuncionario(){

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar Funcionario'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 0),
          child:
          Container(
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
                          labelText: 'Nome do funcionario',
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
                        labelText: 'Salário',
                        labelStyle: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 18.0, 0, 0),
                child:
                  Center(
                    child: ToggleButtons(
                      children: <Widget>[
                        Text("M", style: TextStyle(fontSize: 16)),
                        Text("F", style: TextStyle(fontSize: 16)),
                        Text("?", style: TextStyle(fontSize: 16)),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0; buttonIndex < _selections.length; buttonIndex++) {
                            if (buttonIndex == index) {
                              _selections[buttonIndex] = true;
                            } else {
                              _selections[buttonIndex] = false;
                            }
                          }
                        });
                      },
                      splashColor: Colors.blue,
                      selectedColor: Colors.blue,
                      selectedBorderColor: Colors.blue,
                      isSelected: _selections,
                    ),
              )
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
                child: RaisedButton(
                  onPressed: _adicionarFuncionario,
                  child: const Text('Adicionar', style: TextStyle(fontSize: 20)),
                ),
              )
            ],
          ),
    )));
  }
}
