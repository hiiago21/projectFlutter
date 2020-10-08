import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdicionarFuncionario extends StatefulWidget {
  @override
  _AdicionarFuncionarioState createState() => _AdicionarFuncionarioState();
  static const routeName = '/AdicionarFuncionario';
}

class _AdicionarFuncionarioState extends State<AdicionarFuncionario> {
  DateTime _selectDate;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();

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

  void _addEmployee() {
    String name = _nameController.text;
    String salary = _salaryController.text;
    String birthDate = DateFormat('y/MM/dd').format(_selectDate);
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
                          labelText: 'Nome do funcionario',
                          labelStyle: TextStyle(fontSize: 16.0),
                        ),
                        controller: _nameController,
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
                      controller: _salaryController,
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
                    child: Icon(
                      Icons.cancel,
                      size: 42.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  FloatingActionButton(
                    heroTag: "BCheck",
                    onPressed: _addEmployee,
                    tooltip: 'Check',
                    child: Icon(
                      Icons.check_circle,
                      size: 42.0,
                    ),
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
