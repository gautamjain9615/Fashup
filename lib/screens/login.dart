import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fashup_in/screens/forgot.dart';
// import 'package:fashup/screens/homepage.dart';
// import 'package:fashup_in/screens/signup.dart';
// import 'package:fashup_in/utilities/constants.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;

  var _formkey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [Colors.black, Colors.black45, Colors.black],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Fashup",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lobster',
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "the fashion world",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Dance',
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  topRight: Radius.circular(60))),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 30, right: 30, left: 30, bottom: 2),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Form(
                                    key: _formkey,
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          // validator: (item) {
                                          //   return item!.contains("@")
                                          //       ? null
                                          //       : "Enter valid Email";
                                          // },
                                          onChanged: (item) {
                                            setState(() {
                                              _email = item;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30.0))),
                                            hintText:
                                                'Enter Email/phone number',
                                            labelText: 'Email',
                                            hintStyle:
                                                TextStyle(color: Colors.black),
                                            prefixIcon: Icon(Icons.email),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          // validator: (item) {
                                          //   return item!.length > 6
                                          //       ? null
                                          //       : "Password must be 6 characters";
                                          // },
                                          onChanged: (item) {
                                            setState(() {
                                              _password = item;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintStyle:
                                                TextStyle(color: Colors.black),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30.0))),
                                            hintText: 'Enter Password',
                                            labelText: 'Password',
                                            prefixIcon:
                                                Icon(Icons.vpn_key_outlined),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          // Navigator.pushNamed(
                                          //     context, Forgot.id);
                                        },
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  RaisedButton(
                                    elevation: 5,
                                    onPressed: () {
                                      // login();
                                    },
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 80, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: Colors.orange[900],
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          backgroundColor: Colors.orange[900]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "__OR__",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      // SignInButton(
                                      //   Buttons.FacebookNew,
                                      //   text: 'Sign in with Facebook',
                                      //   onPressed: () {},
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  // SignInButton(
                                  //   Buttons.GoogleDark,
                                  //   text: "Sign in with Google",
                                  //   onPressed: () {},
                                  // ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50.0),
                                        child: Text(
                                          'Dont have an Account?',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            // Navigator.pushNamed(
                                            //     context, Signup.id);
                                          },
                                          child: Text(
                                            'SignUp',
                                            style: TextStyle(fontSize: 20),
                                          ))
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }

  // void login() {
  //   if (_formkey.currentState!.validate()) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: _email, password: _password)
  //         .then((user) async {
  //       // sign up
  //       setState(() {
  //         isLoading = false;
  //       });
  //
  //       // Fluttertoast.showToast(msg: "Login Success");
  //
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (context) => Homepage()),
  //           (route) => false);
  //     }).catchError((onError) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       // Fluttertoast.showToast(msg: "error " + onError.toString());
  //     });
  //   }
  // }
}
