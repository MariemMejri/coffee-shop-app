// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffeeshop/components/coffeeTile.dart';
import 'package:coffeeshop/models/coffee.dart';
import 'package:coffeeshop/models/coffeeShop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
   ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('successfully added to cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const Text(
                      "How would you like your coffee ?",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.coffeeShop.length,
                            itemBuilder: (context, index) {
                              Coffee eachCoffee = value.coffeeShop[index];
                              return CoffeeTile(
                                icon: Icon(Icons.add),
                                coffee: eachCoffee,
                                onPressed: () => addToCart(eachCoffee),
                              );
                            }))
                  ],
                ),
              ),
      )
,
    );
  }
}
