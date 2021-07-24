import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashup/screens/blog_post.dart';

class BlogPostView extends StatefulWidget {
  static String id = 'blogpost_view';

  @override
  _BlogPostViewState createState() => _BlogPostViewState();
}

class _BlogPostViewState extends State<BlogPostView> {
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
