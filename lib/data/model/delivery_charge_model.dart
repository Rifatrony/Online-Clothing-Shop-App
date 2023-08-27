// To parse this JSON data, do
//
//     final deliveryChargeModel = deliveryChargeModelFromJson(jsonString);

import 'dart:convert';

DeliveryChargeModel deliveryChargeModelFromJson(String str) => DeliveryChargeModel.fromJson(json.decode(str));

String deliveryChargeModelToJson(DeliveryChargeModel data) => json.encode(data.toJson());

class DeliveryChargeModel {
  bool? success;
  List<Datum>? data;

  DeliveryChargeModel({
    this.success,
    this.data,
  });

  factory DeliveryChargeModel.fromJson(Map<String, dynamic> json) => DeliveryChargeModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? datumId;
  String? deliveryAddress;
  int? deliveryCharge;

  Datum({
    this.id,
    this.datumId,
    this.deliveryAddress,
    this.deliveryCharge,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    datumId: json["id"],
    deliveryAddress: json["delivery_address"],
    deliveryCharge: json["delivery_charge"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": datumId,
    "delivery_address": deliveryAddress,
    "delivery_charge": deliveryCharge,
  };
}
