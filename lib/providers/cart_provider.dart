import 'package:ecomerce/models/product.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

  final List<Product> _clothes = [];

  
  List<Product> get clothes => _clothes;


  void add(Product product) {
    _clothes.add(product); 
    notifyListeners(); 
  }


  void remove(Product product) {
    _clothes.remove(product);
    notifyListeners(); 
  }

  double get totalPrice {
    return _clothes.fold(0, (sum, item) => sum + item.price);
  }
}