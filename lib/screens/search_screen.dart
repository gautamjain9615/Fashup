import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            // main container
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Center(
              child: Text(
            "Search",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
          )),
        ),
        Container(
          // alignment: Alignment.center,
          // margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
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
                      hintText: "Shop...",
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
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Recently Viewed',
            style:
                TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            recently_viewed_container(
                title: "Lehnga Choli",
                price: "7999",
                url:
                    'https://cdn1.ninecolours.com/image/cache/products-2018/June-2020/Soft-Net-Lehenga-Choli-In-Yellow-Colour-LD1046298-A-1200x1799.jpg'),
            recently_viewed_container(
                title: "Lehnga Choli",
                price: "7999",
                url:
                    'https://cdn1.ninecolours.com/image/cache/products-2018/June-2020/Soft-Net-Lehenga-Choli-In-Yellow-Colour-LD1046298-A-1200x1799.jpg'),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Recommended Search',
            style:
                TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.end,
          alignment: WrapAlignment.start,
          // spacing: 0,
          runSpacing: 10,
          children: <Widget>[
            recommended_search_container(text: "Watches for men"),
            recommended_search_container(text: "gifts"),
            recommended_search_container(text: "jeans"),
            recommended_search_container(text: "sarees with blouse"),
            recommended_search_container(text: "earrings"),
            recommended_search_container(text: "bags"),
            recommended_search_container(text: "caps"),
            recommended_search_container(text: "hazelnut coffee")
          ],
        ),
      ],
    )));
  }
}

class recommended_search_container extends StatelessWidget {
  recommended_search_container({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
      ),
      padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        border: Border.all(),
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}

class recently_viewed_container extends StatelessWidget {
  recently_viewed_container(
      {@required this.title, @required this.price, @required this.url});
  final String title;
  final String price;
  final String url;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.all(4),
      // padding: EdgeInsets.all(2),
      height: 100,
      width: size.width / 2 - 10,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8),
            width: size.width * 0.2,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
                Text(
                  "Rs. " + price,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
