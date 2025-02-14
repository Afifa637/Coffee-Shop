import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier{
  // Coffee for sale list
  final List<Coffee> shop = [
    Coffee(name: "Espresso", price: "3.5", imagePath: "lib/images/c1.jpg"),
    Coffee(name: "Latte", price: "4.0", imagePath: "lib/images/c2.jpg"),
    Coffee(name: "Cappuccino", price: "4.5", imagePath: "lib/images/c3.jpg"),
    Coffee(name: "Mocha", price: "4.8", imagePath: "lib/images/c4.jpg"),
    Coffee(name: "Monacco", price: "6.7", imagePath: "lib/images/c5.jpg"),
  ];

  // User cart
  final List<Coffee> _userCart = [];

  // Get coffee list
  List<Coffee> getCoffeeList() {
    return shop;
  }

  // Get user cart
  List<Coffee> getUserCart() {
    return _userCart;
  }

  // Add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
