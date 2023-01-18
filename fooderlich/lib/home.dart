import 'package:flutter/material.dart';
import 'card1.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    // Replace with card 1
    const Card1(),

    // Replace with card 2
    Container(
      color: Colors.green,
    ),

    // Replace with card 3
    Container(
      color: Colors.blue,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fooderlich", style: Theme.of(context).textTheme.headline6),
      ),

      body: pages[_selectedIndex],
      // body: Center(
      //   child: Text(
      //     "Let's get cooking 🧑🏽‍🍳",
      //     style: Theme.of(context).textTheme.headline1,
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card2',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card3',
          ),
        ],
      ),
    );
  }
}
