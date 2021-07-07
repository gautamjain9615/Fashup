import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashup/screens/search_screen.dart';
import 'package:fashup/components/appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final List<String> imgList = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiSkjkYa_xylMRBqd1-zYKX55e-M8cyAXrrw&usqp=CAU',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List<String> imgList1 = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4W_RZ6DDxxG1JesdJxtmESSLufuElfW9USQ&usqp=CAU',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List<String> imgList2 = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-CwEdGxNb_xgLEFL_r2srBv8_3mm_YI-Gfw&usqp=CAU',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  int _current1 = 0;
  int _current2 = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
            0.07), // here the desired height
        child: Custom_Appbar(colour: Colors.white, elev: 8.0),
      ),
      body: SingleChildScrollView(
        // <-- wrap this around
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 10),
            //location bar
            Material(
              elevation: 8.0,
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
                            onPressed: () {},
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
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
            // top image with search bar
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage("images/images.jpg"),
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    // defining the position of shop button
                    top: 130, //using the same height of container
                    left: size.width * 0.15,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, SearchScreen.id),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.0),
                          ),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Shop..',
                                  style: TextStyle(
                                      fontSize: 20.5,
                                      fontWeight: FontWeight.w500)),
                              Icon(
                                Icons.search_outlined,
                                size: 23.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  top_carousel_container(
                      url:
                          "https://images.unsplash.com/photo-1531535701800-03b2bec4fbfd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTIwfHxvbmxpbmUlMjBtZWV0aW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                      text:
                          '5-MINUTE MAKEUP ROUTINE FOR YOUR NEXT ZOOM MEETING'),
                  top_carousel_container(
                      url:
                          "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                      text:
                          '5-MINUTE MAKEUP ROUTINE FOR YOUR NEXT ZOOM MEETING'),
                  top_carousel_container(
                      url: "https://picsum.photos/250?image=9",
                      text:
                          '5-MINUTE MAKEUP ROUTINE FOR YOUR NEXT ZOOM MEETING'),
                ],
              ),
            ),
            SizedBox(height: 20),
            hr(title: "Today's Hot Deals"),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  hot_deals_carousel_container(),
                  hot_deals_carousel_container(),
                  hot_deals_carousel_container(),
                  hot_deals_carousel_container()
                ],
              ),
            ),

            SizedBox(height: 10),
            hr(title: "Vendors in the spotlight"),
            SizedBox(height: 10),
            CarouselSlider(
              items: [
                vendors_spotlight_carousel_container(url: imgList[0]),
                vendors_spotlight_carousel_container(url: imgList[1]),
                vendors_spotlight_carousel_container(url: imgList[2]),
                vendors_spotlight_carousel_container(url: imgList[3]),
                vendors_spotlight_carousel_container(url: imgList[4]),
                vendors_spotlight_carousel_container(url: imgList[5]),
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
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            hr(title: 'Trending Choices'),
            SizedBox(height: 15),
            custom_button(text: "For Her"),
            Row(
              children: <Widget>[
                trending_choices_container(
                    title: "Dresses",
                    url:
                        "https://images.unsplash.com/flagged/photo-1577854362336-ec93f79d06ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80"),
                trending_choices_container(
                    title: "Sarees",
                    url:
                        "https://images.unsplash.com/photo-1610030469668-8e9f641aaf27?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FyZWVzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "Jeans",
                    url:
                        "https://images.unsplash.com/photo-1475178626620-a4d074967452?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8amVhbnN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "Flip Flops",
                    url:
                        "https://images.unsplash.com/photo-1600712265705-41cfde6ea0b1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fGZsaXAlMjBmbG9wc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              ],
            ),
            Row(
              children: <Widget>[
                trending_choices_container(
                    title: "Kurtis",
                    url:
                        "https://images.unsplash.com/photo-1597983073512-90bd150e19f6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8a3VydGlzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "Handbags",
                    url:
                        "https://images.unsplash.com/photo-1614179689702-355944cd0918?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aGFuZGJhZ3N8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "Necklaces",
                    url:
                        "https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fG5lY2tsYWNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "T-shirts",
                    url:
                        "https://images.unsplash.com/photo-1608883819098-4cae10773e98?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fHRzaGlydHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              ],
            ),
            SizedBox(height: 25),
            custom_button(text: "For Him"),
            Row(
              children: <Widget>[
                trending_choices_container(
                    title: "T-shirts",
                    url:
                        "https://images.unsplash.com/photo-1605728889623-c5f87966b907?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njl8fHRzaGlydHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "Jeans",
                    url:
                        "https://images.unsplash.com/photo-1555689502-c4b22d76c56f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGplYW5zfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "Watches",
                    url:
                        "https://images.unsplash.com/photo-1585123334904-845d60e97b29?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8d2F0Y2hlc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "Sunglasses",
                    url:
                        "https://images.unsplash.com/photo-1572635196237-14b3f281503f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c3VuZ2xhc3Nlc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              ],
            ),
            Row(
              children: <Widget>[
                trending_choices_container(
                    title: "Shoes",
                    url:
                        "https://images.unsplash.com/photo-1543508282-6319a3e2621f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "Jackets",
                    url:
                        "https://images.unsplash.com/photo-1548126032-079a0fb0099d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8amFja2V0c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "Kurtas",
                    url:
                        "https://images.unsplash.com/photo-1616879672811-7664f07e832c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fGt1cnRhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                trending_choices_container(
                    title: "Shorts",
                    url:
                        "https://images.unsplash.com/photo-1563643021-fc79b9e02867?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c2hvcnRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              ],
            ),
            SizedBox(height: 10),
            hr(title: 'Featured Brands'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  featured_brands_container(),
                  featured_brands_container(),
                  featured_brands_container(),
                  featured_brands_container(),
                ],
              ),
            ),

            SizedBox(height: 10),
            hr(title: 'Recommended Picks'),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                recommended_picks_container(
                    url:
                        "https://m.economictimes.com/thumb/height-450,width-600,imgsize-188627,msid-80721826/the-souled-store.jpg"),
                recommended_picks_container(
                  url:
                      "https://businessoptions.in/assets/uploads/franchise/cover/dx6m8mitp9ga2h0441ym.png",
                ),
                recommended_picks_container(
                  url: "https://www.sheeko.in/media/Logo.jfif",
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                recommended_picks_container(
                  url:
                      "https://www.zivame.com/blog/v1/wp-content/uploads/2019/04/Blog-post-1200-x-800px.jpg",
                ),
                recommended_picks_container(
                    url:
                        "https://uae.jobscareernews.com/wp-content/uploads/sites/3/2021/05/PUMA-Jobs.jpg"),
                recommended_picks_container(
                  url:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGfZ6a_uD_BY7kl1Lt0rKFfhTdgYVNTAqRuzMn_1xxqlPp0eDWx_QJAkcbTFIa3qMeiMM&usqp=CAU",
                ),
              ],
            ),
            SizedBox(height: 10),
            hr(title: "Exciting Offers"),
            Row(
              children: <Widget>[
                exciting_offers_container(title: "Flat 70% Off"),
                exciting_offers_container(title: "Under Rs. 499"),
                exciting_offers_container(title: "Buy 1, Get 1 Free"),
              ],
            ),
            SizedBox(height: 10),
            hr(title: "Sponsored Brands"),
            SizedBox(height: 10),
            CarouselSlider(
              items: [
                sponsored_brands_carousel_container(url: imgList1[0]),
                sponsored_brands_carousel_container(url: imgList1[1]),
                sponsored_brands_carousel_container(url: imgList1[2]),
                sponsored_brands_carousel_container(url: imgList1[3]),
                sponsored_brands_carousel_container(url: imgList1[4]),
                sponsored_brands_carousel_container(url: imgList1[5]),
              ],
              options: CarouselOptions(
                  // height: MediaQuery.of(context).size.width * 0.5,
                  enlargeCenterPage: true,
                  // autoPlay: true,
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  // aspectRatio: 2.0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  onPageChanged: (index1, reason) {
                    setState(() {
                      _current1 = index1;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList1.map((url) {
                int index1 = imgList1.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current1 == index1
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            // SizedBox(height: 10),
            hr(title: "Promoted Brands"),
            SizedBox(height: 10),
            CarouselSlider(
              items: [
                sponsored_brands_carousel_container(url: imgList2[0]),
                sponsored_brands_carousel_container(url: imgList2[1]),
                sponsored_brands_carousel_container(url: imgList2[2]),
                sponsored_brands_carousel_container(url: imgList2[3]),
                sponsored_brands_carousel_container(url: imgList2[4]),
                sponsored_brands_carousel_container(url: imgList2[5]),
              ],
              options: CarouselOptions(
                  // height: MediaQuery.of(context).size.width * 0.5,
                  enlargeCenterPage: true,
                  // autoPlay: true,
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  // aspectRatio: 2.0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  onPageChanged: (index2, reason) {
                    setState(() {
                      _current2 = index2;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList2.map((url) {
                int index2 = imgList2.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current2 == index2
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            hr(title: "Top Categories"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  top_categories_container(text: "hllo"),
                  top_categories_container(text: "hllo"),
                  top_categories_container(text: "hllo"),
                  top_categories_container(text: "hllo"),
                ],
              ),
            ),
          ],
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

class top_carousel_container extends StatelessWidget {
  top_carousel_container({@required this.url, @required this.text});
  final String url;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.all(Radius.circular(1.0)),
          elevation: 8.0,
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.redAccent),
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
              image: DecorationImage(
                image: new NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          height: 80,
          width: MediaQuery.of(context).size.width * 0.5,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.026,
              top: 13.0,
              right: MediaQuery.of(context).size.width * 0.026,
              bottom: 0.0),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

class hot_deals_carousel_container extends StatelessWidget {
  hot_deals_carousel_container();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18, top: 0, right: 10, bottom: 0),
      child: Material(
        elevation: 8.0,
        child: Container(
          // margin: EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
          height: MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width * 0.46,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    child: Image(
                      image: AssetImage(
                        'images/carousel2.jpeg',
                      ),
                      width: 100.0,
                      height: 30.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: Text(
                      '50-70% OFF',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  )
                ],
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Image(
                  image: ExactAssetImage(
                    'images/carousel1.jpeg',
                  ),
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.46 - 110,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class vendors_spotlight_carousel_container extends StatelessWidget {
  vendors_spotlight_carousel_container({@required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      // this is the main container
      // decorations - border ,shadow
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.red, width: 3.0, style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 4.0, spreadRadius: 4.0)
          ]),
      // image , text and button in stack .
      child: Stack(
        children: <Widget>[
          // new Positioned.fill(
          //   child: Image.network(url),
          // ),
          // foreground,
          // FittedBox(
          //   child: Image.network(url),
          //   fit: BoxFit.fill,
          // ),
          // Image(
          //   image: NetworkImage(url),
          //   fit: BoxFit.cover,
          // ),
          new Image.network(
            url,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.8,
          ),

          // positioned to determine the exact position.
          Align(
            alignment: Alignment.topCenter,
            child: Positioned(
              // text widget on top of image
              // left: MediaQuery.of(context).size.width * 0.4,
              top: 20,
              child: Column(
                children: [
                  Text(
                    '50-80% OFF',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    'In Ethnic Wear',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          // shop now button
          Align(
              alignment: Alignment.bottomCenter,
              // bottom: 8.0,
              // left: 0,
              child: Material(
                color: Colors.transparent,
                child: custom_button(
                  text: "Shop Now",
                ),
              )),
        ],
      ),
    );
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
        child: Container(
            color: Colors.redAccent,
            width: 80,
            height: 20,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ))),
      ),
    );
  }
}

class trending_choices_container extends StatelessWidget {
  trending_choices_container({@required this.title, @required this.url});
  final String title;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.035,
              top: 13.0,
              right: MediaQuery.of(context).size.width * 0.035,
              bottom: 5.0),
          width: MediaQuery.of(context).size.width * 0.18,
          height: MediaQuery.of(context).size.width * 0.18,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(url),
            ),
          ),
        ),
        Text(title, style: TextStyle(fontSize: 16.0)),
      ],
    );
  }
}

class featured_brands_container extends StatelessWidget {
  featured_brands_container();

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
            border: Border.all(
                color: Colors.deepOrangeAccent,
                width: 2.0,
                style: BorderStyle.solid),
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
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUwCne75bhNewmpIyqGqTLBixIC_pkBqsocg&usqp=CAU'),
                fit: BoxFit.cover),
          ),
          //to change container height and width
          height: size.height * 0.27,
          width: size.width * 0.42,
          // contains stack to include two text and shop botton
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: <Widget>[
              // for text
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Personal Care',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '20-30% OFF',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // for shop button
              Positioned(
                  // defining the position of shop button
                  top: size.height * 0.27 -
                      25, //using the same height of container
                  left: size.width * 0.21 - 25, // using container width/2
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
                          Icons.shopping_cart_sharp,
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

class recommended_picks_container extends StatelessWidget {
  recommended_picks_container({@required this.url});
  // final String title;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          elevation: 8.0,
          child: Container(
            height: 130,
            width: MediaQuery.of(context).size.width * 0.28,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFEF5350).withOpacity(0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          height: 38,
          width: MediaQuery.of(context).size.width * 0.28,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.026,
              top: 13.0,
              right: MediaQuery.of(context).size.width * 0.026,
              bottom: 0.0),
          child: Center(
            child: Text(
              '20-30% OFF',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

class exciting_offers_container extends StatelessWidget {
  exciting_offers_container({@required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.041,
              top: 13.0,
              right: MediaQuery.of(context).size.width * 0.041,
              bottom: 5.0),
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.width * 0.25,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.redAccent,
            gradient: LinearGradient(
              colors: [
                Colors.red.shade500,
                Colors.red.shade100,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
            ),
          ),
          child: Center(
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}

class sponsored_brands_carousel_container extends StatelessWidget {
  sponsored_brands_carousel_container({@required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      // this is the main container
      // decorations - border ,shadow
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.red, width: 3.0, style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 4.0, spreadRadius: 4.0)
          ]),
      // image , text and button in stack .
      child: Stack(
        children: <Widget>[
          new Image.network(
            url,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.8,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.transparent,
                child: custom_button(
                  text: "Shop Now",
                ),
              )),
        ],
      ),
    );
  }
}

class top_categories_container extends StatelessWidget {
  top_categories_container({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 12.0, right: 8.0, bottom: 20.0),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.47,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            border: Border.all(color: Colors.red.shade900),
            gradient: LinearGradient(
              colors: [
                Colors.red.shade800,
                Colors.red.shade50,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1617627143750-d86bc21e42bb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                'Ethnic Wear',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
              ),
              Text(
                '50-80% OFF',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
      ),
    );
  }
}
