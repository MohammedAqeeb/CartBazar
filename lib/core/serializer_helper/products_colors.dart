import 'package:cart_bazar/features/home/data/models/products_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SHProductColors {
  static List<ProductsColors> getProductColors(List<dynamic>? items) {
    List<ProductsColors> colors = [];
    if (items != null) {
      for (var prod in items) {
        colors.add(ProductsColors.fromJson(prod));
      }
    }
    return colors;
  }

  static List<Map<String, dynamic>> toJson(List<dynamic>? items) {
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
}
