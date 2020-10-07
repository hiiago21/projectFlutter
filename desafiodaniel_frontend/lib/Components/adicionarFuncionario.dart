import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Zion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: new Container(
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
          )),
    );

    /*
    ),
    )
    floatingActionButton:
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    FloatingActionButton(
    onPressed: () {},
    tooltip: 'Check',
    child: Icon(Icons.cancel),
    ),
    SizedBox(
    width: 70.0,
    ),
    FloatingActionButton(
    onPressed: () {},
    tooltip: 'Check',
    child: Icon(Icons.check_circle),
    ),
    ]),
    bottomNavigationBar: BottomNavigationBar(
    backgroundColor: Colors.blue,
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.work, color: Colors.white),
    title: Text(
    'Departamentos',
    style: TextStyle(color: Colors.white),
    ),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.receipt, color: Colors.white),
    title: Text(
    'Projetos',
    style: TextStyle(color: Colors.white),
    ),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person, color: Colors.white),
    title: Text(
    'Funcionários',
    style: TextStyle(color: Colors.white),
    ),
    ),
    ],
    // currentIndex: null,
    selectedItemColor: Colors.blue[800],
    //onTap: null,
    ),
    );
    */
  }
}
