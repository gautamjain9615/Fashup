import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashup/screens/blog_post.dart';

class BlogView extends StatefulWidget {
  static String id = 'blog_view';

  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        BlogPost(),
        BlogPost(),
        BlogPost(),
        BlogPost(),
        BlogPost(),
        BlogPost(),
      ],
    );
  }
}
