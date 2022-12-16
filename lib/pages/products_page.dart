import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nosql_dbs/common/const.dart';
import 'package:nosql_dbs/db/firestore.dart';
import 'package:nosql_dbs/db/mongodb.dart';
import 'package:nosql_dbs/models/product_model.dart';
import 'package:nosql_dbs/router/router.gr.dart';
import 'package:nosql_dbs/widgets/button.dart';
import 'package:nosql_dbs/widgets/snackbar.dart';

class ProductsPage extends StatefulWidget {
  final String dbName;
  const ProductsPage({
    Key? key,
    required this.dbName,
  }) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String dbName = "";

  @override
  void initState() {
    dbName = widget.dbName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: FutureBuilder<List<ProductModel>>(
        future: dbName == mongo
            ? MongoDB.getAllProducts()
            : FirestoreDB.getAllProducts(),
        builder: (context, snapshot) {
          List<Widget> children = [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  title: "Add new product",
                  onTap: () {
                    AutoRouter.of(context)
                        .push(ProductDetailPageRoute(dbName: dbName));
                  }),
            )
          ];
          if (snapshot.hasData) {
            children += snapshot.data!.map((e) => productItem(e)).toList();
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

  Widget productItem(ProductModel product) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          AutoRouter.of(context)
              .push(ProductDetailPageRoute(product: product, dbName: dbName));
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
                    product.name,
                    style: const TextStyle(fontSize: 36),
                  ),
                  Row(
                    children: [
                      Text(
                        product.quantity.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        product.unit,
                        style: const TextStyle(fontSize: 16),
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
                          title: Text("Delete ${product.name}"),
                          content: Text(
                              "Do you really want to remove ${product.name}?"),
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
                                      ? MongoDB.deleteProduct(product)
                                      : FirestoreDB.deleteProduct(product);
                                  AutoRouter.of(context).pop();
                                  setState(() {});
                                  snackBarSuccess(
                                      context: context,
                                      message: "Product successfully removed");
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
