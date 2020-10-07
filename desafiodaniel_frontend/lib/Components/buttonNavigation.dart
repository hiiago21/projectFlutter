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

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.amber[800],
      onTap: _onPageChanged,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.work,
              color: _selectedIndex == 0 ? Colors.black : Colors.white),
          title: Text('Departamentos',
              style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.black : Colors.white)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt,
              color: _selectedIndex == 1 ? Colors.black : Colors.white),
          title: Text('Projetos',
              style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.black : Colors.white)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,
              color: _selectedIndex == 2 ? Colors.black : Colors.white),
          title: Text('Funcionários',
              style: TextStyle(
                  color: _selectedIndex == 2 ? Colors.black : Colors.white)),
        ),
      ],
    );
  }
}
