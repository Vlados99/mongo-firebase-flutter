import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nosql_dbs/common/const.dart';
import 'package:nosql_dbs/router/router.gr.dart';
import 'package:nosql_dbs/widgets/button.dart';

class DBsPage extends StatefulWidget {
  const DBsPage({Key? key}) : super(key: key);

  @override
  State<DBsPage> createState() => _DBsPageState();
}

class _DBsPageState extends State<DBsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              title: "MongoDB",
              onTap: () {
                AutoRouter.of(context)
                    .push(CollectionsPageRoute(dbName: mongo));
              },
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height / 2 - 50,
              fontSize: 50,
            ),
            CustomButton(
              title: "Firestore",
              onTap: () {
                AutoRouter.of(context)
                    .push(CollectionsPageRoute(dbName: firestore));
              },
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height / 2 - 50,
              fontSize: 50,
            )
          ],
        ),
      ),
    );
  }
}
