import 'package:desafiodaniel_frontend/Utils/Model/employee_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Entities/employee.dart';
import 'AlterarFuncionario.dart';

class EmployeeView extends StatefulWidget {
  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<EmployeeView> {
  TextEditingController findId = TextEditingController();

  EmployeeModel em = new EmployeeModel();

  List<Employee> listview = new List<Employee>();
  Employee employeeById;

  Future<void> start() async {
    List<Employee> request = await em.getAll();
    setState(() {
      listview = request;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  employeeById = await em.getById(int.parse(findId.text));
                  AlterarFuncionario(emplo: employeeById);
                },
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Procurar Funcionário',
                  ),
                  controller: findId,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/AdicionarFuncionario');
                  }),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Adicionar Funcionário',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              itemBuilder: buildItem,
              itemCount: 3),
        ),
      ],
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
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteEmployee(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.pushNamed(context, '/AlterarFuncionario');
                },
              )
            ],
          )
        ]),
      ],
    ),
  );
}

Future<void> _deleteEmployee(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Atenção'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Você gostaria de deletar o funcionário?'),
            ],
          ),
        ),
        actions: <Widget>[
          OutlineButton(
            child: Text('Não'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          OutlineButton(
            child: Text('Sim'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
