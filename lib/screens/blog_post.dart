import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashup/components/appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fashup/screens/wishlist.dart';

class BlogPost extends StatefulWidget {
  static String id = 'blog_post';

  @override
  _BlogPostState createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
              0.07), // here the desired height
          child: Custom_Appbar(colour: Colors.transparent, elev: 0),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: size.height / 4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: NetworkImage(
                            'https://www.dhresource.com/0x0/f2/albu/g4/M00/34/98/rBVaEVfb0_KAJGGxAAXRFUJIvqA559.jpg'),
                        fit: BoxFit.fitWidth)),
                child: Container(
                  margin: EdgeInsets.only(top: 280),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '+ Fashion',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isAdded) {
                                    isAdded = false;
                                    Fluttertoast.cancel();
                                    Fluttertoast.showToast(
                                        msg: "Bookmark Removed");
                                  } else {
                                    isAdded = true;
                                    Fluttertoast.cancel();
                                    Fluttertoast.showToast(
                                        msg: "Bookmark Added");
                                  }
                                });
                              },
                              icon: isAdded
                                  ? Icon(
                                      Icons.bookmark_added,
                                      color: Colors.redAccent,
                                      size: 27,
                                    )
                                  : Icon(
                                      Icons.bookmark_add_outlined,
                                      color: Colors.black,
                                      size: 23,
                                    ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Text(
                              'How to get cheap stylist products.',
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'http://www.celebzz.com/wp-content/uploads/2018/05/evan-rachel-wood-at-heavenly-bodies-fashion-the-catholic-imagination-costume-institute-gala-in-new-york-7.jpg'),
                                    fit: BoxFit.fill),
                                shape: BoxShape.circle),
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Prachi Aggarwal  |',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '  12th June 2021',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: Text(
                            'Fashup is an e commerce community'
                            ' that aims to provide accessibility,availability, and affordability to its diverse group of stakeholdersranging from vendors.'
                            ' customers to the delivery agents.Our vision is to revolutionize 14 million+ retail outlets in India byproviding digital solutions to small retailers. We aim to build ahyperlocal fashion ecosystem that enables the local vendors toadvertise, sell, and earn by leveraging the marketing and deliveryservices of our platform.Moreover, we create an amalgamation of various segments such asPhotographers, Social media influencers, Fashion stylists, Fashiondesigners and most importantly, Delivery agents.All these are working with their expertise to provide you a comfortableway of shopping. Believers of Consumer Devo Bhava", we bring latestfashion to your doorstep from local outlets on same day delivery basiswith easy try and return options.It s about time for our local retailers to get vocal !Fashup is an e commerce community that aims to provide accessibility,availability, and affordability to its diverse group of stakeholdersranging from vendors, customers to the delivery agents.Our vision is to revolutionize 14 million+ retail outlets in India byproviding digital solutions to small retailers. We aim to build ahyperlocal fashion ecosystem that enables the local vendors toadvertise, sell, and earn by leveraging the marketing and deliveryservices of our platform.Moreover, we create an amalgamation of various segments such asPhotographers, Social media influencers, Fashion stylists, Fashiondesigners and most importantly, Delivery agents.All these are working with their expertise to provide you a comfortableway of shopping. Believers of Consumer Devo Bhava", we bring latestfashion to your doorstep from local outlets on same day delivery basiswith easy try and return options.It s about time for our local retailers to get vocal !',
                            overflow: TextOverflow.visible,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: size.width / 4,
                              decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.black),
                                    bottom: BorderSide(color: Colors.black),
                                    right: BorderSide(color: Colors.black)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.favorite),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Like',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {},
                          ),
                          Expanded(
                            child: InkWell(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black),
                                      bottom: BorderSide(color: Colors.black)),
                                ),
                                child: Center(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.chat),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Comments',
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'http://www.celebzz.com/wp-content/uploads/2018/05/evan-rachel-wood-at-heavenly-bodies-fashion-the-catholic-imagination-costume-institute-gala-in-new-york-7.jpg'),
                                      fit: BoxFit.fill),
                                  shape: BoxShape.circle),
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Leave a Comment .....',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Previous Comments',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text("Shop from the brand"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            shop_from_the_brand_container(text: "Kapsons"),
                            shop_from_the_brand_container(text: "Kapsons"),
                            shop_from_the_brand_container(text: "Kapsons"),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pushNamed(context, Wishlist.id);
                          },
                          child: Text("Shop the look"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            shop_the_look_container(),
                            shop_the_look_container(),
                            shop_the_look_container(),
                          ],
                        ),
                      ),
                      hr(
                        title: "Related Posts",
                      ),
                      SizedBox(height: 150)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class custom_button extends StatelessWidget {
  custom_button({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('hello');
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(14.0, 6.0, 14.0, 6.0),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        // child: Text(
        //   text,
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        child: Material(
            color: Colors.redAccent,
            // width: 80,
            // height: 20,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            )),
      ),
    );
  }
}

class shop_from_the_brand_container extends StatelessWidget {
  shop_from_the_brand_container({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 12.0, right: 8.0, bottom: 15.0),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.48,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            border: Border.all(color: Colors.redAccent, width: 2.5),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW8f4Chjg1nsZYXZHRB5Jz1asp_7plbJHf1Z-YG6EvzzLwJWzMxWkfHLdc08z1Eslx7oM&usqp=CAU"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.green, size: 17),
                  Icon(Icons.star, color: Colors.green, size: 17),
                  Icon(Icons.star, color: Colors.green, size: 17),
                  Icon(Icons.star, color: Colors.green, size: 17)
                ],
              ),
              Text(
                'Kapsons',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
              ),
              Text(
                '50-80% OFF',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}

class shop_the_look_container extends StatelessWidget {
  shop_the_look_container();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      // main container
      child: Padding(
        padding:
            EdgeInsets.only(left: 12, top: 13.0, right: 12.0, bottom: 35.0),
        child: Container(
          // decorations
          decoration: BoxDecoration(
            // border
            // border: Border.all(
            //     color: Colors.deepOrangeAccent,
            //     width: 2.0,
            //     style: BorderStyle.solid),
            // shadow , trying to have shadow only at bottom using offset
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 2)),
              BoxShadow(
                  color: Colors.white.withOpacity(0.4),
                  blurRadius: 5.0,
                  spreadRadius: 5.0,
                  offset: Offset(0, -5)),
            ],
            // border radius
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // image
            image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1571153041701-728931a0ff63?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bWVucyUyMHdlYXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                ),
                fit: BoxFit.cover),
          ),
          //to change container height and width
          height: size.height * 0.22,
          width: size.width * 0.34,
          // contains stack to include two text and shop botton
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: <Widget>[
              // for text

              // for shop button
              Positioned(
                  // defining the position of shop button
                  top: size.height * 0.22 -
                      25, //using the same height of container
                  left: size.width * 0.17 - 25, // using container width/2
                  child: InkWell(
                    onTap: () {
                      print('hello');
                    },
                    // opacity to provide transparent look
                    child: Opacity(
                      opacity: 0.7,
                      child: Container(
                        // change size of shop button from here
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          // change color of button from here
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                          // trying to provide shadow at bottom only
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                offset: Offset(0, 2)),
                            BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 4.0,
                                spreadRadius: 2,
                                offset: Offset(0, -4))
                          ],
                        ),
                        // change icon from here
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class hr extends StatelessWidget {
  hr({@required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 8),
          height: 2,
          width: 60,
          color: Colors.green,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Container(
          margin: EdgeInsets.only(left: 8),
          height: 2,
          width: 60,
          color: Colors.green,
        ),
        // Expanded(
        //     child: Divider(
        //   color: Colors.green,
        //   height: 25,
        //   thickness: 2,
        //   indent: 10,
        //   endIndent: 50,
        // )),
      ]),
    );
  }
}
