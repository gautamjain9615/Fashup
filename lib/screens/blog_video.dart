import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';

class BlogVideo extends StatefulWidget {
  static String id = 'blog_video';

  @override
  _BlogVideoState createState() => _BlogVideoState();
}

class _BlogVideoState extends State<BlogVideo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Material(
              color: Colors.transparent,
              child: Container(color: Colors.transparent, child: VideoApp())),
          Positioned(
            left: 10,
            top: size.height * 0.08,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )),
                SizedBox(
                  width: 15,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('+ Fashion',
                          style:
                              TextStyle(fontSize: 25, color: Colors.redAccent)),
                      SizedBox(
                        height: 5,
                      ),
                      Flexible(
                          child: Text(
                        'How to get cheap stylish products',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.visible,
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: Column(
              children: [
                Icon(
                  Icons.chat,
                  size: 40,
                ),
                Text(
                  '40',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.favorite,
                  size: 40,
                ),
                Text(
                  '20',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.share,
                  size: 40,
                ),
                Text(
                  '10',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            right: 10,
            bottom: 20,
          ),
          Positioned(
            child: Container(
              width: size.width * 3 / 4,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/rachel.jpg'),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Prachi Aggarwal',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Flexible(
                      child: Text(
                    'Best product seen in a while #SmallBusinesses #fashion #influencer',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: Text(
                        'SHOP THE LOOK',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.8),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),

                        // context and builder are
                        // required properties in this widget
                        context: context,
                        builder: (BuildContext context) {
                          // we set up a container inside which
                          // we create center column and display text
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                color: Colors.black.withOpacity(0.5)),
                            padding: EdgeInsets.only(left: 20),
                            height: size.height * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Shop from the brand ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: size.height * 1 / 8 - 5,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        width: size.width * 1 / 3,
                                        child: SizedBox(
                                          height: size.height * 1 / 8 - 5,
                                        ),

                                        // height: size.height/5-10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/facebook.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: size.width * 1 / 3,
                                        child: SizedBox(
                                          height: size.height * 1 / 8 - 5,
                                        ),

                                        // height: size.height/5-10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/facebook.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: size.width * 1 / 3,
                                        child: SizedBox(
                                          height: size.height * 1 / 8 - 5,
                                        ),

                                        // height: size.height/5-10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/facebook.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: size.width * 1 / 3,
                                        child: SizedBox(
                                          height: size.height * 1 / 8 - 5,
                                        ),

                                        // height: size.height/5-10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/facebook.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: size.width * 1 / 3,
                                        child: SizedBox(
                                          height: size.height * 1 / 8 - 5,
                                        ),

                                        // height: size.height/5-10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/facebook.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: size.width * 1 / 3,
                                        child: SizedBox(
                                          height: size.height * 1 / 8 - 5,
                                        ),

                                        // height: size.height/5-10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/facebook.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Shop the product',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  height: size.height * 0.3 - 33,
                                  child: ListView(children: [
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: size.width * 1 / 4,
                                            child: SizedBox(
                                              height: size.height * 1 / 8 + 2,
                                            ),

                                            // height: size.height/5-10,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'images/facebook.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('Black women padded jacket',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 18)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rs 3000  (20% off) ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors
                                                              .redAccent
                                                              .withOpacity(
                                                                  0.7)),
                                                      child: Icon(
                                                          Icons.shopping_cart,
                                                          size: 18)),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.redAccent
                                                            .withOpacity(0.7)),
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: size.width * 1 / 4,
                                            child: SizedBox(
                                              height: size.height * 1 / 8 + 2,
                                            ),

                                            // height: size.height/5-10,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'images/facebook.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('Black women padded jacket',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 18)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rs 3000  (20% off) ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors
                                                              .redAccent
                                                              .withOpacity(
                                                                  0.7)),
                                                      child: Icon(
                                                          Icons.shopping_cart,
                                                          size: 18)),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.redAccent
                                                            .withOpacity(0.7)),
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: size.width * 1 / 4,
                                            child: SizedBox(
                                              height: size.height * 1 / 8 + 2,
                                            ),

                                            // height: size.height/5-10,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'images/facebook.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('Black women padded jacket',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 18)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rs 3000  (20% off) ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors
                                                              .redAccent
                                                              .withOpacity(
                                                                  0.7)),
                                                      child: Icon(
                                                          Icons.shopping_cart,
                                                          size: 18)),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.redAccent
                                                            .withOpacity(0.7)),
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: size.width * 1 / 4,
                                            child: SizedBox(
                                              height: size.height * 1 / 8 + 2,
                                            ),

                                            // height: size.height/5-10,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'images/facebook.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('Black women padded jacket',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 18)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rs 3000  (20% off) ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors
                                                              .redAccent
                                                              .withOpacity(
                                                                  0.7)),
                                                      child: Icon(
                                                          Icons.shopping_cart,
                                                          size: 18)),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.redAccent
                                                            .withOpacity(0.7)),
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            bottom: 50,
            left: 20,
          ),
        ],
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0.7); // set volume of video from here.
        _controller.setLooping(true); // set looping from here.
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Center(
        child: _controller.value.isInitialized
            ? LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox.expand(
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth *
                                _controller.value.aspectRatio,
                            child: Stack(
                              children: [
                                VideoPlayer(_controller),
                                // Positioned(child: Container(child: animatior()))
                              ],
                            ))),
                  );
                },
              )
            : Container(),
      ),
      onTap: () {
        setState(() {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            // If the video is paused, play it.
            _controller.play();
          }
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// class _VideoAppState extends State<VideoApp> {
//   VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('images/video.mp4')
//       ..initialize().then((_) {
//         _controller.setVolume(0.7); // set volume of video from here.
//         _controller.setLooping(true); // set looping from here.
//         _controller.play();
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Center(
//       child: _controller.value.isInitialized
//           ? LayoutBuilder(
//               builder: (context, constraints) {
//                 return SizedBox.expand(
//                   child: FittedBox(
//                       fit: BoxFit.cover,
//                       child: SizedBox(
//                           height: constraints.maxHeight,
//                           width: constraints.maxWidth *
//                               _controller.value.aspectRatio,
//                           child: VideoPlayer(_controller))),
//                 );
//               },
//             )
//           : Container(),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
