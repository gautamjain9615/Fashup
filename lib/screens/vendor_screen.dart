import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashup/components/appbar.dart';

class VendorScreen extends StatefulWidget {
  static String id = 'vendor_screen';

  @override
  _VendorScreenState createState() => _VendorScreenState();
}

String _chosenCategory;
String _chosenSubCategory;
RangeValues _currentRatings = const RangeValues(1, 5);

final List<String> imgList = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiSkjkYa_xylMRBqd1-zYKX55e-M8cyAXrrw&usqp=CAU',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class PopupItem {
  int value;
  String name;
  PopupItem(this.value, this.name);
}

class _VendorScreenState extends State<VendorScreen> {
  int _current = 0;
  bool _setPrice = false;
  RangeValues _currentRangeValues = const RangeValues(0, 5000);
  String _value = "";
  List<PopupItem> _list = [
    PopupItem(1, "Recommended"),
    PopupItem(2, "Price High to Low"),
    PopupItem(3, "Price Low to High"),
    PopupItem(4, "Ratings"),
    PopupItem(5, "Featured"),
    PopupItem(6, "Bestsellers")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
            0.07), // here the desired height
        child: Custom_Appbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 10),
            Material(
              elevation: 3.0,
              child: Container(
                // change height according to requirements.
                height: 70,
                // padding
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                // setting color to white
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  // 1st row (main row) it contains container and change button
                  // container itself contains row which contains icon and text.
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // first member of container - iconbutton
                          IconButton(
                            onPressed: () {
                              print('Icon is pressed');
                            },
                            icon: Icon(Icons.location_on),
                            // change icon size and color from here
                            iconSize: 25,
                            color: Colors.red,
                          ),
                          // second member of container i.e. coloum of text
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Delhi NCR',
                                style: TextStyle(
                                  // change fontsize of location from here.
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Tap to change the location',
                                style: TextStyle(
                                  // change font size of subscript text from here
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    // end of container
                    // begining of 2nd member of row i.e change button
                    InkWell(
                      child: Text(
                        'CHANGE',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        print('Change button is pressed ');
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 7),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                custom_button(
                  text: "Filters",
                  icon: Icons.tune_outlined,
                  onPressed: () {
                    showModalBottomSheet<void>(
                        isScrollControlled: true,
                        // backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return filter_menu();
                        });
                  },
                ),
                custom_button(
                  text: "Price",
                  icon: Icons.sell_outlined,
                  onPressed: () {
                    setState(() {
                      _setPrice = true;
                    });
                  },
                ),
                PopupMenuButton(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        // height: 29,
                        // width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          // shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        // color: Colors.red.shade400,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                          child: Row(
                            children: [
                              Icon(Icons.swap_vert_outlined),
                              Text(
                                "Sort by",
                                style: TextStyle(fontSize: 16.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    shape: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.redAccent, width: 1)),
                    onSelected: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    itemBuilder: (context) {
                      return _list.map((PopupItem choice) {
                        return PopupMenuItem(
                          value: choice,
                          child: Text(choice.name),
                        );
                      }).toList();
                    }),
              ],
            ),
            _setPrice
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Container(
                        // padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.monetization_on_outlined),
                                  SizedBox(width: 10),
                                  Text(
                                    "Set Price",
                                    style: TextStyle(fontSize: 19),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.redAccent,
                              height: 6,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            RangeSlider(
                              values: _currentRangeValues,
                              min: 0,
                              max: 5000,
                              divisions: 20,
                              activeColor: Colors.green,
                              inactiveColor: Colors.black12,
                              labels: RangeLabels(
                                _currentRangeValues.start.round().toString(),
                                _currentRangeValues.end.round().toString(),
                              ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _currentRangeValues = values;
                                });
                              },
                            ),
                            Text(
                              "Range: " +
                                  _currentRangeValues.start.toString() +
                                  " - " +
                                  _currentRangeValues.end.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 15, 10),
                                child: custom_button(
                                  text: "Submit",
                                  icon: Icons.chevron_right_rounded,
                                  onPressed: () {
                                    setState(() {
                                      _setPrice = false;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
            SizedBox(height: 7),
            CarouselSlider(
              items: [
                top_carousel_container(url: imgList[0]),
                top_carousel_container(url: imgList[1]),
                top_carousel_container(url: imgList[2]),
                top_carousel_container(url: imgList[3]),
                top_carousel_container(url: imgList[4]),
                top_carousel_container(url: imgList[5]),
              ],
              options: CarouselOptions(
                  // height: MediaQuery.of(context).size.width * 0.5,
                  enlargeCenterPage: true,
                  // autoPlay: true,
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  // aspectRatio: 2.0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Colors.green.shade200
                        : Colors.green,
                  ),
                );
              }).toList(),
            ),
            text_box(text: "Fashup's Recommended"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  fashup_recommended_container(
                    title: "Selection Women Paradise",
                    url:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW8f4Chjg1nsZYXZHRB5Jz1asp_7plbJHf1Z-YG6EvzzLwJWzMxWkfHLdc08z1Eslx7oM&usqp=CAU",
                    discount: "50-70",
                  ),
                  fashup_recommended_container(
                    title: "Kapsons",
                    url:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW8f4Chjg1nsZYXZHRB5Jz1asp_7plbJHf1Z-YG6EvzzLwJWzMxWkfHLdc08z1Eslx7oM&usqp=CAU",
                    discount: "50-70",
                  ),
                  fashup_recommended_container(
                    title: "GAP",
                    url:
                        "https://mitsui-shopping-park.com/lalaport/minatoaquls/shopguide/1121039/image1.jpg",
                    discount: "50-70",
                  ),
                  fashup_recommended_container(
                    title: "Nike",
                    url:
                        "https://theplaybook.asia/wp-content/uploads/sites/27/2018/04/nike-sale.png",
                    discount: "50-70",
                  ),
                  fashup_recommended_container(
                    title: "Puma",
                    url:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbngQJvZPWntGlaxefiBz3s9fxQnCOO7C3gNziI8b2sIqEjS8jNlHi5K_zhQVrOfxjWYA&usqp=CAU",
                    discount: "50-70",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            text_box(text: "Bestsellers"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  bestsellers_container(
                    title: "Kapsons",
                    url:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW8f4Chjg1nsZYXZHRB5Jz1asp_7plbJHf1Z-YG6EvzzLwJWzMxWkfHLdc08z1Eslx7oM&usqp=CAU",
                    discount: "50-70",
                  ),
                  bestsellers_container(
                    title: "GAP",
                    url:
                        "https://mitsui-shopping-park.com/lalaport/minatoaquls/shopguide/1121039/image1.jpg",
                    discount: "50-70",
                  ),
                  bestsellers_container(
                    title: "Nike",
                    url:
                        "https://theplaybook.asia/wp-content/uploads/sites/27/2018/04/nike-sale.png",
                    discount: "50-70",
                  ),
                ],
              ),
            ),
            text_box(text: "Nearby Shops"),
            nearby_shops_container(
                url:
                    "https://pbs.twimg.com/profile_images/1169852631512076289/T9x4sqLA_400x400.jpg",
                title: "The Souled Store",
                description: "Ethnic Wear, Casual Dresses, Jeans, Footwear",
                discount: "20-40",
                distance: "2.3"),
            nearby_shops_container(
                url:
                    "https://i.pinimg.com/originals/17/d8/57/17d8571b0e827842a5ded5e13eba8b04.jpg",
                title: "Bewakoof.com",
                description: "Nightwear, Casual T-shirts, Jeans, Footwear",
                discount: "20-40",
                distance: "3"),
            nearby_shops_container(
                url:
                    "https://www.theprelease.com/upload/properties/peter-england-logo-CAA89E9287-seeklogo.com.png",
                title: "Peter England",
                description: "Jackets, T-shirts, Jeans, Accessories",
                discount: "10-25",
                distance: "3.5"),
            nearby_shops_container(
                url:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKcqBaAhyCWN7Yk991uG9GYFWPAHerUDgXfd2onLqnPf-goTJkPAETaZJsuK4Lc0JdUrI&usqp=CAU",
                title: "Levi's",
                description: "Formal Wear, Jackets, Jeans, Footwear",
                discount: "20-50",
                distance: "3.1"),
            nearby_shops_container(
                url:
                    "https://pbs.twimg.com/profile_images/1169852631512076289/T9x4sqLA_400x400.jpg",
                title: "The Souled Store",
                description: "Ethnic Wear, Casual Dresses, Jeans, Footwear",
                discount: "20-40",
                distance: "2.3"),
            nearby_shops_container(
                url:
                    "https://i.pinimg.com/originals/17/d8/57/17d8571b0e827842a5ded5e13eba8b04.jpg",
                title: "Bewakoof.com",
                description: "Nightwear, Casual T-shirts, Jeans, Footwear",
                discount: "20-40",
                distance: "3"),
            nearby_shops_container(
                url:
                    "https://www.theprelease.com/upload/properties/peter-england-logo-CAA89E9287-seeklogo.com.png",
                title: "Peter England",
                description: "Jackets, T-shirts, Jeans, Accessories",
                discount: "10-25",
                distance: "3.5"),
            nearby_shops_container(
                url:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKcqBaAhyCWN7Yk991uG9GYFWPAHerUDgXfd2onLqnPf-goTJkPAETaZJsuK4Lc0JdUrI&usqp=CAU",
                title: "Levi's",
                description: "Formal Wear, Jackets, Jeans, Footwear",
                discount: "20-50",
                distance: "3.1"),
          ],
        ),
      ),
    );
  }
}

class custom_button extends StatelessWidget {
  custom_button(
      {@required this.text, @required this.icon, @required this.onPressed});
  final String text;
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      // onPressed: onPressed,
      onPressed: onPressed,
      // color: Colors.redAccent,
      // minWidth: MediaQuery.of(context).size.width * 0.25,
      // height: 35,
      style: ElevatedButton.styleFrom(
        primary: Colors.red.shade400,
        onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: TextStyle(fontSize: 16.5),
      ),
      icon: Icon(icon),
      label: Text(text),
      // onPressed: () => print("it's pressed"),

      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Icon(icon),
      //     // SizedBox(width: 5),
      //     Text(
      //       text,
      //       style: TextStyle(
      //           color: Colors.black,
      //           // fontWeight: FontWeight.bold,
      //           fontSize: 16),
      //     ),
      //   ],
      // ),
    );
  }
}

class filter_menu extends StatefulWidget {
  @override
  _filter_menuState createState() => _filter_menuState();
}

class _filter_menuState extends State<filter_menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      // color: Colors.white,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red[500],
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(
                20)), // use instead of BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Divider(
            color: Colors.black26,
            height: 20,
            thickness: 3.5,
            indent: MediaQuery.of(context).size.width * 0.5 - 30,
            endIndent: MediaQuery.of(context).size.width * 0.5 - 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.tune_outlined,
                size: 27,
              ),
              SizedBox(width: 10),
              Text(
                "Set Filters",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              )
            ],
          ),
          Divider(
            color: Colors.redAccent,
            height: 20,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          //caregoires
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Category",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 30, 0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: MediaQuery.of(context).size.width - 50,
                      height: 31,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black45,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<String>(
                        focusColor: Colors.green,
                        value: _chosenCategory,
                        // elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'Ethnic Wear',
                          'Casal Dresses',
                          'Night wear',
                          'Footwear',
                          'Makeup',
                          'Accessories',
                          'Formal Wear',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          );
                        }).toList(),
                        hint: Row(
                          children: [
                            Icon(Icons.tune_outlined),
                            SizedBox(width: 10),
                            Text(
                              "Category",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _chosenCategory = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          //sub-categories
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Sub-Category",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 30, 0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: MediaQuery.of(context).size.width - 50,
                      height: 31,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black45,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<String>(
                        focusColor: Colors.green,
                        value: _chosenSubCategory,
                        // elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'Jeans',
                          'T-shirts',
                          'Shirts',
                          'Jackets',
                          'Shorts',
                          'Sarees',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          );
                        }).toList(),
                        hint: Row(
                          children: [
                            Icon(Icons.tune_outlined),
                            SizedBox(width: 10),
                            Text(
                              "Sub-Category",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _chosenSubCategory = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          //ratings
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Average Customer Ratings",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                RangeSlider(
                  values: _currentRatings,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  activeColor: Colors.redAccent,
                  inactiveColor: Colors.black12,
                  labels: RangeLabels(
                    _currentRatings.start.round().toString(),
                    _currentRatings.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRatings = values;
                    });
                  },
                ),
                Text(
                  "Ratings: " +
                      _currentRatings.start.toString() +
                      " " +
                      "⭐" * _currentRatings.start.toInt() +
                      " - " +
                      _currentRatings.end.toString() +
                      " " +
                      "⭐" * _currentRatings.end.toInt(),
                  style: TextStyle(fontSize: 17.5),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          //discounts
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Discounts",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [butt(), butt()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [butt(), butt()],
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              custom_button(
                text: "Reset",
                icon: Icons.clear,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              custom_button(
                text: "Submit",
                icon: Icons.chevron_right_rounded,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class butt extends StatefulWidget {
  // const butt({Key? key}) : super(key: key);

  @override
  _buttState createState() => _buttState();
}

class _buttState extends State<butt> {
  bool wh = true;

  void changedata() {
    setState(() {
      if (wh == true) {
        wh = false;
      } else {
        wh = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (wh == true) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 2)),
                BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 0.0,
                    spreadRadius: 1,
                    offset: Offset(0, -4))
              ],
            ),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                child: Text(
                  '30% off or more',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              onTap: changedata,
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.redAccent.withOpacity(0.6)
                ],
                begin: Alignment.topCenter,
                end: Alignment(0, -0.5),
              ),
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 4.0, 10, 4.0),
                child: Text(
                  '30% off or more',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              onTap: changedata,
            ),
          ),
        ),
      );
    }
  }
}

class top_carousel_container extends StatelessWidget {
  top_carousel_container({@required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.6,

      // image , text and button in stack .
      child: new Image.network(
        url,
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.6,
      ),

      // positioned to determine the exact position.
    );
  }
}

class text_box extends StatelessWidget {
  text_box({@required this.text});
  final String text;
  // final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(Icons.add),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class nearby_shops_container extends StatelessWidget {
  nearby_shops_container(
      {@required this.url,
      @required this.title,
      @required this.description,
      @required this.discount,
      @required this.distance});
  final String url;
  final String title;
  final String description;
  final String discount;
  final String distance;

  @override
  Widget build(BuildContext context) {
    // using screen size
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Container(
          // main container
          width: size.width,
          decoration: BoxDecoration(
            // border
            border: Border.all(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            // Row that contains image and column of text.
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * .26,
                  height: size.width * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(url),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // may be this cross axis alignment is the reason why i can't use main axis alignment inside row .
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // not working because of cross axis alignment in parent column.
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // change bewakoof.com size from here.
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          // applying padding as main axis alignment do not work
                          margin: EdgeInsets.only(right: 8),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 17,
                                color: Colors.green, // icon size from here.
                              ),
                              Icon(
                                Icons.star,
                                size: 17,
                                color: Colors.green, // icon size from here.
                              ),
                              Icon(
                                Icons.star,
                                size: 17,
                                color: Colors.green, // icon size from here.
                              ),
                              Icon(
                                Icons.star,
                                size: 17,
                                color: Colors.green, // icon size from here.
                              ),
                              Icon(
                                Icons.star,
                                size: 17,
                                color: Colors.black26, // icon size from here.
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    // simple text description of company
                    SizedBox(height: 2),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(height: 2),
                    Divider(
                      color: Colors.redAccent,
                      height: 6,
                      thickness: 2,
                      indent: 0,
                      endIndent: 8,
                    ),
                    SizedBox(height: 2),

                    Text(
                      discount + "% Off",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    SizedBox(height: 6),
                    // icon row and also last row of coloumn
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // cross axis alignment setting the 3 km on the same baselevel as of icon row.
                      children: <Widget>[
                        Container(
                          // wrapped all the coloumns (icon and text ) inside the row and applied the alignment to start . it did not worked.
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.local_shipping_outlined,
                                    size: 19, // change icon size.
                                  ),
                                  Text(
                                    'Free',
                                    style: TextStyle(
                                      fontSize: 9, // change text size
                                    ),
                                  ),
                                  Text(
                                    'Delivery',
                                    style: TextStyle(
                                      fontSize: 9, // change text size.
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5),
                              Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.restart_alt_outlined,
                                    size: 19, // change icon size.
                                  ),
                                  Text(
                                    'Return',
                                    style: TextStyle(
                                      fontSize: 9, // change text size
                                    ),
                                  ),
                                  Text(
                                    'Available',
                                    style: TextStyle(
                                      fontSize: 9, // change text size.
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5),
                              Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.verified_outlined,
                                    size: 19, // change icon size.
                                  ),
                                  Text(
                                    'Assured',
                                    style: TextStyle(
                                      fontSize: 9, // change text size
                                    ),
                                  ),
                                  Text(
                                    'Quality',
                                    style: TextStyle(
                                      fontSize: 9, // change text size.
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5),
                              Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.payments_outlined,
                                    size: 19, // change icon size.
                                  ),
                                  Text(
                                    'COD',
                                    style: TextStyle(
                                      fontSize: 9, // change text size
                                    ),
                                  ),
                                  Text(
                                    'Available',
                                    style: TextStyle(
                                      fontSize: 9, // change text size.
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(
                              right:
                                  25), // setting margin inorder to make 3 km appear as far as possible
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            distance + " Km",
                            style: TextStyle(
                              fontSize: 12, // change font size from here
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class fashup_recommended_container extends StatelessWidget {
  fashup_recommended_container(
      {@required this.title, @required this.url, @required this.discount});
  final String title;
  final String url;
  final String discount;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, top: 8.0, right: 15, bottom: 5.0),
          width: MediaQuery.of(context).size.width * 0.20,
          height: MediaQuery.of(context).size.width * 0.20,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new NetworkImage(url),
            ),
          ),
        ),
        Text(title, style: TextStyle(fontSize: 15.0)),
        Text(discount + "% Off", style: TextStyle(fontSize: 14.0)),
      ],
    );
  }
}

class bestsellers_container extends StatelessWidget {
  bestsellers_container(
      {@required this.title, @required this.url, @required this.discount});
  final String title;
  final String url;
  final String discount;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(8, 4, 5, 4),
      width: size.width / 2 - 10,
      height: size.height / 7,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: size.width / 2 - 10,
              height: size.height / 14,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red.withOpacity(0.4),
                  width: 1,
                ),
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            top: size.height / 28,
          ),
          Positioned(
              top: size.height / 28 + 3,
              left: size.width / 8 - 30,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              )),
          Positioned(
            child: Text(
              discount + '% Off',
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            right: size.width / 8 - 30,
            bottom: size.height / 28 + 2,
          )
        ],
      ),
    );
  }
}
