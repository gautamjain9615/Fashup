import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  static String id = 'wishlist';

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(child: Text("Wishlist")),
    );
  }
}
