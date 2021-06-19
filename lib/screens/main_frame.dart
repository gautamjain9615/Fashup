import 'package:fashup/screens/vendor_screen.dart';
import 'package:flutter/material.dart';
import 'package:fashup/screens/categories_screen.dart';
import 'package:fashup/screens/home_screen.dart';
import 'package:fashup/screens/wishlist.dart';
import 'package:fashup/screens/shopping_cart.dart';

class MainFrame extends StatefulWidget {
  static String id = 'main_frame';

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  int _pageIndex = 0;
  PageController _pageController;
  // int _selectedIndex = 0;
  // List _widgetOptions = [
  //   HomeScreen(),
  //   CategoriesScreen(),
  //   VendorScreen(),
  //   Text(
  //     'Offers',
  //   ),
  //   Text(
  //     'Discover',
  //   ),
  //   Text(
  //     'Profile',
  //   ),
  // ];
  List<Widget> tabPages = [
    HomeScreen(),
    CategoriesScreen(),
    VendorScreen(),
    Text(
      'Offers',
    ),
    Text(
      'Discover',
    ),
    Text(
      'Profile',
    ),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Material(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MainFrame.id);
            },
            child: Container(
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(20.0),
                child:
                    Image.asset('images/logo.jpg', width: 95.0, height: 50.0),
              ),
            ),
          ),
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, Wishlist.id);
            },
          ), //IconButton
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, ShoppingCart.id);
            },
          ), //IconButton
        ], //<Widget>[]
        backgroundColor: Colors.white,
        // elevation: 50.0,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          color: Colors.redAccent,
          tooltip: 'Menu Icon',
          onPressed: () {},
        ), //IconButton
        brightness: Brightness.dark,
      ),
      //AppBar
      // body: _widgetOptions.elementAt(_selectedIndex),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.redAccent,
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.black.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          // onTap: (value) {
          //   // Respond to item press.
          // },
          // currentIndex: _selectedIndex,
          // onTap: _onItemTapped,
          currentIndex: _pageIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Categories',
              icon: Icon(Icons.view_list_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Vendors',
              icon: Icon(Icons.store_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Offers',
              icon: Icon(Icons.price_change_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Discover',
              icon: Icon(Icons.trending_up_outlined),
            ),
            BottomNavigationBarItem(
              label: 'My Profile',
              icon: Icon(Icons.person_outline_rounded),
            ),
          ],
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
