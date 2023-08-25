// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  bool? success;
  Product? product;

  ProductDetailsModel({
    this.success,
    this.product,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    success: json["success"],
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "product": product?.toJson(),
  };
}

class Product {
  String? id;
  String? name;
  List<Image>? image;
  Brand? brand;
  Brand? category;
  String? description;
  int? buyPrice;
  int? price;
  int? discountPercent;
  double? discountPrice;
  List<StockQnty>? stockQnty;

  Product({
    this.id,
    this.name,
    this.image,
    this.brand,
    this.category,
    this.description,
    this.buyPrice,
    this.price,
    this.discountPercent,
    this.discountPrice,
    this.stockQnty,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
    brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
    category: json["category"] == null ? null : Brand.fromJson(json["category"]),
    description: json["description"],
    buyPrice: json["buy_price"],
    price: json["price"],
    discountPercent: json["discount_percent"],
    discountPrice: json["discount_price"]?.toDouble(),
    stockQnty: json["stock_qnty"] == null ? [] : List<StockQnty>.from(json["stock_qnty"]!.map((x) => StockQnty.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
    "brand": brand?.toJson(),
    "category": category?.toJson(),
    "description": description,
    "buy_price": buyPrice,
    "price": price,
    "discount_percent": discountPercent,
    "discount_price": discountPrice,
    "stock_qnty": stockQnty == null ? [] : List<dynamic>.from(stockQnty!.map((x) => x.toJson())),
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

class Image {
  String? image;
  String? id;

  Image({
    this.image,
    this.id,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    image: json["image"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "_id": id,
  };
}

class StockQnty {
  String? color;
  String? size;
  int? quantity;
  String? status;
  String? id;

  StockQnty({
    this.color,
    this.size,
    this.quantity,
    this.status,
    this.id,
  });

  factory StockQnty.fromJson(Map<String, dynamic> json) => StockQnty(
    color: json["color"],
    size: json["size"],
    quantity: json["quantity"],
    status: json["status"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "color": color,
    "size": size,
    "quantity": quantity,
    "status": status,
    "_id": id,
  };
}
