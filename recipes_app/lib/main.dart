import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.grey, secondary: Colors.black)),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

// Home Page widget and it's state
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget buildRecipeCard(Recipe recipe) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: <Widget>[
        Image.asset(recipe.imgUrl),
        const SizedBox(
          height: 14.0,
        ),
        Text(
          recipe.label,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'Palatino',
          ),
        )
      ]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          child: ListView.builder(
              itemCount: Recipe.samples.length,
              itemBuilder: (BuildContext context, int index) {
                // Update to return recipe Card
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      // Replace return with return RecipeDetails()
                      return RecipeDetails(recipe: Recipe.samples[index]);
                    }));
                  },
                  child: buildRecipeCard(Recipe.samples[index]),
                );
              }),
        ),
      ),
    );
  }
}


// Add _RecipeDetailsState Here