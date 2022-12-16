// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../models/product_model.dart' as _i9;
import '../models/recipe_model.dart' as _i10;
import '../pages/dbs_page.dart' as _i1;
import '../pages/collections_page.dart' as _i2;
import '../pages/product_detail_page.dart' as _i4;
import '../pages/products_page.dart' as _i3;
import '../pages/recipe_detail_page.dart' as _i6;
import '../pages/recipes_page.dart' as _i5;

class FlutterRouter extends _i7.RootStackRouter {
  FlutterRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    DBsPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DBsPage(),
      );
    },
    CollectionsPageRoute.name: (routeData) {
      final args = routeData.argsAs<CollectionsPageRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.CollectionsPage(
          key: args.key,
          dbName: args.dbName,
        ),
      );
    },
    ProductsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsPageRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProductsPage(
          key: args.key,
          dbName: args.dbName,
        ),
      );
    },
    ProductDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailPageRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProductDetailPage(
          key: args.key,
          product: args.product,
          dbName: args.dbName,
        ),
      );
    },
    RecipesPageRoute.name: (routeData) {
      final args = routeData.argsAs<RecipesPageRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.RecipesPage(
          key: args.key,
          dbName: args.dbName,
        ),
      );
    },
    RecipeDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailPageRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.RecipeDetailPage(
          key: args.key,
          recipe: args.recipe,
          dbName: args.dbName,
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          DBsPageRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          CollectionsPageRoute.name,
          path: '/collections-page',
        ),
        _i7.RouteConfig(
          ProductsPageRoute.name,
          path: '/products-page',
        ),
        _i7.RouteConfig(
          ProductDetailPageRoute.name,
          path: '/product-detail-page',
        ),
        _i7.RouteConfig(
          RecipesPageRoute.name,
          path: '/recipes-page',
        ),
        _i7.RouteConfig(
          RecipeDetailPageRoute.name,
          path: '/recipe-detail-page',
        ),
      ];
}

/// generated route for
/// [_i1.DBsPage]
class DBsPageRoute extends _i7.PageRouteInfo<void> {
  const DBsPageRoute()
      : super(
          DBsPageRoute.name,
          path: '/',
        );

  static const String name = 'DBsPageRoute';
}

/// generated route for
/// [_i2.CollectionsPage]
class CollectionsPageRoute extends _i7.PageRouteInfo<CollectionsPageRouteArgs> {
  CollectionsPageRoute({
    _i8.Key? key,
    required String dbName,
  }) : super(
          CollectionsPageRoute.name,
          path: '/collections-page',
          args: CollectionsPageRouteArgs(
            key: key,
            dbName: dbName,
          ),
        );

  static const String name = 'CollectionsPageRoute';
}

class CollectionsPageRouteArgs {
  const CollectionsPageRouteArgs({
    this.key,
    required this.dbName,
  });

  final _i8.Key? key;

  final String dbName;

  @override
  String toString() {
    return 'CollectionsPageRouteArgs{key: $key, dbName: $dbName}';
  }
}

/// generated route for
/// [_i3.ProductsPage]
class ProductsPageRoute extends _i7.PageRouteInfo<ProductsPageRouteArgs> {
  ProductsPageRoute({
    _i8.Key? key,
    required String dbName,
  }) : super(
          ProductsPageRoute.name,
          path: '/products-page',
          args: ProductsPageRouteArgs(
            key: key,
            dbName: dbName,
          ),
        );

  static const String name = 'ProductsPageRoute';
}

class ProductsPageRouteArgs {
  const ProductsPageRouteArgs({
    this.key,
    required this.dbName,
  });

  final _i8.Key? key;

  final String dbName;

  @override
  String toString() {
    return 'ProductsPageRouteArgs{key: $key, dbName: $dbName}';
  }
}

/// generated route for
/// [_i4.ProductDetailPage]
class ProductDetailPageRoute
    extends _i7.PageRouteInfo<ProductDetailPageRouteArgs> {
  ProductDetailPageRoute({
    _i8.Key? key,
    _i9.ProductModel? product,
    required String dbName,
  }) : super(
          ProductDetailPageRoute.name,
          path: '/product-detail-page',
          args: ProductDetailPageRouteArgs(
            key: key,
            product: product,
            dbName: dbName,
          ),
        );

  static const String name = 'ProductDetailPageRoute';
}

class ProductDetailPageRouteArgs {
  const ProductDetailPageRouteArgs({
    this.key,
    this.product,
    required this.dbName,
  });

  final _i8.Key? key;

  final _i9.ProductModel? product;

  final String dbName;

  @override
  String toString() {
    return 'ProductDetailPageRouteArgs{key: $key, product: $product, dbName: $dbName}';
  }
}

/// generated route for
/// [_i5.RecipesPage]
class RecipesPageRoute extends _i7.PageRouteInfo<RecipesPageRouteArgs> {
  RecipesPageRoute({
    _i8.Key? key,
    required String dbName,
  }) : super(
          RecipesPageRoute.name,
          path: '/recipes-page',
          args: RecipesPageRouteArgs(
            key: key,
            dbName: dbName,
          ),
        );

  static const String name = 'RecipesPageRoute';
}

class RecipesPageRouteArgs {
  const RecipesPageRouteArgs({
    this.key,
    required this.dbName,
  });

  final _i8.Key? key;

  final String dbName;

  @override
  String toString() {
    return 'RecipesPageRouteArgs{key: $key, dbName: $dbName}';
  }
}

/// generated route for
/// [_i6.RecipeDetailPage]
class RecipeDetailPageRoute
    extends _i7.PageRouteInfo<RecipeDetailPageRouteArgs> {
  RecipeDetailPageRoute({
    _i8.Key? key,
    _i10.RecipeModel? recipe,
    required String dbName,
  }) : super(
          RecipeDetailPageRoute.name,
          path: '/recipe-detail-page',
          args: RecipeDetailPageRouteArgs(
            key: key,
            recipe: recipe,
            dbName: dbName,
          ),
        );

  static const String name = 'RecipeDetailPageRoute';
}

class RecipeDetailPageRouteArgs {
  const RecipeDetailPageRouteArgs({
    this.key,
    this.recipe,
    required this.dbName,
  });

  final _i8.Key? key;

  final _i10.RecipeModel? recipe;

  final String dbName;

  @override
  String toString() {
    return 'RecipeDetailPageRouteArgs{key: $key, recipe: $recipe, dbName: $dbName}';
  }
}
