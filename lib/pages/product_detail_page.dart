import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nosql_dbs/common/const.dart';
import 'package:nosql_dbs/db/firestore.dart';
import 'package:nosql_dbs/db/mongodb.dart';
import 'package:nosql_dbs/models/product_model.dart';
import 'package:nosql_dbs/widgets/button.dart';
import 'package:nosql_dbs/widgets/snackbar.dart';
import 'package:nosql_dbs/widgets/textfield.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel? product;
  final String dbName;

  const ProductDetailPage({
    Key? key,
    this.product,
    required this.dbName,
  }) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unitController = TextEditingController();

  late ProductModel? product;

  String dbName = "";

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    unitController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    product = widget.product;
    if (product != null) {
      nameController.text = product!.name;
      quantityController.text = product!.quantity.toString();
      unitController.text = product!.unit;
    }

    dbName = widget.dbName;

    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(product != null ? "Update product" : "Add new product")),
      body: Column(
        children: [
          CustomTextField(
            controller: nameController,
            hintText: "Enter the name of product",
          ),
          CustomTextField(
            controller: quantityController,
            hintText: "Enter the quantity",
            formatter: FilteringTextInputFormatter.digitsOnly,
            inputType: TextInputType.number,
          ),
          CustomTextField(
            controller: unitController,
            hintText: "Enter the unit",
          ),
          product != null
              ? CustomButton(
                  title: "Update",
                  onTap: () {
                    final ProductModel curProduct = ProductModel(
                      mongoID: product?.mongoID,
                      firestoreID: product?.firestoreID,
                      name: nameController.text,
                      quantity: int.parse(quantityController.text),
                      unit: unitController.text,
                    );

                    dbName == mongo
                        ? MongoDB.updateProduct(curProduct)
                        : FirestoreDB.updateProduct(curProduct);
                    AutoRouter.of(context).pop();
                    snackBarSuccess(
                        context: context,
                        message: "Product successfully updated");
                  })
              : CustomButton(
                  title: "Add",
                  onTap: () {
                    final ProductModel curProduct = ProductModel(
                      name: nameController.text,
                      quantity: int.parse(quantityController.text),
                      unit: unitController.text,
                    );

                    dbName == mongo
                        ? MongoDB.insertProduct(curProduct)
                        : FirestoreDB.insertProduct(curProduct);
                    AutoRouter.of(context).pop();
                    snackBarSuccess(
                        context: context,
                        message: "Product successfully added");
                  })
        ],
      ),
    );
  }
}
