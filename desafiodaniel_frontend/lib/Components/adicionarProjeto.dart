import 'package:desafiodaniel_frontend/Entities/department.dart';
import 'package:desafiodaniel_frontend/Entities/employee.dart';
import 'package:desafiodaniel_frontend/Utils/Model/department_model.dart';
import 'package:desafiodaniel_frontend/Utils/Model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import '../Entities/department.dart';
import '../Entities/employee.dart';
import 'package:desafiodaniel_frontend/Utils/Model/department_model.dart';
import 'package:desafiodaniel_frontend/Utils/Model/employee_model.dart';

class AdicionarProjeto extends StatefulWidget {
  @override
  _AdicionarProjetoState createState() => _AdicionarProjetoState();
  static const routeName = '/AdicionarProjeto';
}

class _AdicionarProjetoState extends State<AdicionarProjeto> {
  DateTime _selectDate;
  TextEditingController _nameController = TextEditingController();

  DepartmentModel dm = new DepartmentModel();
  EmployeeModel em = new EmployeeModel();

  List<Department> listDep = new List<Department>();
  List<Employee> listEmp = new List<Employee>();

  Future<void> start() async {
    List<Department> requestDep = await dm.getAll();
    setState(() {
      listDep = requestDep;
    });
    List<Employee> requestEmp = await em.getAll();
    setState(() {
      listEmp = requestEmp;
    });
  }

  @override
  void initState() {
    start();
    super.initState();
  }

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
                        controller: _nameController,
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
              Text("Selecionar Funcionários ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[600],
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 3.0),
                  height: 150.0,
                  child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(top: 10.0),
                        itemBuilder: (con, ind) {
                          return buildItemEmp(con, ind, listEmp);
                        },
                        itemCount: listEmp.length),
                  ),
                ),
              ),
              Text("Selecionar Departamento Responsável",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[600],
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 3.0),
                  height: 150.0,
                  child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(top: 10.0),
                        itemBuilder: (con, ind) {
                          return buildItemDep(con, ind, listDep);
                        },
                        itemCount: listDep.length),
                  ),
                ),
              ),
              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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

Widget buildItemEmp(context, index, listEmp) {
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
            children: [
              Text(listEmp[index].name),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildItemDep(context, index, listDep) {
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
            children: [
              Text(listDep[index].name),
            ],
          ),
        ),
      ],
    ),
  );
}
