import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashup/components/appbar.dart';
import 'package:fashup/screens/blogpost_view.dart';

class BlogProfile extends StatefulWidget {
  static String id = 'blog_profile';

  @override
  _BlogProfileState createState() => _BlogProfileState();
}

class _BlogProfileState extends State<BlogProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: Custom_Appbar(colour: Colors.transparent, elev: 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.38,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.27,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://images.pexels.com/photos/934070/pexels-photo-934070.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  1.0, 14.0, 42.0, 0.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '660k',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                    'Followers',
                                    style: TextStyle(fontSize: 18.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  45.0, 14.0, 1.0, 0.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '20k',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                    'Following',
                                    style: TextStyle(fontSize: 18.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.7,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.192,
                  left: MediaQuery.of(context).size.width * 0.5 - 68,
                  child: CircleAvatar(
                    radius: 68.0,
                    backgroundColor: Colors.deepPurple,
                    child: CircleAvatar(
                      radius: 64.0,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/4456815/pexels-photo-4456815.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Ishita Singhal',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Mathura',
                  style: TextStyle(fontSize: 20.0, color: Colors.red),
                ),
                SizedBox(height: 12.0),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Follow',
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 0.4,
            ),
            Container(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: TabBar(
                        labelStyle: TextStyle(fontSize: 20.0),
                        indicatorColor: Colors.redAccent,
                        labelColor: Colors.redAccent,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(text: 'Posts'),
                          Tab(text: 'Videos'),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      // width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                      ),
                      child: TabBarView(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 25.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Photos(
                                      ImageURL:
                                          'https://images.pexels.com/photos/610294/pexels-photo-610294.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                  Photos(
                                      ImageURL:
                                          'https://images.pexels.com/photos/610294/pexels-photo-610294.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                ],
                              ),
                              SizedBox(height: 25.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Photos(
                                      ImageURL:
                                          'https://images.pexels.com/photos/610294/pexels-photo-610294.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                  Photos(
                                      ImageURL:
                                          'https://images.pexels.com/photos/610294/pexels-photo-610294.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                ],
                              ),
                              SizedBox(height: 25.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Photos(
                                      ImageURL:
                                          'https://images.pexels.com/photos/610294/pexels-photo-610294.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                  Photos(
                                      ImageURL:
                                          'https://images.pexels.com/photos/610294/pexels-photo-610294.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Videos(),
                                    SizedBox(width: 12.0),
                                    Videos(),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Videos(),
                                    SizedBox(width: 12.0),
                                    Videos(),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
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

class Videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.38,
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
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.38,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.1,
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
                      padding: const EdgeInsets.fromLTRB(4.0, 5.0, 4.0, 5.0),
                      child: Flexible(
                        child: Text('How to get cheap stylish products',
                            style: TextStyle(fontSize: 22.0),
                            overflow: TextOverflow.clip),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
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
            ],
          ),
        ),
      ],
    );
  }
}

class Photos extends StatelessWidget {
  Photos({@required this.ImageURL});
  final String ImageURL;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BlogView.id);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          image:
              DecorationImage(image: NetworkImage(ImageURL), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
