import 'package:fashup/screens/home_screen.dart';
import 'package:fashup/screens/categories_screen.dart';
import 'package:fashup/screens/vendor_screen.dart';
import 'package:fashup/screens/main_frame.dart';
import 'package:fashup/screens/wishlist.dart';
import 'package:fashup/screens/shopping_cart.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainFrame.id,
      routes: {
        MainFrame.id: (context) => MainFrame(),
        HomeScreen.id: (context) => HomeScreen(),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        VendorScreen.id: (context) => VendorScreen(),
        Wishlist.id: (context) => Wishlist(),
        ShoppingCart.id: (context) => ShoppingCart(),

      },
    );
  }
}
