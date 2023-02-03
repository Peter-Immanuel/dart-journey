import 'package:chapter_5/models/tab_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  static List<Widget> pages = [
    ExploreScreen(),
    RecipesScreen(),
    GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Fooderlich",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: pages[value.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: value.selectedTab,
          onTap: (index) {
            return value.goToTab(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "Recipes"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "To Buy")
          ],
        ),
      );
    });
  }
}
