import 'package:flutter/material.dart';
import 'package:hicks_techniques/pages/lists_page.dart';
import 'package:hicks_techniques/pages/sight_words.dart';

import 'colors.dart';
import 'widgets/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hicks Techniques',
        theme: ThemeData(
            primarySwatch: primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary)),
        home: HomeScaffold());
  }
}

class HomeScaffold extends StatefulWidget {
  const HomeScaffold();

  @override
  State<StatefulWidget> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int _selectedIndex = 0;
  String pageTitle = 'Hicks Techniques';

  final titles = ['Sight Word Lists', 'Sight Words', 'Settings'];

  final screens = [
    ListsPage(),
    SightWordsPage(),
    Center(
      child: Text('Game', style: TextStyle(fontSize: 60)),
    ),
    Center(
      child: Text('Blog', style: TextStyle(fontSize: 60)),
    ),
    Center(
      child: Text('Settings', style: TextStyle(fontSize: 60)),
    )
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[_selectedIndex])),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onNavItemTapped,
          iconSize: 30,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: bottomNavigatiomBarItems),
    );
  }
}
