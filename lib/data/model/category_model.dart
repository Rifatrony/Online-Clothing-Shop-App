// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  bool? success;
  List<Category>? category;

  CategoryModel({
    this.success,
    this.category,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    success: json["success"],
    category: json["data"] == null ? [] : List<Category>.from(json["data"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toJson())),
  };
}

class Category {
  String? id;
  String? datumId;
  String? name;

  Category({
    this.id,
    this.datumId,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    datumId: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": datumId,
    "name": name,
  };
}
