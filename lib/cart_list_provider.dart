import 'package:flutter/material.dart';

class CardListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cart = [];

  void addToCart(Map<String, dynamic> product) {
    cart.add(product);
    // print("Added to cart $product");
    notifyListeners();
  }

  void deleteFromCart(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
