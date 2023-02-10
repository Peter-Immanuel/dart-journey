import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/grocery_item.dart';
import 'package:flutter/material.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  GroceryTile({Key? key, required this.item, this.onComplete})
      : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row Group (name, date, importance),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 5.0,
                color: item.color,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  buildDate(),
                  const SizedBox(
                    height: 4.0,
                  ),
                  buildImportance(),
                ],
              ),
            ],
          ),

          // Row Group (quantity, checkbox),
          Row(
            children: [
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(
                  decoration: textDecoration,
                  fontSize: 21.0,
                ),
              ),
              buildCheckbox(),
            ],
          ),
        ],
      ),
    );
  }

  // buildImportance()
  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text(
        "Low",
        style: GoogleFonts.lato(decoration: textDecoration),
      );
    } else if (item.importance == Importance.medium) {
      return Text(
        "Medium",
        style: GoogleFonts.lato(
          color: Colors.orange[400],
          decoration: textDecoration,
          fontWeight: FontWeight.w800,
        ),
      );
    } else if (item.importance == Importance.high) {
      return Text(
        "High",
        style: GoogleFonts.lato(
          color: Colors.red,
          decoration: textDecoration,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      throw Exception("This importance does not exist");
    }
  }

  // buildDate()
  Widget buildDate() {
    final dateFormater = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormater.format(item.date);

    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  // buildCheckbox()
  Widget buildCheckbox() {
    return Checkbox(
      value: item.isComplete,
      onChanged: onComplete,
    );
  }
}
