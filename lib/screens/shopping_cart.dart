import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  static String id = 'shopping_cart';

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(child: Text("Shopping cart")),
    );
  }
}
