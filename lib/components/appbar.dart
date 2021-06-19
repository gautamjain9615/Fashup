import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  Carousel();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          // this is the main container
          // decorations - border ,shadow
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.red, width: 3.0, style: BorderStyle.solid),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 4.0, spreadRadius: 4.0)
              ]),
          // image , text and button in stack .
          child: Stack(
            children: <Widget>[
              Image.network(
                  'https://th.bing.com/th/id/OIP.EFtxW5jxd38XQHlTx9lfIwHaEK?pid=ImgDet&rs=1'),
              // positioned to determine the exact position.
              Positioned(
                // text widget on top of image
                left: MediaQuery.of(context).size.width * 0.4,

                top: 6.0,
                child: Column(
                  children: [
                    Text(
                      'Text 1',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    Text(
                      'Text 2',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
              // shop now button
              Positioned(
                  bottom: 6.0,
                  left: MediaQuery.of(context).size.width / 3,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        print('hello');
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(14.0, 6.0, 14.0, 6.0),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0))),
                        child: Text(
                          'Shop Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),

        //2nd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: ExactAssetImage("images/image2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //3rd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: ExactAssetImage("images/image2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        height: 250.0,
        // enlargeCenterPage: true,
        // autoPlay: true,
        // aspectRatio: 7 / 5,
        // autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        viewportFraction: 0.6,
      ),
    );
  }
}
