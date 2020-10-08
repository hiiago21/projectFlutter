import 'package:flutter/material.dart';
import 'projects.dart';
import 'department.dart';
import 'employee.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController();
  List<Widget> _screens = [DepartmentView(), Projects(), Employee()];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zion'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
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
      ),
    );
  }
}
