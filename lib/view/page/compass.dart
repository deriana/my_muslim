import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:my_muslim/view/widget/navbar.dart';

class CompassPage extends StatefulWidget {
  @override
  _CompassPageState createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman terkait jika perlu, misalnya:
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/library');
        break;
      case 2:
        Navigator.pushNamed(context, '/schedule');
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}
