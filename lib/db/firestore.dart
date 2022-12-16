import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nosql_dbs/firebase_options.dart';
import 'package:nosql_dbs/models/product_model.dart';
import 'package:nosql_dbs/models/recipe_model.dart';

class FirestoreDB {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference? recipesCollection, productsCollection;

  static connect() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    recipesCollection = firestore.collection("recipes");
    productsCollection = firestore.collection("products");
  }

  static Future<List<RecipeModel>> getAllRecipes() async {
    QuerySnapshot querySnapshot = await recipesCollection!.get();

    return querySnapshot.docs
        .map((doc) => RecipeModel.fromSnapshot(doc))
        .toList();
  }

  static insertRecipe(RecipeModel recipe) async {
    await recipesCollection!.doc().set(recipe.toMap());
  }

  static updateRecipe(RecipeModel recipe) async {
    await recipesCollection!.doc(recipe.firestoreID).set(recipe.toDocument());
  }

  static deleteRecipe(RecipeModel recipe) async {
    await recipesCollection!.doc(recipe.firestoreID).delete();
  }

  static Future<List<ProductModel>> getAllProducts() async {
    QuerySnapshot querySnapshot = await productsCollection!.get();

    return querySnapshot.docs
        .map((doc) => ProductModel.fromSnapshot(doc))
        .toList();
  }

  static insertProduct(ProductModel product) async {
    await productsCollection!.doc().set(product.toMap());
  }

  static updateProduct(ProductModel product) async {
    await productsCollection!
        .doc(product.firestoreID)
        .set(product.toDocument());
  }

  static deleteProduct(ProductModel product) async {
    await productsCollection!.doc(product.firestoreID).delete();
  }
}
