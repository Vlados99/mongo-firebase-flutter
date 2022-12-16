import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ProductModel {
  final ObjectId? mongoID;
  final String? firestoreID;
  final String name;
  final int quantity;
  final String unit;

  const ProductModel({
    this.mongoID,
    this.firestoreID,
    required this.name,
    required this.quantity,
    required this.unit,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      mongoID: map["_id"],
      name: map["name"],
      quantity: map["quantity"],
      unit: map["unit"],
    );
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ProductModel(
      firestoreID: snapshot.id,
      name: snapshot.data().toString().contains('name')
          ? snapshot.get('name')
          : '',
      quantity: snapshot.data().toString().contains('quantity')
          ? snapshot.get('quantity')
          : '',
      unit: snapshot.data().toString().contains('unit')
          ? snapshot.get('unit')
          : '',
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': firestoreID,
      'name': name,
      'quantity': quantity,
      'unit': unit,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "_id": mongoID,
      "name": name,
      "quantity": quantity,
      "unit": unit,
    };
  }
}
