import 'package:fashup/screens/vendor_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashup/screens/categories_screen.dart';
import 'package:fashup/screens/home_screen.dart';
import 'package:fashup/screens/discover_screen.dart';
import 'package:fashup/screens/wishlist.dart';
import 'package:fashup/screens/shopping_cart.dart';
import 'package:fashup/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fashup/screens/bookmarks.dart';
import 'package:fashup/screens/reviews.dart';

class MainFrame extends StatefulWidget {
  static String id = 'main_frame';

  @override
  _MainFrameState createState() => _MainFrameState();
}

final _auth = FirebaseAuth.instance;

// class _MainFrameState extends State<MainFrame> {
//   int _pageIndex = 0;
//   PageController _pageController;
//
//   List<Widget> tabPages = [
//     HomeScreen(),
//     CategoriesScreen(),
//     VendorScreen(),
//     Text(
//       'Offers',
//     ),
//     DiscoverScreen(),
//     Text(
//       'Profile',
//     ),
//   ];
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _pageIndex);
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//           activeColor: Colors.redAccent,
//           border: Border(
//             top: BorderSide(color: Colors.redAccent),
//           ),
//           // iconSize: 30,
//           items: [
//             BottomNavigationBarItem(
//               label: 'Home',
//               icon: Icon(Icons.home_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Categories',
//               icon: Icon(Icons.now_widgets_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Vendors',
//               icon: Icon(Icons.store_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Offers',
//               icon: Icon(Icons.price_change_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Discover',
//               icon: Icon(Icons.trending_up_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'My Profile',
//               icon: Icon(Icons.person_outline_rounded),
//             ),
//           ]),
//       tabBuilder: (context, index) {
//         switch (index) {
//           case 0:
//             return CupertinoTabView(builder: (context) {
//               return Scaffold(
//                 appBar: PreferredSize(
//                   preferredSize: Size.fromHeight(
//                       MediaQuery.of(context).size.height *
//                           0.08), // here the desired height
//                   child: appbar(),
//                 ),
//                 body: HomeScreen(),
//               );
//             });
//           case 1:
//             return CupertinoTabView(builder: (context) {
//               return Scaffold(
//                 appBar: PreferredSize(
//                   preferredSize: Size.fromHeight(
//                       MediaQuery.of(context).size.height *
//                           0.08), // here the desired height
//                   child: appbar(),
//                 ),
//                 body: CategoriesScreen(),
//               );
//             });
//           case 2:
//             return CupertinoTabView(builder: (context) {
//               return Scaffold(
//                 body: VendorScreen(),
//               );
//             });
//           case 3:
//             return CupertinoTabView(builder: (context) {
//               return Scaffold(
//                 body: Text("Offers"),
//               );
//             });
//           case 4:
//             return CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(
//                 child: DiscoverScreen(),
//               );
//             });
//           case 5:
//             return CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(
//                 child: Text("Profile"),
//               );
//             });
//           default:
//             return CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(
//                 child: HomeScreen(),
//               );
//             });
//         }
//       },
//     );
//   }
// }

// class _MainFrameState extends State<MainFrame> {
//   int _selectedIndex = 0;
//   String _currentPage = 'Page1';
//
//   List<String> pageKeys = [
//     "Page1",
//     "Page2",
//     "Page3",
//     "Page4",
//     "Page5",
//     "Page6"
//   ];
//   Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
//     "Page1": GlobalKey<NavigatorState>(),
//     "Page2": GlobalKey<NavigatorState>(),
//     "Page3": GlobalKey<NavigatorState>(),
//     "Page4": GlobalKey<NavigatorState>(),
//     "Page5": GlobalKey<NavigatorState>(),
//     "Page6": GlobalKey<NavigatorState>(),
//   };
//
//   void _selectTab(String tabItem, int index) {
//     if (tabItem == _currentPage) {
//       _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
//     } else {
//       setState(() {
//         _currentPage = pageKeys[index];
//         _selectedIndex = index;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         final isFirstRouteInCurrentTab =
//             !await _navigatorKeys[_currentPage].currentState.maybePop();
//         if (isFirstRouteInCurrentTab) {
//           if (_currentPage != "Page1") {
//             _selectTab("Page1", 1);
//             return false;
//           }
//         }
//         return isFirstRouteInCurrentTab;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, MainFrame.id);
//               },
//               // onTap: () {
//               //   Navigator.push(
//               //       context,
//               //       new MaterialPageRoute(
//               //           builder: (BuildContext context) => new HomeScreen()));
//               // },
//               child: Image.asset('images/logo.png', width: 95.0, height: 50.0)),
//
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.favorite_border),
//               color: Colors.black,
//               onPressed: () {
//                 Navigator.pushNamed(context, Wishlist.id);
//               },
//             ), //IconButton
//             IconButton(
//               icon: Icon(Icons.shopping_cart_outlined),
//               color: Colors.black,
//               onPressed: () {
//                 Navigator.pushNamed(context, ShoppingCart.id);
//               },
//             ), //IconButton
//           ], //<Widget>[]
//           backgroundColor: Colors.white,
//           elevation: 8,
//           leading: IconButton(
//             icon: Icon(Icons.menu_rounded),
//             color: Colors.black,
//             tooltip: 'Menu Icon',
//             onPressed: () {},
//           ), //IconButton
//           brightness: Brightness.dark,
//         ),
//         body: Stack(children: <Widget>[
//           _buildOffstageNavigator("Page1"),
//           _buildOffstageNavigator("Page2"),
//           _buildOffstageNavigator("Page3"),
//           _buildOffstageNavigator("Page4"),
//           _buildOffstageNavigator("Page5"),
//           _buildOffstageNavigator("Page6"),
//         ]),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           selectedItemColor: Colors.redAccent,
//           unselectedItemColor: Colors.black.withOpacity(.60),
//           selectedFontSize: 14,
//           unselectedFontSize: 12,
//           onTap: (int index) {
//             _selectTab(pageKeys[index], index);
//           },
//           currentIndex: _selectedIndex,
//           items: [
//             BottomNavigationBarItem(
//               label: 'Home',
//               icon: Icon(Icons.home_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Categories',
//               icon: Icon(Icons.now_widgets_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Vendors',
//               icon: Icon(Icons.store_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Offers',
//               icon: Icon(Icons.price_change_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Discover',
//               icon: Icon(Icons.trending_up_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'My Profile',
//               icon: Icon(Icons.person_outline_rounded),
//             ),
//           ],
//           type: BottomNavigationBarType.fixed,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOffstageNavigator(String tabItem) {
//     return Offstage(
//       offstage: _currentPage != tabItem,
//       child: TabNavigator(
//         navigatorKey: _navigatorKeys[tabItem],
//         tabItem: tabItem,
//       ),
//     );
//   }
// }

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (tabItem == 'Page1')
      child = HomeScreen();
    else if (tabItem == 'Page2')
      child = CategoriesScreen();
    else if (tabItem == 'Page3')
      child = VendorScreen();
    else if (tabItem == 'Page4')
      child = Text("Offers");
    else if (tabItem == 'Page5')
      child = DiscoverScreen();
    else if (tabItem == 'Page6') child = Text("My profile");

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}

// enum TabItem { red, green, blue }
//
// Map<TabItem, String> tabName = {
//   TabItem.red: 'red',
//   TabItem.green: 'green',
//   TabItem.blue: 'blue',
// };
//
// Map<TabItem, MaterialColor> activeTabColor = {
//   TabItem.red: Colors.red,
//   TabItem.green: Colors.green,
//   TabItem.blue: Colors.blue,
// };

// class BottomNavigation extends StatelessWidget {
//   BottomNavigation({this.currentTab, this.onSelectTab});
//   final TabItem currentTab;
//   final ValueChanged<TabItem> onSelectTab;
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       items: [
//         _buildItem(tabItem: TabItem.red),
//         _buildItem(tabItem: TabItem.green),
//         _buildItem(tabItem: TabItem.blue),
//       ],
//       onTap: (index) => onSelectTab(
//         TabItem.values[index],
//       ),
//     );
//   }
//
//   BottomNavigationBarItem _buildItem({TabItem tabItem}) {
//     String text = tabName[tabItem];
//     IconData icon = Icons.layers;
//     return BottomNavigationBarItem(
//       icon: Icon(
//         icon,
//         color: _colorTabMatching(item: tabItem),
//       ),
//       title: Text(
//         text,
//         style: TextStyle(
//           color: _colorTabMatching(item: tabItem),
//         ),
//       ),
//     );
//   }
//
//   Color _colorTabMatching({TabItem item}) {
//     return currentTab == item ? activeTabColor[item] : Colors.grey;
//   }
// }

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
    DiscoverScreen(),
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
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MainFrame.id);
          },
          child: Image.asset('images/logo.png', width: 95.0, height: 50.0),
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
          color: Colors.black,
          tooltip: 'Menu Icon',
          onPressed: () {
            if (_scaffoldKey.currentState.isDrawerOpen == false) {
              _scaffoldKey.currentState.openDrawer();
            } else {
              _scaffoldKey.currentState.openEndDrawer();
            }
          },
        ), //IconButton
        brightness: Brightness.dark,
      ),
      //AppBar
      key: _scaffoldKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            // const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.redAccent,
            //   ),
            //   child: Center(child: Text("User name")),
            // ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.0, color: Colors.grey),
                ),
                color: Colors.redAccent,
              ),
              padding: EdgeInsets.fromLTRB(0, 60, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                    minRadius: 40,
                    maxRadius: 40,
                  ),
                  Column(
                    children: [
                      Text(
                        "Prachi Agrawal",
                        style: TextStyle(fontSize: 19),
                      ),
                      SizedBox(height: 10),
                      Text("8884445556"),
                      Text("ag.pra65@gmail.com")
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 7),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              GestureDetector(
                  onTap: () {},
                  child: Column(children: [
                    Icon(Icons.edit_outlined),
                    Text("Edit Profile")
                  ])),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Bookmarks.id);
                  },
                  child: Column(children: [
                    Icon(Icons.bookmark_outline),
                    Text("Bookmarks")
                  ])),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Reviews.id);
                  },
                  child: Column(children: [
                    Icon(Icons.reviews_outlined),
                    Text("Reviews")
                  ])),
              GestureDetector(
                  onTap: () {},
                  child: Column(children: [
                    Icon(Icons.settings_outlined),
                    Text("Settings")
                  ])),
            ]),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: const Text('Order History'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: const Text('Track Your Order'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: const Text('Wishlist'),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: const Text('Fashup Galleria'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.payments),
              title: const Text('Payment methods'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: const Text('Wallet'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: const Text('Saved cards'),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.place),
              title: const Text('Address'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.group_add),
              title: const Text('Refer and earn'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await _auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
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
              icon: Icon(Icons.now_widgets_outlined),
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
