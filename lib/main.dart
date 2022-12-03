import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class FlashCard {
  const FlashCard({this.title, this.imageUrl});
  final String title;
  final String imageUrl;
}

class Kitten {
  const Kitten({this.name, this.desription, this.age, this.imageUrl});

  final String name;
  final String desription;
  final int age;
  final String imageUrl;
}

final MaterialColor primaryColor = MaterialColor(0xFFEF9400, swatch);

final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";

final Map<int, Color> swatch = <int, Color>{
  50: Color.fromRGBO(239, 149, 0, 0.1),
  100: Color.fromRGBO(239, 149, 0, 0.2),
  200: Color.fromRGBO(239, 149, 0, 0.3),
  300: Color.fromRGBO(239, 149, 0, 0.4),
  400: Color.fromRGBO(239, 149, 0, 0.5),
  500: Color.fromRGBO(239, 149, 0, 0.6),
  600: Color.fromRGBO(239, 149, 0, 0.7),
  700: Color.fromRGBO(239, 149, 0, 0.8),
  800: Color.fromRGBO(239, 149, 0, 0.9),
  900: Color.fromRGBO(239, 149, 0, 1.0)
};

final List<FlashCard> _cards = <FlashCard>[
  FlashCard(
      title: 'Card Title', imageUrl: 'http://$server:8000/HFWL-1-34-002.jpg'),
  FlashCard(
      title: 'Card Title', imageUrl: 'http://$server:8000/HFWL-1-34-003.jpg'),
  FlashCard(
      title: 'Card Title', imageUrl: 'http://$server:8000/HFWL-1-34-004.jpg'),
  FlashCard(
      title: 'Card Title', imageUrl: 'http://$server:8000/HFWL-1-34-005.jpg'),
  FlashCard(
      title: 'Card Title', imageUrl: 'http://$server:8000/HFWL-1-34-006.jpg')
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
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
  Widget _cardListItemBuilder(BuildContext context, int index) {
    return Container(
        alignment: Alignment.topCenter,
        child: Image.network(
          _cards[index].imageUrl,
          //fit: BoxFit.fill,
        ));
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hicks Techniques')),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _cards.length,
        itemExtent: 400.0,
        itemBuilder: _cardListItemBuilder,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
        selectedItemColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }
}
