import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nosql_dbs/common/const.dart';
import 'package:nosql_dbs/router/router.gr.dart';
import 'package:nosql_dbs/widgets/button.dart';

class CollectionsPage extends StatefulWidget {
  final String dbName;
  const CollectionsPage({
    Key? key,
    required this.dbName,
  }) : super(key: key);

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  String dbName = "";

  @override
  void initState() {
    dbName = widget.dbName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dbName == mongo ? "MongoDB" : "Firestore"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              title: "Recipes",
              onTap: () {
                AutoRouter.of(context).push(RecipesPageRoute(dbName: dbName));
              },
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height / 2 - 50,
              fontSize: 50,
            ),
            CustomButton(
              title: "Products",
              onTap: () {
                AutoRouter.of(context).push(ProductsPageRoute(dbName: dbName));
              },
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height / 2 - 50,
              fontSize: 50,
            ),
          ],
        ),
      ),
    );
  }
}
