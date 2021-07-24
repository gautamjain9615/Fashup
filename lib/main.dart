import 'package:fashup/screens/categories_secondary.dart';
import 'package:fashup/screens/home_screen.dart';
import 'package:fashup/screens/introduction_screen.dart';
import 'package:fashup/screens/categories_screen.dart';
import 'package:fashup/screens/search_screen.dart';
import 'package:fashup/screens/vendor_screen.dart';
import 'package:fashup/screens/main_frame.dart';
import 'package:fashup/screens/wishlist.dart';
import 'package:fashup/screens/shopping_cart.dart';
import 'package:fashup/screens/discover_screen.dart';
import 'package:fashup/screens/blog_profile.dart';
import 'package:fashup/screens/registration_screen.dart';
import 'package:fashup/screens/login_screen.dart';
import 'package:fashup/screens/blog_post.dart';
import 'package:fashup/screens/blogpost_view.dart';
import 'package:fashup/screens/blogvideo_view.dart';
import 'package:fashup/screens/blog_video.dart';
import 'package:fashup/screens/bookmarks.dart';
import 'package:fashup/screens/reviews.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fashup/screens/initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: Colors.redAccent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0 || initScreen == null
          ? IntroductionScreen.id
          : Initialize.id,
      routes: {
        IntroductionScreen.id: (context) => IntroductionScreen(),
        MainFrame.id: (context) => MainFrame(),
        HomeScreen.id: (context) => HomeScreen(),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        CategoriesSecondary.id: (context) => CategoriesSecondary(),
        VendorScreen.id: (context) => VendorScreen(),
        DiscoverScreen.id: (context) => DiscoverScreen(),
        Wishlist.id: (context) => Wishlist(),
        ShoppingCart.id: (context) => ShoppingCart(),
        SearchScreen.id: (context) => SearchScreen(),
        BlogProfile.id: (context) => BlogProfile(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        BlogPost.id: (context) => BlogPost(),
        BlogPostView.id: (context) => BlogPostView(),
        BlogVideo.id: (context) => BlogVideo(),
        BlogVideoView.id: (context) => BlogVideoView(),
        Initialize.id: (context) => Initialize(),
        Bookmarks.id: (context) => Bookmarks(),
        Reviews.id: (context) => Reviews(),
      },
    );
  }
}
