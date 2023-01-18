import 'package:flutter/material.dart';
import 'package:recipes_app/recipe.dart';

// Recipe Page Widget and it's state
class RecipeDetails extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetails({super.key, required this.recipe});

  @override
  _RecipeDetailsState createState() {
    return _RecipeDetailsState();
  }
}

class _RecipeDetailsState extends State<RecipeDetails> {
  // TODO: Add _sliderVal here

  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 300.0,
            width: double.infinity,
            // width: double.infinity,
            child: Image.asset(widget.recipe.imgUrl),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.recipe.label,
            style: const TextStyle(fontSize: 18),
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(7.0),
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ingredient = widget.recipe.ingredients[index];

                    return Text(
                        "${ingredient.quantity} ${ingredient.measure} ${ingredient.name}");
                  })),
          Slider(
            value: _sliderVal.toDouble(),
            min: 1,
            max: 10,
            divisions: 10,
            label: "${_sliderVal * widget.recipe.servings} servings",
            onChanged: (newValue) {
              setState(() {
                _sliderVal = newValue.round();
              });
            },
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          )
        ],
      )),
    );
  }
}
