import 'package:fashup/screens/categories_secondary.dart';
import 'package:fashup/screens/home_screen.dart';
import 'package:fashup/screens/categories_screen.dart';
import 'package:fashup/screens/search_screen.dart';
import 'package:fashup/screens/vendor_screen.dart';
import 'package:fashup/screens/main_frame.dart';
import 'package:fashup/screens/wishlist.dart';
import 'package:fashup/screens/shopping_cart.dart';
import 'package:fashup/screens/discover_screen.dart';
import 'package:fashup/screens/blog_profile.dart';
import 'package:fashup/screens/login.dart';
import 'package:fashup/screens/blog_post.dart';
import 'package:fashup/screens/blogpost_view.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainFrame.id,
      routes: {
        MainFrame.id: (context) => MainFrame(),
        HomeScreen.id: (context) => HomeScreen(),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        CategoriesSecondary.id: (context) => CategoriesSecondary(),
        VendorScreen.id: (context) => VendorScreen(),
        DiscoverScreen.id: (context) => DiscoverScreen(),
        Wishlist.id: (context) => Wishlist(),
        ShoppingCart.id: (context) => ShoppingCart(),
        SearchScreen.id: (context) => SearchScreen(),
        BlogProfile.id: (context) => BlogProfile(),
        Login.id: (context) => Login(),
        BlogPost.id: (context) => BlogPost(),
        BlogView.id: (context) => BlogView(),
      },
    );
  }
}
