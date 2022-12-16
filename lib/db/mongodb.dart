import 'package:mongo_dart/mongo_dart.dart';
import 'package:nosql_dbs/common/const.dart';
import 'package:nosql_dbs/models/product_model.dart';
import 'package:nosql_dbs/models/recipe_model.dart';

class MongoDB {
  //user - test
  //pwd - test
  static Db db = Db("");
  static DbCollection? recipesCollection, productsCollection;

  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();

    recipesCollection = db.collection(RECIPE_COLLECTION_NAME);
    productsCollection = db.collection(PRODUCTS_COLLECTION_NAME);
  }

  static Future<List<RecipeModel>> getAllRecipes() async {
    return await recipesCollection!
        .find()
        .map((event) => RecipeModel.fromMap(event))
        .toList();
  }

  static insertRecipe(RecipeModel recipe) async {
    await recipesCollection!.insertOne(recipe.toMap());
  }

  static updateRecipe(RecipeModel recipe) async {
    var updateRecipe =
        await recipesCollection!.findOne({"_id": recipe.mongoID});
    if (updateRecipe != null) {
      await recipesCollection!.updateOne(
        where.eq("_id", recipe.mongoID),
        modify
            .set("name", recipe.name)
            .set("cookTime", recipe.cookTime)
            .set("howEasy", recipe.howEasy),
      );
    }
  }

  static deleteRecipe(RecipeModel recipe) async {
    await recipesCollection!.remove(where.id(recipe.mongoID!));
  }

  static Future<List<ProductModel>> getAllProducts() async {
    return await productsCollection!
        .find()
        .map((event) => ProductModel.fromMap(event))
        .toList();
  }

  static insertProduct(ProductModel product) async {
    await productsCollection!.insertOne(product.toMap());
  }

  static updateProduct(ProductModel product) async {
    var updateProduct =
        await productsCollection!.findOne({"_id": product.mongoID});
    if (updateProduct != null) {
      await productsCollection!.updateOne(
        where.eq("_id", product.mongoID),
        modify
            .set("name", product.name)
            .set("quantity", product.quantity)
            .set("unit", product.unit),
      );
    }
  }

  static deleteProduct(ProductModel product) async {
    await productsCollection!.remove(where.id(product.mongoID!));
  }
}
