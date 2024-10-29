import 'package:cart_bazar/features/home/data/models/products_colors.dart';
import 'package:cart_bazar/features/order/data/models/order_status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/cart/data/models/product_cart.dart';

class SHProducts {
  static List<ProductsColors> getProductColors(List<dynamic>? items) {
    List<ProductsColors> colors = [];
    if (items != null) {
      for (var prod in items) {
        colors.add(ProductsColors.fromJson(prod));
      }
    }
    return colors;
  }

  static List<Map<String, dynamic>> toProductCartJson(List<dynamic>? items) {
    List<ProductCart> carts = [];
    if (items != null) {
      return carts.map((prod) => prod.toJson()).toList();
    }
    return [];
  }

  static List<Map<String, dynamic>> toColorsJson(List<dynamic>? items) {
    List<ProductsColors> colors = [];
    if (items == null) {
      return [];
    }
    return colors.map((color) => color.toJson()).toList();
  }

  static DateTime? timestampToDateTime(Timestamp? timestamp) =>
      timestamp?.toDate();

  static FieldValue currentServerTimestamp(DateTime? dateTime) =>
      FieldValue.serverTimestamp();

  static List<Map<String, dynamic>> toStatus(List<dynamic>? items) {
    List<OrderStatus> status = [];
    if (items == null) {
      return [];
    }
    return status.map((color) => color.toJson()).toList();
  }
}
