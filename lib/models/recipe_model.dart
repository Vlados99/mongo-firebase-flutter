import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mongo_dart/mongo_dart.dart';

class RecipeModel {
  final ObjectId? mongoID;
  final String? firestoreID;
  final String name;
  final int cookTime;
  final int howEasy;

  const RecipeModel({
    this.mongoID,
    this.firestoreID,
    required this.name,
    required this.cookTime,
    required this.howEasy,
  });

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      mongoID: map["_id"],
      name: map["name"],
      cookTime: map["cookTime"],
      howEasy: map["howEasy"],
    );
  }

  factory RecipeModel.fromSnapshot(DocumentSnapshot snapshot) {
    return RecipeModel(
      firestoreID: snapshot.id,
      name: snapshot.data().toString().contains('name')
          ? snapshot.get('name')
          : '',
      cookTime: snapshot.data().toString().contains('cookTime')
          ? snapshot.get('cookTime')
          : '',
      howEasy: snapshot.data().toString().contains('howEasy')
          ? snapshot.get('howEasy')
          : '',
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': firestoreID,
      'name': name,
      'cookTime': cookTime,
      'howEasy': howEasy,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "_id": mongoID,
      "name": name,
      "cookTime": cookTime,
      "howEasy": howEasy,
    };
  }
}
