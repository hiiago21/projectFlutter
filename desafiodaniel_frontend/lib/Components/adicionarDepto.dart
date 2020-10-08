import 'package:flutter/material.dart';
import 'package:desafiodaniel_frontend/Utils/Model/department_model.dart';
import '../Entities/department.dart';

class AdicionarDepartamento extends StatefulWidget {
  @override
  _AdicionarDepartamentoState createState() => _AdicionarDepartamentoState();
  static const routeName = '/AdicionarDepartamento';
}

class _AdicionarDepartamentoState extends State<AdicionarDepartamento> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  DepartmentModel dm = new DepartmentModel();

  Future<void> _addDepartment() async {
    String name = _nameController.text;
    String description = _descController.text;
    Department dep = new Department(0, name, description);
    Department request = await dm.post(dep);
    print(request.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Criar Departamento'),
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
                              labelText: 'Nome do departamento',
                              labelStyle: TextStyle(fontSize: 16.0),
                            ),
                            controller: _nameController,
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
                              labelText: 'Descrição do departamento',
                              labelStyle: TextStyle(fontSize: 16.0),
                            ),
                            controller: _descController,
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
                        onPressed: _addDepartment,
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
