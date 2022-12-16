import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nosql_dbs/common/const.dart';
import 'package:nosql_dbs/db/firestore.dart';
import 'package:nosql_dbs/db/mongodb.dart';
import 'package:nosql_dbs/models/recipe_model.dart';
import 'package:nosql_dbs/router/router.gr.dart';
import 'package:nosql_dbs/widgets/button.dart';
import 'package:nosql_dbs/widgets/snackbar.dart';

class RecipesPage extends StatefulWidget {
  final String dbName;
  const RecipesPage({
    Key? key,
    required this.dbName,
  }) : super(key: key);

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  String dbName = "";

  @override
  void initState() {
    dbName = widget.dbName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recipes")),
      body: FutureBuilder<List<RecipeModel>>(
        future: dbName == mongo
            ? MongoDB.getAllRecipes()
            : FirestoreDB.getAllRecipes(),
        builder: (context, snapshot) {
          List<Widget> children = [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  title: "Add new recipe",
                  onTap: () {
                    AutoRouter.of(context)
                        .push(RecipeDetailPageRoute(dbName: dbName));
                  }),
            )
          ];
          if (snapshot.hasData) {
            children += snapshot.data!.map((e) => recipeItem(e)).toList();
          } else if (snapshot.hasError) {
            children = [const Center(child: Text("Error"))];
          } else {
            children = [
              const Center(
                child: CircularProgressIndicator(),
              )
            ];
          }
          return SingleChildScrollView(
            child: Column(
              children: children,
            ),
          );
        },
      ),
    );
  }

  Widget recipeItem(RecipeModel recipe) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          AutoRouter.of(context)
              .push(RecipeDetailPageRoute(recipe: recipe, dbName: dbName));
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width - 20,
          decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: const TextStyle(fontSize: 36),
                  ),
                  Text(
                    "Czas gotowania: ${recipe.cookTime.toString()} min",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Trudność gotowania: ",
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: List.generate(recipe.howEasy,
                            (index) => const Icon(Icons.star)).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Delete ${recipe.name}"),
                          content: Text(
                              "Do you really want to remove ${recipe.name}?"),
                          actions: [
                            CustomButton(
                                width: 60,
                                title: "No",
                                onTap: () {
                                  AutoRouter.of(context).pop();
                                }),
                            CustomButton(
                                width: 60,
                                title: "Yes",
                                onTap: () {
                                  dbName == mongo
                                      ? MongoDB.deleteRecipe(recipe)
                                      : FirestoreDB.deleteRecipe(recipe);
                                  AutoRouter.of(context).pop();
                                  setState(() {});
                                  snackBarSuccess(
                                      context: context,
                                      message: "Recipe successfully removed");
                                }),
                          ],
                        );
                      });
                },
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.delete),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
