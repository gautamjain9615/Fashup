import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  static String id = 'categories_screen';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Text("Categories"),
    );
  }
}
