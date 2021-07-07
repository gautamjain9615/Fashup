import 'package:flutter/material.dart';
import 'package:fashup/screens/wishlist.dart';
import 'package:fashup/screens/shopping_cart.dart';
import 'package:fashup/screens/main_frame.dart';

class Custom_Appbar extends StatelessWidget {
  Custom_Appbar({@required this.colour, @required this.elev});
  Color colour;
  double elev;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MainFrame.id);
          },
          child: Image.asset('images/logo.png', width: 95.0, height: 50.0)),

      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, Wishlist.id);
          },
        ), //IconButton
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, ShoppingCart.id);
          },
        ), //IconButton
      ], //<Widget>[]
      backgroundColor: colour,
      elevation: elev,
      leading: IconButton(
        icon: Icon(Icons.menu_rounded),
        color: Colors.black,
        tooltip: 'Menu Icon',
        onPressed: () {},
      ), //IconButton
      brightness: Brightness.dark,
    );
  }
}
