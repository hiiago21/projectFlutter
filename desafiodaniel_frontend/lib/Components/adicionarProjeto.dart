import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';


class AdicionarProjeto extends StatefulWidget {

  @override
  _AdicionarProjetoState createState() => _AdicionarProjetoState();
  static const routeName = '/AdicionarProjeto';
}

class _AdicionarProjetoState extends State<AdicionarProjeto> {
  DateTime _selectDate;
  bool monVal = false;
  bool monVal2 = false;


  _showDatePickerCriacao() {
    showDatePicker(
            context: context,
            initialDate: DateTime(2020),
            firstDate: DateTime(2020),
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

  _showDatePickerEntrega() {
    showDatePicker(
            context: context,
            initialDate: DateTime(2020),
            firstDate: DateTime(2020),
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Projeto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
                          labelText: 'Nome do Projeto',
                          labelStyle: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Selecionar data de criação',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _showDatePickerCriacao,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Selecionar data de entrega',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _showDatePickerEntrega,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0),
                    itemBuilder: buildItem,
                    itemCount: 3),
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

Widget buildItem(context, index) {
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.only(top: 5.0),
    decoration:
    BoxDecoration(border: Border.all(color: Colors.blue, width: 2.0)),
    child: Row(
      children: <Widget>[
    Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Maria da Glória'),
        Text('Projeto APP Legal'),
      ],
    ),
    ),
    ],
  ),
  );
}
