import 'package:desafiodaniel_frontend/Utils/Model/projects_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Entities/project.dart';

class ProjectsView extends StatefulWidget {
  ProjectsView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<ProjectsView> {
  TextEditingController findId = TextEditingController();

  ProjectModel pm = new ProjectModel();

  List<Project> listview = new List<Project>();
  Project employeeById;

  Future<void> start() async {
    List<Project> request = await em.getAll();
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
                  employeeById = await pm.getById(int.parse(findId.text));
                },
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Procurar Projeto',
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
                    Navigator.pushNamed(context, '/AdicionarProjeto');
                  }),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Adicionar Projeto',
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
              Text('Projeto Daniel IT'),
              Text('Infraestrutura'),
            ],
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteProject(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              )
            ],
          )
        ]),
      ],
    ),
  );
}

Future<void> _deleteProject(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Atenção'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Você gostaria de deletar o projeto?'),
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
