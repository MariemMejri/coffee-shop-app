// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffeeshop/components/coffeeTile.dart';
import 'package:coffeeshop/models/coffee.dart';
import 'package:coffeeshop/models/coffeeShop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

   void payNow(){
    //
   }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Text(
                      'Your Cart',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Expanded(
                        child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                      Coffee eachCoffee = value.userCart[index];
                      return CoffeeTile(coffee: eachCoffee, onPressed : ()=>removeFromCart(eachCoffee), icon: Icon(Icons.delete));
                    })),
                    GestureDetector(
                      onTap: payNow,
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(12),
                          ),
                        width: double.infinity,
                        child: const Center(child: Text("Pay Now",style: TextStyle(color: Colors.white),)),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
