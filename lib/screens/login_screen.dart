import 'package:flutter/material.dart';
import 'package:fashup/screens/registration_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fashup/screens/main_frame.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool showLoading = false;
  String verificationId;
  bool obs = true;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  String currentText = "";

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainFrame()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        SizedBox(height: 18),
        Text(
          "Enter OTP",
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  // GoogleSignIn googleAuth = new GoogleSignIn();
  fbSignIn() async {
    final fb = FacebookLogin();

// Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

// Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
        // Logged in
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainFrame()));
        // Send access token to server for validation and auth
        final FacebookAccessToken accessToken = res.accessToken;
        final AuthCredential authCredential =
            FacebookAuthProvider.credential(accessToken.token);
        final result =
            await FirebaseAuth.instance.signInWithCredential(authCredential);
        // Get profile data
        final profile = await fb.getUserProfile();
        print('Hello, ${profile.name}! You ID: ${profile.userId}');

        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        // Get email (since we request email permission)
        final email = await fb.getUserEmail();
        // But user can decline permission
        if (email != null) print('And your email is $email');
        userSetup(profile.name, email, "", "", "", "Facebook");

        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }
  }

  // FacebookLogin fbLogin = new FacebookLogin();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       ElevatedButton(
      //           onPressed: () {
      //             googleSignup(context);
      //           },
      //           child: Text("Google")),
      //       ElevatedButton(
      //           onPressed: () {
      //             fbSignIn();
      //           },
      //           child: Text("Facebook")),
      //       ElevatedButton(
      //           onPressed: () {
      //             Navigator.pushNamed(context, RegistrationScreen.id);
      //           },
      //           child: Text("New User? Click here")),
      //     ],
      //   ),
      // ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/8050084/pexels-photo-8050084.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
            color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(120.0, 60.0, 120.0, 10.0),
                child: Image.asset(
                  'images/fashup.png',
                  width: size.width * 3 / 8,
                ),
              ),
              Text(
                'Fashup Your Wardrobe!',
                style: TextStyle(fontSize: 19.0),
              ),
              SizedBox(height: 15),
              Container(
                width: size.width,
                // height: size.height -
                //     (size.height * 1 / 20 +
                //         size.width * 3 / 8 +
                //         size.height * 0.01 +
                //         3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                // padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 10.0,
                      child: Container(
                        padding: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            Text(
                              'Welcome',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w800),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  60.0, 5.0, 60.0, 0.0),
                              child: Text(
                                'Sign up to get started and experience great shopping deals',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.065),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  // padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width * 0.14,
                                  child: Center(
                                      child: Text(
                                    "+91",
                                    style: TextStyle(fontSize: 16.5),
                                  )),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black26, width: 1.7),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  // height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: phoneController,
                                      validator: (item) {
                                        if (item.length != 10) {
                                          return 'Enter a valid mobile number';
                                        }
                                        return null;
                                      },
                                      onChanged: (item) {},
                                      // style: TextStyle(fontSize: 19),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0))),
                                        hintText: 'Phone Number',
                                        labelText: 'Phone Number',
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        prefixIcon: Icon(Icons.phone_outlined),
                                      ),
                                      // textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            currentState !=
                                    MobileVerificationState.SHOW_OTP_FORM_STATE
                                ? TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        setState(() {
                                          showLoading = true;
                                        });

                                        await _auth.verifyPhoneNumber(
                                          phoneNumber:
                                              "+91" + phoneController.text,
                                          verificationCompleted:
                                              (phoneAuthCredential) async {
                                            setState(() {
                                              showLoading = false;
                                            });
                                            //signInWithPhoneAuthCredential(phoneAuthCredential);
                                          },
                                          verificationFailed:
                                              (verificationFailed) async {
                                            setState(() {
                                              showLoading = false;
                                              Fluttertoast.showToast(
                                                  msg: verificationFailed
                                                      .message);
                                            });
                                          },
                                          codeSent: (verificationId,
                                              resendingToken) async {
                                            setState(() {
                                              showLoading = false;
                                              currentState =
                                                  MobileVerificationState
                                                      .SHOW_OTP_FORM_STATE;
                                              this.verificationId =
                                                  verificationId;
                                            });
                                          },
                                          codeAutoRetrievalTimeout:
                                              (verificationId) async {},
                                        );
                                      }
                                    },
                                    child: Text("SEND OTP"),
                                    style: TextButton.styleFrom(
                                      primary: Colors.redAccent,
                                    ),
                                  )
                                : getOtpFormWidget(context),
                            Container(
                              margin: EdgeInsets.fromLTRB(80, 15, 80, 0),
                              child: PinCodeTextField(
                                controller: otpController,
                                keyboardType: TextInputType.number,
                                textStyle: TextStyle(fontSize: 16.5),
                                cursorColor: Colors.redAccent,
                                appContext: context,
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(8),
                                    fieldHeight: 35,
                                    fieldWidth: 30,
                                    selectedColor: Colors.redAccent,
                                    activeColor: Colors.black45,
                                    inactiveColor: Colors.black26),
                                length: 6,
                                onChanged: (value) {
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.87,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  PhoneAuthCredential phoneAuthCredential =
                                      PhoneAuthProvider.credential(
                                          verificationId: verificationId,
                                          smsCode: otpController.text);

                                  signInWithPhoneAuthCredential(
                                      phoneAuthCredential);
                                },
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),

                            showLoading
                                ? SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2))
                                : SizedBox(height: 0),

                            SizedBox(height: 15),

                            // Container(
                            //   padding: EdgeInsets.only(left: 10, right: 10),
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //         labelText: 'Username',
                            //
                            //         // border: UnderlineInputBorder(),
                            //         border: UnderlineInputBorder(
                            //             borderSide:
                            //                 BorderSide(color: Colors.red))),
                            //   ),
                            // ),
                            // Container(
                            //   padding: EdgeInsets.only(left: 10, right: 10),
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //         labelText: 'Password',
                            //         suffixIcon: IconButton(
                            //           icon: Icon(Icons.lock),
                            //           onPressed: () {
                            //             setState(() {
                            //               obs = !obs;
                            //             });
                            //           },
                            //         )),
                            //     obscureText: obs,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: size.height * 0.01 + 3,
                            // ),
                            // InkWell(
                            //   child: Text('Forget Password?'),
                            //   onTap: () {
                            //     print('you forgot your password');
                            //   },
                            // ),
                            // SizedBox(
                            //   height: size.height * 0.01 + 3,
                            // ),
                            // InkWell(
                            //     child: Container(
                            //       margin: EdgeInsets.only(bottom: 25),
                            //       width: size.width * 15 / 16 - 3,
                            //       padding: EdgeInsets.all(size.height * 0.02),
                            //       decoration: BoxDecoration(
                            //         color: Colors.red,
                            //         borderRadius: BorderRadius.circular(20),
                            //       ),
                            //       child: Center(
                            //           child: Text(
                            //         'SIGN IN',
                            //         style: TextStyle(
                            //             fontSize: 13, color: Colors.white),
                            //       )),
                            //     ),
                            //     onTap: () {
                            //       print('Signing in');
                            //     }),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text('-OR-'),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      margin: EdgeInsets.all(4),
                      width: size.width / 2,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.facebook),
                            Text(
                              'Sign in with Facebook',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        onTap: () {
                          fbSignIn();
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(4),
                      width: size.width / 2,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Image.network(
                                'https://maxcdn.icons8.com/Share/icon/Logos/google_logo1600.png',
                                fit: BoxFit.fill,
                              ),
                              height: 20,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                            ),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        onTap: () {
                          googleSignup(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01 + 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        InkWell(
                          child: Text(
                            "Signup",
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, RegistrationScreen.id);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    // SizedBox(height: size.height*0.01,),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Continue without signing in ',
                            style: TextStyle(color: Colors.red),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, MainFrame.id);
                      },
                    ),
                    SizedBox(height: 200)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> userSetup(
    String displayName,
    String userEmail,
    String userPassword,
    String userLocation,
    String dob,
    String signupMethod) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  String uid = auth.currentUser.uid.toString();
  users.add({
    'displayName': displayName,
    'userEmail': userEmail,
    'userPassword': userPassword,
    'userLocation': userLocation,
    'uid': uid,
    'dob': dob,
    'signupMethod': signupMethod
  });
}

Future<void> googleSignup(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    User user = result.user;

    if (result != null) {
      userSetup(result.user.displayName, result.user.email, "",
          result.user.phoneNumber, "", "Google");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainFrame()));
    } // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}
