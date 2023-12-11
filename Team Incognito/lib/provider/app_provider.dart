import 'package:canteen_management/models/food_item.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  List<FoodItem> cart = [];
  List<List<FoodItem>> orders = [];
  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  void addToCart(FoodItem item) {
    if (!cart.contains(item)) {
      cart.add(item);
    }
    notifyListeners();
  }

  void addQuantity(FoodItem item) {
    item.quantity += 1;
    _totalPrice += item.price;
    notifyListeners();
  }

  void decreaseQuantity(FoodItem item) {
    item.quantity -= 1;
    _totalPrice -= item.price;

    if (item.quantity == 0) {
      cart.remove(item);
    }
    notifyListeners();
  }

  void order() {}
}
