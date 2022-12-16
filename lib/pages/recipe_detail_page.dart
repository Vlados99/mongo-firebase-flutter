import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nosql_dbs/common/const.dart';
import 'package:nosql_dbs/db/firestore.dart';
import 'package:nosql_dbs/db/mongodb.dart';
import 'package:nosql_dbs/models/recipe_model.dart';
import 'package:nosql_dbs/widgets/button.dart';
import 'package:nosql_dbs/widgets/snackbar.dart';
import 'package:nosql_dbs/widgets/textfield.dart';

class RecipeDetailPage extends StatefulWidget {
  final RecipeModel? recipe;
  final String dbName;

  const RecipeDetailPage({
    Key? key,
    this.recipe,
    required this.dbName,
  }) : super(key: key);

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cookTimeController = TextEditingController();
  TextEditingController howEasyController = TextEditingController();

  late RecipeModel? recipe;

  String dbName = "";

  @override
  void dispose() {
    nameController.dispose();
    cookTimeController.dispose();
    howEasyController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    recipe = widget.recipe;
    if (recipe != null) {
      nameController.text = recipe!.name;
      cookTimeController.text = recipe!.cookTime.toString();
      howEasyController.text = recipe!.howEasy.toString();
    }

    dbName = widget.dbName;

    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(recipe != null ? "Update recipe" : "Add new recipe")),
      body: Column(
        children: [
          CustomTextField(
            controller: nameController,
            hintText: "Enter the name of recipe",
          ),
          CustomTextField(
            formatter: FilteringTextInputFormatter.digitsOnly,
            inputType: TextInputType.number,
            controller: cookTimeController,
            hintText: "Enter the cook time",
          ),
          CustomTextField(
            formatter: FilteringTextInputFormatter.digitsOnly,
            inputType: TextInputType.number,
            controller: howEasyController,
            hintText: "Enter the complexity",
          ),
          recipe != null
              ? CustomButton(
                  title: "Update",
                  onTap: () {
                    final RecipeModel curRecipe = RecipeModel(
                        mongoID: recipe?.mongoID,
                        firestoreID: recipe?.firestoreID,
                        name: nameController.text,
                        cookTime: int.parse(cookTimeController.text),
                        howEasy: int.parse(howEasyController.text));

                    dbName == mongo
                        ? MongoDB.updateRecipe(curRecipe)
                        : FirestoreDB.updateRecipe(curRecipe);
                    AutoRouter.of(context).pop();
                    snackBarSuccess(
                        context: context,
                        message: "Recipe successfully updated");
                  })
              : CustomButton(
                  title: "Add",
                  onTap: () {
                    final RecipeModel curRecipe = RecipeModel(
                        name: nameController.text,
                        cookTime: int.parse(cookTimeController.text),
                        howEasy: int.parse(howEasyController.text));

                    dbName == mongo
                        ? MongoDB.insertRecipe(curRecipe)
                        : FirestoreDB.insertRecipe(curRecipe);
                    AutoRouter.of(context).pop();
                    snackBarSuccess(
                        context: context, message: "Recipe successfully added");
                  })
        ],
      ),
    );
  }
}
