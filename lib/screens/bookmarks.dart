import 'package:flutter/material.dart';
import 'package:fashup/components/appbar.dart';

class Bookmarks extends StatefulWidget {
  static String id = 'Bookmarks';

  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(size.height * 0.07), // here the desired height
        child: Custom_Appbar(colour: Colors.white, elev: 8.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search Bookmarks",
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
            Widget1(),
            Widget1(),
            Widget1()
          ],
        ),
      ),
      // body: Widget1(),
    );
  }
}

class Widget1 extends StatelessWidget {
  Widget1();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      // height: size.height * 0.64,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(), bottom: BorderSide())),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 0.01 * size.height,
              ),
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
                width: 0.01 * size.height,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Amisha Patel',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '2.3k followers',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 0.01 * size.height,
          ),
          Image.network(
              'http://rebekkabruggner.com/wp-content/uploads/2014/09/fashion_03_DSC9831_B.jpg',
              width: size.width,
              height: size.height * 0.4 - size.height * 0.02,
              fit: BoxFit.fill),
          SizedBox(
            height: 0.01 * size.height,
          ),
          Row(
            children: [
              SizedBox(
                width: 0.02 * size.height,
              ),
              Icon(Icons.favorite),
              Text('10'),
              SizedBox(
                width: 0.02 * size.height,
              ),
              Icon(Icons.chat),
              Text('30'),
              SizedBox(
                width: 0.02 * size.height,
              ),
              Icon(Icons.share),
            ],
          ),
          SizedBox(
            height: 0.02 * size.height,
          ),
          Row(
            children: [
              SizedBox(
                width: 0.01 * size.height,
              ),
              Text(
                '+ ',
                style: TextStyle(color: Colors.red),
              ),
              Text(
                'Fashion',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              'How to get cheap stylish product at great prices dsafdafd asdfasfdasf asdfasdfsadfasfdsdaf sadfasdfafdsf',
              style: TextStyle(fontSize: 18),
              // overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
