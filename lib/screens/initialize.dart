import 'package:flutter/material.dart';
import 'package:fashup/screens/main_frame.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fashup/screens/login_screen.dart';

class Initialize extends StatefulWidget {
  static const String id = 'initialize';
  @override
  _InitializeState createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {
  FirebaseAuth _auth;
  User _user;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? LoginScreen()
            : MainFrame();
  }
}
