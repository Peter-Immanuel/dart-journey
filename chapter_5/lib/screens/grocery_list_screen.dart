import 'package:chapter_5/components/grocery_tile.dart';
import 'package:chapter_5/screens/grocery_item_screen.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({Key? key, required this.manager}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final groceryItem = manager.groceryItems;
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryItem.length,
        itemBuilder: ((context, index) {
          final item = groceryItem[index];
          // TODO 28: Wrap in a Dismissable
          // TODO 29: Wrap in an InkWell
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            onDismissed: (direction) {
              manager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('$item.name dismissed'),
              ));
            },
            child: InkWell(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => GroceryItemScreen(
                            originalItem: item,
                            onCreate: (item) {},
                            onUpdate: (item) {
                              manager.updateItem(item, index);
                              Navigator.pop(context);
                            }))));
              }),
              child: GroceryTile(
                item: item,
                onComplete: (change) {
                  if (change != null) {
                    manager.completeItem(index, change);
                  }
                },
              ),
            ),
          );
        }),
        separatorBuilder: ((context, index) => const SizedBox(
              height: 16.0,
            )),
      ),
    );
  }
}
