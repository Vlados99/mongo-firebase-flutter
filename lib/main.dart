import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nosql_dbs/db/firestore.dart';
import 'package:nosql_dbs/db/mongodb.dart';
import 'package:nosql_dbs/router/router.gr.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MongoDB.connect();
  await FirestoreDB.connect();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRotuer = FlutterRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRotuer.delegate(),
      routeInformationParser: _appRotuer.defaultRouteParser(),
      title: 'NoSQL app',
      theme: ThemeData.dark(),
    );
  }
}
