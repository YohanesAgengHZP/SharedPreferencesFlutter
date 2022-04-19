import 'package:flutter/material.dart';
import 'package:shopping_cart/profile.dart';
import 'listItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageStates();
}

class _HomePageStates extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _screenList = [
    ListItem(title: "Daftar Barang"),
    ScreenProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
