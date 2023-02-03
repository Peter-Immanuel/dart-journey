import 'package:chapter_5/models/models.dart';
import 'package:chapter_5/screens/empty_grocery_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO: Present Grocery Screen Items
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, value, child) {
      if (value.groceryItems.isNotEmpty) {
        return Container(
          color: Colors.green,
        );
      } else {
        return const EmptyGroceryScreen();
      }
    });
  }
  // Todo: Add build grocery screen
}
