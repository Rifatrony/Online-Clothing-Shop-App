import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  bool? success;
  List<Brand>? brand;

  BrandModel({
    this.success,
    this.brand,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    success: json["success"],
    brand: json["brand"] == null ? [] : List<Brand>.from(json["brand"]!.map((x) => Brand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "brand": brand == null ? [] : List<dynamic>.from(brand!.map((x) => x.toJson())),
  };
}

class Brand {
  String? id;
  String? brandId;
  String? name;
  String? image;

  Brand({
    this.id,
    this.brandId,
    this.name,
    this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["_id"],
    brandId: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": brandId,
    "name": name,
    "image": image,
  };
}
