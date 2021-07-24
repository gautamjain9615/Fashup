// import 'package:fashup_in/screens/registration_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static const String id = 'homepage';
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // late User user;
  // bool isloggedin = false;
  //
  // checkAuthentification() async {
  //   _auth.authStateChanges().listen((user) {
  //     if (user == null) {
  //       Navigator.pushAndRemoveUntil(context,
  //           MaterialPageRoute(builder: (context) => Login()), (route) => false);
  //     }
  //   });
  // }
  //
  // getUser() async {
  //   User? firebaseUser = _auth.currentUser;
  //   await firebaseUser?.reload();
  //   firebaseUser = _auth.currentUser;
  //
  //   if (firebaseUser != null) {
  //     setState(() {
  //       this.user = firebaseUser!;
  //       this.isloggedin = true;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   this.checkAuthentification();
  //   this.getUser();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Text('sai'),
          Text('kiran'),
        ],
      )),
    );
  }
}
