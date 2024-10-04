import 'package:coffeeshop/components/bottom_nav_bar.dart';
import 'package:coffeeshop/const.dart';
import 'package:coffeeshop/pages/cartPage.dart';
import 'package:coffeeshop/pages/shopPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(Index) {
    setState(() {
      _selectedIndex = Index;
    });
  }

  // pages
  final List<Widget> _pages = [
    ShopPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu), // This is the "hamburger" icon
            onPressed: () {
              // Add your menu functionality here
            },
          ),
        ],
        backgroundColor: Color.fromARGB(255, 216, 199, 184),
        leading:Icon(Icons.local_cafe),
        title: Text('Coffee Shop App'),),
      
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
