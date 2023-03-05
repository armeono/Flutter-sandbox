import 'package:flutter/material.dart';
import 'package:practice/pages/profile.dart';

import 'duck.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> widgetOptions = <Widget>[
    Ducks(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Profile(),
  ];

  void onItemTapped(int index) => {
        setState(() {
          _selectedIndex = index;
        })
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: "Business"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded), label: "Account"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          onTap: onItemTapped,
        ));
  }
}
