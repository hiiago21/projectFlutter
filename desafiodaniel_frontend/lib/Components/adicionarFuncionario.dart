import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdicionarFincionario extends StatefulWidget {
  @override
  _AdicionarFincionarioState createState() => _AdicionarFincionarioState();
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

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: new EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text("Cadastrar Funcionário",
                    style: TextStyle(fontSize: 25.0, color: Colors.blue)),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nome do funcionario',
                          labelStyle: TextStyle(fontSize: 25.0),
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
                        labelStyle: TextStyle(fontSize: 25.0),
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
                        _selectDate == null
                            ? 'Data de Aniversário'
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
            ],
          ),
    );
  }
}
