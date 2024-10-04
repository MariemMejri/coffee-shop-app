import 'package:coffeeshop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
        name: 'Long Black', price: '4.500', imgPath: 'assets/images/coffee.png'),
    Coffee(
        name: 'Iced Coffee', price: '5.500', imgPath: 'assets/images/coffee-cup.png'),
    Coffee(
        name: 'Exprosso', price: '2.500', imgPath: 'assets/images/coffee.png'),
    Coffee(
        name: 'Long Black', price: '4.000', imgPath: 'assets/images/coffee-cup (1).png'),

  ];

  List<Coffee> _userCart = [];
  List<Coffee> get coffeeShop => _shop;
  List<Coffee> get userCart => _userCart;
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
