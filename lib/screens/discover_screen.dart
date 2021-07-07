import 'package:fashup/components/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashup/screens/blog_profile.dart';
import 'package:fashup/screens/blogpost_view.dart';

class DiscoverScreen extends StatefulWidget {
  static String id = 'discover_screen';

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
            0.07), // here the desired height
        child: Custom_Appbar(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      top_container(onTap: () {
                        Navigator.pushNamed(context, BlogProfile.id);
                      }),
                      top_container(onTap: () {
                        Navigator.pushNamed(context, BlogProfile.id);
                      }),
                      top_container(onTap: () {
                        Navigator.pushNamed(context, BlogProfile.id);
                      }),
                      top_container(onTap: () {
                        Navigator.pushNamed(context, BlogProfile.id);
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                hr(title: "Top Content Creators"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      content_creators_container(
                          name: "Prachi Agrawal",
                          url:
                              "https://images.unsplash.com/photo-1584998316204-3b1e3b1895ae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                          value: "2.3",
                          onTap: () {
                            Navigator.pushNamed(context, BlogProfile.id);
                          }),
                      content_creators_container(
                          name: "Prachi Agrawal",
                          url:
                              "https://images.unsplash.com/photo-1584998316204-3b1e3b1895ae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                          value: "2.3",
                          onTap: () {
                            Navigator.pushNamed(context, BlogProfile.id);
                          }),
                      content_creators_container(
                          name: "Prachi Agrawal",
                          url:
                              "https://images.unsplash.com/photo-1584998316204-3b1e3b1895ae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                          value: "2.3",
                          onTap: () {
                            Navigator.pushNamed(context, BlogProfile.id);
                          }),
                      content_creators_container(
                          name: "Prachi Agrawal",
                          url:
                              "https://images.unsplash.com/photo-1584998316204-3b1e3b1895ae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                          value: "2.3",
                          onTap: () {
                            Navigator.pushNamed(context, BlogProfile.id);
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                DefaultTabController(
                    length: 6, // length of tabs
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            // height: 50,
                            child: TabBar(
                              labelColor: Colors.green,
                              indicatorColor: Colors.green,
                              unselectedLabelColor: Colors.black,
                              isScrollable: true,
                              labelStyle: TextStyle(fontSize: 18.0),
                              tabs: [
                                Tab(text: 'Top'),
                                Tab(text: 'Featured'),
                                Tab(text: 'Skincare'),
                                Tab(text: 'Haircare'),
                                Tab(text: 'Fashion'),
                                Tab(text: 'Sponsored'),
                              ],
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context)
                                  .size
                                  .height, //height of TabBarView
                              // decoration: BoxDecoration(
                              //     border: Border(
                              //         top: BorderSide(
                              //             color: Colors.grey, width: 5))),
                              child: TabBarView(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: [
                                      tabbar_widget(title: "Hello"),
                                      tabbar_widget(title: "Hello"),
                                      tabbar_widget(title: "Hello"),
                                      tabbar_widget(title: "Hello"),
                                      tabbar_widget(title: "Hello"),
                                      tabbar_widget(title: "Hello"),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text('Display Tab 2',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text('Display Tab 3',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text('Display Tab 4',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text('Display Tab 5',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text('Display Tab 6',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ]))
                        ])),
              ]),
        ),
      ),
    );
  }
}

class top_container extends StatelessWidget {
  top_container({@required this.onTap});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BlogView.id);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 12, 10, 5),
        width: MediaQuery.of(context).size.width * 0.60,
        height: MediaQuery.of(context).size.height * 0.40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/1004642/pexels-photo-1004642.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.60,
              // height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                color: Colors.transparent.withOpacity(0.06),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 4.0, 5.0),
                    child: Flexible(
                      child: Text('How to get cheap stylish products',
                          style: TextStyle(fontSize: 22.0),
                          overflow: TextOverflow.clip),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 4.0, 5.0),
                    child: Text(
                      '+ Fashion',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Prachi Aggarwal'),
                        Text('2.5k Followers')
                      ],
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/4380970/pexels-photo-4380970.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                      ),
                    )
                  ],
                ),
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

class content_creators_container extends StatelessWidget {
  content_creators_container(
      {@required this.name,
      @required this.url,
      @required this.value,
      @required this.onTap});
  final String name;
  final String url;
  final String value;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin:
                EdgeInsets.only(left: 20, top: 10.0, right: 20, bottom: 10.0),
            width: MediaQuery.of(context).size.width * 0.22,
            height: MediaQuery.of(context).size.width * 0.22,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(url),
              ),
            ),
          ),
        ),
        Text(name, style: TextStyle(fontSize: 15.0)),
        Text(value + "k followers", style: TextStyle(fontSize: 14.0)),
      ],
    );
  }
}

class tabbar_widget extends StatelessWidget {
  tabbar_widget({@required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Material(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, BlogView.id);
          },
          child: Container(
            width: size.width,
            // height: size.height * 0.13,
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    width: size.width * .25,
                    // height: size.width * 0.28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://i.pinimg.com/originals/96/21/2e/96212e6fa677cccd5380e5277898e5ec.jpg'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.stretch,
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// may be this cross axis alignment is the reason why i can't use main axis alignment inside row .
                    children: <Widget>[
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '+ Fashion',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5,
                            color: Colors.red),
                      ),

// simple text description of company
                      SizedBox(height: 5),
                      Text(
                        'this is random texxt ....',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),

                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, BlogProfile.id);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'http://www.celebzz.com/wp-content/uploads/2018/05/evan-rachel-wood-at-heavenly-bodies-fashion-the-catholic-imagination-costume-institute-gala-in-new-york-7.jpg'),
                                          fit: BoxFit.fill),
                                      shape: BoxShape.circle),
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Amisha Patel',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    '2.3k followers',
                                    style: TextStyle(fontSize: 12.5),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.chat),
                              Text('10'),
                              SizedBox(width: 10),
                              Icon(Icons.favorite),
                              Text('12'),
                              SizedBox(width: 15),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
