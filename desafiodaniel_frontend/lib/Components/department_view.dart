import 'package:desafiodaniel_frontend/Utils/Model/department_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Entities/department.dart';
import 'dart:async';
import 'AlterarDepto.dart';

class DepartmentView extends StatefulWidget {
  DepartmentView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<DepartmentView> {
  TextEditingController findId = TextEditingController();

  DepartmentModel dm = new DepartmentModel();

  List<Department> listview = new List<Department>();
  Department departmentById;

  Future<void> start() async {
    List<Department> request = await dm.getAll();
    setState(() {
      listview = request;
    });
  }

  @override
  void initState() {
    start();
    super.initState();
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
                  departmentById = await dm.getById(findId.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AlterarDepto(dep: departmentById)),
                  );
                },
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Procurar Departamento',
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
                    Navigator.pushNamed(context, '/AdicionarDepartamento');
                  }),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Adicionar Departamento',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              itemBuilder: (con, ind) {
                return buildItem(con, ind, listview);
              },
              itemCount: listview.length),
        ),
      ],
    );
  }
}

Widget buildItem(context, index, list) {
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
              Text(list[index].name),
              Text(list[index].description),
            ],
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteDepartment(context, list[index].idDep);
                },
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AlterarDepto(dep: list[index])),
                  );
                },
              )
            ],
          )
        ]),
      ],
    ),
  );
}

Future<void> _deleteDepartment(context, id) async {
  DepartmentModel dm = new DepartmentModel();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Atenção'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Você gostaria de deletar o departamento?'),
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
              dm.delete(id);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
