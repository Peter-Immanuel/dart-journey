import '../models/models.dart';
import '../screens/screens.dart';
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
          final manager = Provider.of<GroceryManager>(context, listen: false);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(
                  onCreate: (item) {
                    manager.addItem(item);
                    print(item);
                    Navigator.pop(context);
                  },
                  onUpdate: (item) {}),
            ),
          );
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
