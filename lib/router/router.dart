import 'package:auto_route/annotations.dart';
import 'package:nosql_dbs/pages/dbs_page.dart';
import 'package:nosql_dbs/pages/collections_page.dart';
import 'package:nosql_dbs/pages/product_detail_page.dart';
import 'package:nosql_dbs/pages/products_page.dart';
import 'package:nosql_dbs/pages/recipe_detail_page.dart';
import 'package:nosql_dbs/pages/recipes_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: DBsPage, initial: true),
    MaterialRoute(page: CollectionsPage),
    MaterialRoute(page: ProductsPage),
    MaterialRoute(page: ProductDetailPage),
    MaterialRoute(page: RecipesPage),
    MaterialRoute(page: RecipeDetailPage),
  ],
)
class $FlutterRouter {}
