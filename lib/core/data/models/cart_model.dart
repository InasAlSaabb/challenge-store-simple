import 'dart:convert';

import 'package:challenge_2/core/data/models/products_model.dart';

class CartModel {
  int? count;
  double? total;
  ProductsModel? product;

  CartModel({this.count, this.total, this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    product = json['product'] != null
        ? new ProductsModel.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['total'] = this.total;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }

  static Map<String, dynamic> toMap(CartModel model) {
    return {
      'count': model.count,
      'total': model.total,
      'product': model.product,
    };
  }

  static String encode(List<CartModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>((element) => CartModel.toMap(element))
            .toList(),
      );
  //convert to string
  //key value

  static List<CartModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
}
