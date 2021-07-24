import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashup/screens/blog_video.dart';

class BlogVideoView extends StatefulWidget {
  static String id = 'blogVideo_view';

  @override
  _BlogVideoViewState createState() => _BlogVideoViewState();
}

class _BlogVideoViewState extends State<BlogVideoView> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: [
        BlogVideo(),
        BlogVideo(),
        BlogVideo(),
        BlogVideo(),
        BlogVideo(),
        BlogVideo(),
      ],
    );
  }
}
