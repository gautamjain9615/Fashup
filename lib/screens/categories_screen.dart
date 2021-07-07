import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashup/screens/categories_secondary.dart';
import 'package:fashup/screens/wishlist.dart';
import 'package:fashup/screens/shopping_cart.dart';
import 'package:fashup/screens/home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  static String id = 'categories_screen';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

const kStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600);

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new HomeScreen()));
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
          backgroundColor: Colors.white,
          elevation: 8,
          leading: IconButton(
            icon: Icon(Icons.menu_rounded),
            color: Colors.black,
            tooltip: 'Menu Icon',
            onPressed: () {},
          ), //IconButton
          brightness: Brightness.dark,
          bottom: TabBar(
            indicatorColor: Colors.redAccent,
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.black,
            // indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Text(
                  "Primary",
                  style: TextStyle(fontSize: 23.0),
                ),
              ),
              Tab(
                child: Text(
                  'Secondary',
                  style: TextStyle(fontSize: 23.0),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Page1(),
            Page2(),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.cardChild,
      @required this.imageURL,
      @required this.onPressed});
  final Widget cardChild;
  final String imageURL;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Material(
          elevation: 8.0,
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(imageURL), fit: BoxFit.cover),
            ),
            child: cardChild,
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ReusableCard(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, CategoriesSecondary.id);
                          },
                          cardChild: Center(
                            child: Text(
                              'Men',
                              style: kStyle,
                            ),
                          ),
                          imageURL:
                              'https://images.unsplash.com/photo-1499675561012-307e6191ea68?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80,'),
                      SizedBox(width: 20.0),
                      ReusableCard(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        CategoriesSecondary()));
                          },
                          cardChild: Center(
                            child: Text(
                              'Women',
                              style: kStyle,
                            ),
                          ),
                          imageURL:
                              'https://images.unsplash.com/photo-1551523601-d005f9a86d3c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ReusableCard(
                          onPressed: () {},
                          cardChild: Center(
                            child: Text(
                              'Kids',
                              style: kStyle,
                            ),
                          ),
                          imageURL:
                              'https://images.unsplash.com/photo-1489710437720-ebb67ec84dd2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'),
                      SizedBox(width: 20.0),
                      ReusableCard(
                          onPressed: () {},
                          cardChild: Center(
                            child: Text(
                              'Accessories',
                              style: kStyle,
                            ),
                          ),
                          imageURL:
                              'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ReusableCard(
                          onPressed: () {},
                          cardChild: Center(
                            child: Text(
                              'Bags',
                              style: kStyle,
                            ),
                          ),
                          imageURL:
                              'https://images.unsplash.com/photo-1585488763177-bde7d15fd3cf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmFnc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'),
                      SizedBox(width: 20.0),
                      ReusableCard(
                          onPressed: () {},
                          cardChild: Center(
                            child: Text(
                              'Footwear',
                              style: kStyle,
                            ),
                          ),
                          imageURL:
                              'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGZvb3R3ZWFyJTIwd29tZW58ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ReusableCard(
                    onPressed: () {},
                    cardChild: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.14,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black, width: 2.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Container(
                            color: Colors.grey.withOpacity(0.7),
                            child: Center(
                              child: Text(
                                'Thrift Stores',
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    imageURL:
                        'https://images.unsplash.com/photo-1470309864661-68328b2cd0a5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8dGhyaWZ0JTIwc3RvcmV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'),
                SizedBox(height: 20.0),
                ReusableCard(
                    onPressed: () {},
                    cardChild: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.14,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black, width: 2.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Container(
                            color: Colors.grey.withOpacity(0.7),
                            child: Center(
                              child: Text(
                                'Home Decor',
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    imageURL:
                        'https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aW50ZXJpb3J8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
