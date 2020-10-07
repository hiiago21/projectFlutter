import 'package:flutter/material.dart';
import 'projects.dart';
import 'department.dart';
import 'employee.dart';


class ButtonNavigation extends StatefulWidget {
  @override
  _ButtonNavigationState createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  PageController _pageController = PageController();
  List<Widget> _screens = [Department(), Projects(), Employee()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}

