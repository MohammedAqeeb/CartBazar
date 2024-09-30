import 'package:cart_bazar/features/home/product/data/models/products_colors.dart';
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

  static DateTime? timestampToDateTime(Timestamp? timestamp) =>
      timestamp?.toDate();
}
