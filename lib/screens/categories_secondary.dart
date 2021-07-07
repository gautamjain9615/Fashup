import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashup/screens/wishlist.dart';
import 'package:fashup/screens/shopping_cart.dart';
import 'package:fashup/screens/home_screen.dart';

class CategoriesSecondary extends StatefulWidget {
  static String id = 'categories_secondary';

  @override
  _CategoriesSecondaryState createState() => _CategoriesSecondaryState();
}

const kStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600);

class _CategoriesSecondaryState extends State<CategoriesSecondary> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          color: Colors.black,
          tooltip: 'Menu Icon',
          onPressed: () {},
        ), //IconButton
        brightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.91,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.28,
                      width: size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1571153041701-728931a0ff63?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bWVucyUyMHdlYXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: size.height * 0.14,
                  child: Column(children: [
                    Container(
                      width: size.width,
                      height: 55,
                      color: Colors.black26,
                      child: Center(
                        child: Text(
                          "Men's Collection",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ),
                    )
                  ])),
              // SizedBox(height: 10),
              Positioned(
                // top: size.height * 0.14 + 65,
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, size.height * 0.14 + 65, 0, 0),
                  child: CarouselSlider(
                    items: [
                      //1st Image of Slider
                      CarouselCard(
                        txtData: 'TopWear',
                        imageUrl:
                            'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60%27',
                      ),

                      //2nd Image of Slider
                      CarouselCard(
                        txtData: 'BottomWear',
                        imageUrl:
                            'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60%27',
                      ),

                      //3rd Image of Slider
                      CarouselCard(
                        txtData: 'Accessories',
                        imageUrl:
                            'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60%27',
                      ),

                      //4th Image of Slider
                      CarouselCard(
                        txtData: 'Shoes',
                        imageUrl:
                            'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60%27',
                      ),

                      //5th Image of Slider
                      CarouselCard(
                        txtData: 'FitnessWear',
                        imageUrl:
                            'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60%27',
                      ),
                    ],

                    //Slider Container properties
                    options: CarouselOptions(
                        // height: 20.0,
                        enlargeCenterPage: true,
                        // autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.3,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
              ),

              Positioned(
                top: size.height * 0.42,
                child: getWidget(value: _current),
              ),
            ],
          ),
          // SizedBox(height: 50.0),
          // Text("Hello"),
          // CarouselSlider(
          //   items: [
          //     //1st Image of Slider
          //     CarouselCard(
          //       txtData: 'TopWear',
          //       imageUrl:
          //           'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60%27',
          //     ),
          //
          //     //2nd Image of Slider
          //     CarouselCard(
          //       txtData: 'BottomWear',
          //       imageUrl:
          //           'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60%27',
          //     ),
          //
          //     //3rd Image of Slider
          //     CarouselCard(
          //       txtData: 'Accessories',
          //       imageUrl:
          //           'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60%27',
          //     ),
          //
          //     //4th Image of Slider
          //     CarouselCard(
          //       txtData: 'Shoes',
          //       imageUrl:
          //           'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60%27',
          //     ),
          //
          //     //5th Image of Slider
          //     CarouselCard(
          //       txtData: 'FitnessWear',
          //       imageUrl:
          //           'https://images.unsplash.com/photo-1607742683956-c7ac9132b43c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60%27',
          //     ),
          //   ],
          //
          //   //Slider Container properties
          //   options: CarouselOptions(
          //     height: 120.0,
          //     enlargeCenterPage: true,
          //     autoPlay: true,
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     enableInfiniteScroll: true,
          //     autoPlayAnimationDuration: Duration(milliseconds: 800),
          //     viewportFraction: 0.35,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CarouselCard extends StatelessWidget {
  CarouselCard({@required this.imageUrl, @required this.txtData});
  final String imageUrl;
  final String txtData;
  @override
  Widget build(BuildContext context) {
    return Column(
      // alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 85,
          width: 85,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              image: new NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          txtData,
          style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
    // return Column(
    //   children: [
    //     Container(
    //       width: 80,
    //       height: 80,
    //       decoration: new BoxDecoration(
    //         shape: BoxShape.circle,
    //         image: new DecorationImage(
    //           fit: BoxFit.fill,
    //           image: new NetworkImage(imageUrl),
    //         ),
    //       ),
    //     ),
    //     Text(txtData, style: TextStyle(fontSize: 16.0)),
    //   ],
    // );
  }
}

class BottomBr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.redAccent,
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(Icons.view_list_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Vendors',
            icon: Icon(Icons.store_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Offers',
            icon: Icon(Icons.price_change_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Discover',
            icon: Icon(Icons.trending_up_outlined),
          ),
          BottomNavigationBarItem(
            label: 'My Profile',
            icon: Icon(Icons.person_outline_rounded),
          ),
        ],
      ),
    );
  }
}

class NewWidget2 extends StatelessWidget {
  NewWidget2({@required this.imageURl, @required this.textData});

  final String imageURl;
  final String textData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          height: 180,
          width: MediaQuery.of(context).size.width * 0.28,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image: DecorationImage(
              image: NetworkImage(imageURl),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "+ " + textData,
              style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class getWidget extends StatelessWidget {
  getWidget({@required this.value});
  final int value;
  @override
  Widget build(BuildContext context) {
    switch (value) {
      case 0:
        {
          return Column(
            children: [
              Row(
                children: [
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1586083702768-190ae093d34d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                      textData: 'Shirts'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1586083702768-190ae093d34d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                      textData: 'T-shirts'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1586083702768-190ae093d34d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                      textData: 'kurtas'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1586083702768-190ae093d34d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                      textData: 'Shirts'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1586083702768-190ae093d34d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                      textData: 'Shirts'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1586083702768-190ae093d34d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                      textData: 'Shirts'),
                ],
              ),
            ],
          );
        }
        break;

      case 1:
        {
          return Column(
            children: [
              Row(
                children: [
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1542272604-787c3835535d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=626&q=80',
                      textData: 'Jeans'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1542272604-787c3835535d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=626&q=80',
                      textData: 'Shorts'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1542272604-787c3835535d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=626&q=80',
                      textData: 'Trouser'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1542272604-787c3835535d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=626&q=80',
                      textData: 'Track pants'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1542272604-787c3835535d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=626&q=80',
                      textData: 'Shirts'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1542272604-787c3835535d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=626&q=80',
                      textData: 'Shirts'),
                ],
              ),
            ],
          );
        }
        break;

      case 2:
        {
          return Column(
            children: [
              Row(
                children: [
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1585123334904-845d60e97b29?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
                      textData: 'Watches'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1585123334904-845d60e97b29?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
                      textData: 'Sunglasses'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1585123334904-845d60e97b29?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
                      textData: 'Shirts'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1585123334904-845d60e97b29?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
                      textData: 'Shirts'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1585123334904-845d60e97b29?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
                      textData: 'Shirts'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1585123334904-845d60e97b29?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
                      textData: 'Shirts'),
                ],
              ),
            ],
          );
        }
        break;

      case 3:
        {
          return Column(
            children: [
              Row(
                children: [
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80',
                      textData: 'Sport shoes'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80',
                      textData: 'Sneakers'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80',
                      textData: 'Loafers'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80',
                      textData: 'Sandals'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80',
                      textData: 'Flip flops'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80',
                      textData: 'Formal shoes'),
                ],
              ),
            ],
          );
        }
        break;

      case 4:
        {
          return Column(
            children: [
              Row(
                children: [
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1599577466565-e9686fee4c18?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                      textData: 'fitness'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1599577466565-e9686fee4c18?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                      textData: 'wear'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1599577466565-e9686fee4c18?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                      textData: 'Shirts'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1599577466565-e9686fee4c18?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                      textData: 'Shirts'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1599577466565-e9686fee4c18?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                      textData: 'Shirts'),
                  NewWidget2(
                      imageURl:
                          'https://images.unsplash.com/photo-1599577466565-e9686fee4c18?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                      textData: 'Shirts'),
                ],
              ),
            ],
          );
        }
        break;
    }
    ;
  }
}
