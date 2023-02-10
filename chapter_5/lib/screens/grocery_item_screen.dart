import 'package:chapter_5/components/grocery_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';
import 'package:intl/intl.dart';

class GroceryItemScreen extends StatefulWidget {
  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  const GroceryItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  final _nameController = TextEditingController();

  String _name = 'Meat 🧂';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  @override
  void initState() {
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _importance = originalItem.importance;
      _currentSliderValue = originalItem.quantity;
      _currentColor = originalItem.color;

      final date = originalItem.date;

      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // TODO: Add callback handler
              final groceryItem = GroceryItem(
                id: widget.originalItem?.id ?? const Uuid().v1(),
                name: _nameController.text,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day,
                    _dueDate.hour, _dueDate.minute),
              );

              if (widget.isUpdating) {
                widget.onUpdate(groceryItem);
              } else {
                widget.onCreate(groceryItem);
              }
            },
          ),
        ],
        elevation: 0.0,
        title: Text(
          "Grocery Item",
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            buildNameField(),
            const SizedBox(height: 20.0),
            buildImportanceField(),
            const SizedBox(height: 20.0),
            buildDateField(),
            const SizedBox(height: 20.0),
            buildTimeField(context),
            const SizedBox(height: 20.0),
            buildColorPicker(context),
            const SizedBox(height: 20.0),
            builldQuantityField(),
            const SizedBox(height: 20.0),
            GroceryTile(
              item: GroceryItem(
                id: "Preview mode",
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day,
                    _dueDate.hour, _dueDate.minute),
              ),
            )
          ],
        ),
      ),
    );
  }

  // buildNameField()
  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Item Name ",
          style: GoogleFonts.lato(fontSize: 25.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
              hintText: "E.g Apples, Banana, 1 Bag of salt",
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: _currentColor)),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: _currentColor))),
        )
      ],
    );
  }

  // buildImportanceField();
  Widget buildImportanceField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Importance ",
        style: GoogleFonts.lato(fontSize: 25.0),
      ),
      Wrap(
        spacing: 10.0,
        children: [
          ChoiceChip(
            label: const Text(
              "low",
              style: TextStyle(color: Colors.white),
            ),
            selectedColor: Colors.black,
            selected: _importance == Importance.low,
            onSelected: (selected) {
              setState(() => _importance = Importance.low);
            },
          ),
          ChoiceChip(
            label: const Text(
              "medium",
              style: TextStyle(color: Colors.white),
            ),
            selectedColor: Colors.black,
            selected: _importance == Importance.medium,
            onSelected: (selected) {
              setState(() => _importance = Importance.medium);
            },
          ),
          ChoiceChip(
            label: const Text(
              "high",
              style: TextStyle(color: Colors.white),
            ),
            selected: _importance == Importance.high,
            selectedColor: Colors.black,
            onSelected: (selected) {
              setState(() => _importance = Importance.high);
            },
          )
        ],
      )
    ]);
  }

  // buildDateField();
  Widget buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Date",
              style: TextStyle(fontSize: 25.0),
            ),
            TextButton(
              onPressed: () async {
                final currentDate = DateTime.now();

                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );

                setState(() {
                  if (selectDate != null) {
                    _dueDate = selectDate;
                  }
                });
              },
              child: const Text("Select"),
            ),
          ],
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
      ],
    );
  }

  // buildTimeField();
  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Time of Day",
              style: GoogleFonts.lato(fontSize: 25.0),
            ),
            TextButton(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                setState(() {
                  if (time != null) {
                    _timeOfDay = time;
                  }
                });
              },
              child: const Text("Select"),
            )
          ],
        ),
        Text(_timeOfDay.format(context))
      ],
    );
  }

  // buildColorPicker()
  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50.0,
              width: 10.0,
              color: _currentColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Color",
              style: GoogleFonts.lato(fontSize: 25.0),
            )
          ],
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  content: BlockPicker(
                    pickerColor: Colors.white,
                    onColorChanged: ((color) {
                      setState(() => _currentColor = color);
                    }),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Save"))
                  ],
                );
              }),
            );
          },
          child: Text("Select"),
        )
      ],
    );
  }

  // buildQuantityfield();
  Widget builldQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Quantity",
              style: GoogleFonts.lato(fontSize: 25.0),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              _currentSliderValue.toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            )
          ],
        ),
        Slider(
            min: 0.0,
            max: 100.0,
            divisions: 100,
            value: _currentSliderValue.toDouble(),
            inactiveColor: _currentColor.withOpacity(0.5),
            activeColor: _currentColor,
            label: _currentSliderValue.toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value.toInt();
              });
            })
      ],
    );
  }
}
