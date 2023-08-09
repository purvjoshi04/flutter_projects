import 'package:flutter/material.dart';
import 'card1.dart';

// 1
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
// 7
  int _selectedIndex = 0;
// 8
  static List<Widget> pages = <Widget>[
    const Card1(),
// TODO: Replace with Card2
    Container(color: Colors.green),
// TODO: Replace with Card3
    Container(color: Colors.blue)
  ];
// 9
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
// 2
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
// 5
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
// 10
currentIndex: _selectedIndex,
// 11
onTap: _onItemTapped,
// 6
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card 3',
          ),
        ],
      ),
    );
  }
}
