// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool? success;
  List<Product>? product;

  ProductModel({
    this.success,
    this.product,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    success: json["success"],
    product: json["product"] == null ? [] : List<Product>.from(json["product"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "product": product == null ? [] : List<dynamic>.from(product!.map((x) => x.toJson())),
  };
}

class Product {
  String? id;
  String? name;
  List<Image>? image;
  Brand? brand;
  Category? category;
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
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
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
  String? name;
  String? image;

  Brand({
    this.id,
    this.name,
    this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}

class Category {
  String? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
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
  Color? color;
  Size? size;
  int? quantity;
  Status? status;
  String? id;

  StockQnty({
    this.color,
    this.size,
    this.quantity,
    this.status,
    this.id,
  });

  factory StockQnty.fromJson(Map<String, dynamic> json) => StockQnty(
    color: colorValues.map[json["color"]]!,
    size: sizeValues.map[json["size"]]!,
    quantity: json["quantity"],
    status: statusValues.map[json["status"]]!,
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "color": colorValues.reverse[color],
    "size": sizeValues.reverse[size],
    "quantity": quantity,
    "status": statusValues.reverse[status],
    "_id": id,
  };
}

enum Color {
  THE_808080
}

final colorValues = EnumValues({
  "#808080": Color.THE_808080
});

enum Size {
  L,
  M,
  XL,
  XXL
}

final sizeValues = EnumValues({
  "L": Size.L,
  "M": Size.M,
  "XL": Size.XL,
  "XXL": Size.XXL
});

enum Status {
  AVAILABLE
}

final statusValues = EnumValues({
  "Available": Status.AVAILABLE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
