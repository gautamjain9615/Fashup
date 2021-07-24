import 'package:flutter/material.dart';
import 'package:fashup/screens/main_frame.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:intl/intl.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  // const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final locationController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String verificationId;

  bool showLoading = false;

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
        userSetup(
            nameController.text,
            emailController.text,
            passwordController.text,
            locationController.text,
            date.toString(),
            "Phone Number");
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

  Future<void> userSetup(
      String displayName,
      String userEmail,
      String userPassword,
      String userLocation,
      String dob,
      String signupMethod) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    String uid = _auth.currentUser.uid.toString();
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

  // getMobileFormWidget(context) {
  //   return
  // }

  getOtpFormWidget(context) {
    return Column(
      children: [
        // Container(
        //   height: 50,
        //   width: MediaQuery.of(context).size.width * 0.87,
        //   child: TextFormField(
        //     keyboardType: TextInputType.number,
        //     controller: otpController,
        //     onChanged: (item) {},
        //     // style: TextStyle(fontSize: 19),
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(
        //           borderRadius: BorderRadius.all(Radius.circular(30.0))),
        //       hintText: 'OTP',
        //       labelText: 'OTP',
        //       hintStyle: TextStyle(color: Colors.black),
        //       prefixIcon: Icon(Icons.vpn_key_outlined),
        //     ),
        //     // textAlign: TextAlign.center,
        //   ),
        // ),
        SizedBox(height: 18),
        Text(
          "Enter OTP",
          style: TextStyle(fontSize: 18),
        ),
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
        // TextField(
        //   controller: otpController,
        //   decoration: InputDecoration(
        //     hintText: "Enter OTP",
        //   ),
        //   keyboardType: TextInputType.number,
        // ),
        SizedBox(
          height: 16,
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
              FocusScope.of(context).requestFocus(FocusNode());
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: otpController.text);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text(
              'SIGN UP',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 30)
      ],
    );
  }

  String currentText = "";

  DateTime date = DateTime.now();

  Future<Null> selectDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFFFDFEFE),
            accentColor: const Color(0xFFE74C3C),
            colorScheme: ColorScheme.light(primary: const Color(0xFFE74C3C)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }

  var count = 0;
  String display() {
    if (count == 0)
      return 'Select Date of Birth';
    else
      return DateFormat('dd/MM/yyyy').format(date);
  }

  bool obs = true;
  IconData icon = Icons.visibility_off_outlined;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // body: Container(
      //   child: showLoading
      //       ? Center(
      //           child: CircularProgressIndicator(),
      //         )
      //       : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
      //           ? getMobileFormWidget(context)
      //           : getOtpFormWidget(context),
      //   padding: const EdgeInsets.all(16),
      // ));
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://images.pexels.com/photos/8050084/pexels-photo-8050084.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(120.0, 60.0, 120.0, 10.0),
                      child: Image.asset(
                        'images/fashup.png',
                        width: size.width * 3 / 8,
                      ),
                    ),
                    Text(
                      'Fashup Your Wardrobe!',
                      style: TextStyle(fontSize: 19.0),
                    ),
                    SizedBox(height: 15)
                  ],
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60.0, 5.0, 60.0, 0.0),
                      child: Text(
                        'Sign up to get started and experience great shopping deals',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          // height: 50,
                          width: MediaQuery.of(context).size.width * 0.87,
                          child: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            onChanged: (item) {},
                            // style: TextStyle(fontSize: 19),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              hintText: 'Name',
                              labelText: 'Name',
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.badge_outlined),
                            ),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          // height: 50,
                          width: MediaQuery.of(context).size.width * 0.87,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (item) {
                              return item.contains("@")
                                  ? null
                                  : "Enter valid Email";
                            },
                            controller: emailController,
                            onChanged: (item) {},
                            // style: TextStyle(fontSize: 19),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              hintText: 'Email',
                              labelText: 'Email',
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          // height: 50,
                          width: MediaQuery.of(context).size.width * 0.87,
                          child: TextFormField(
                            obscureText: obs,
                            validator: (item) {
                              return item.length > 7
                                  ? null
                                  : "Password must be atleast 8 characters";
                            },
                            controller: passwordController,
                            onChanged: (item) {},
                            // style: TextStyle(fontSize: 19),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30.0))),
                                hintText: 'Password',
                                labelText: 'Password',
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(Icons.lock_outline_rounded),
                                suffixIcon: IconButton(
                                  icon: Icon(icon),
                                  onPressed: () {
                                    setState(() {
                                      if (obs) {
                                        icon = Icons.visibility_outlined;
                                      } else {
                                        icon = Icons.visibility_off_outlined;
                                      }
                                      obs = !obs;
                                    });
                                  },
                                )),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          // height: 50,
                          width: MediaQuery.of(context).size.width * 0.87,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              border: Border.all(color: Colors.black38),
                              color: Colors.white),
                          child: TextButton(
                            onPressed: () {
                              selectDatePicker(context);
                              count++;
                              print(count);
                            },
                            child: Text(
                              display(),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16.5),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.065),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              // padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.14,
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
                                width:
                                    MediaQuery.of(context).size.width * 0.03),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              // height: 50,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (item) {
                                  if (item.length != 10) {
                                    return 'Enter a valid mobile number';
                                  }
                                  return null;
                                },
                                controller: phoneController,
                                onChanged: (item) {},
                                // style: TextStyle(fontSize: 19),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  hintText: 'Phone Number',
                                  labelText: 'Phone Number',
                                  hintStyle: TextStyle(color: Colors.black),
                                  prefixIcon: Icon(Icons.phone_outlined),
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),

                        // TextField(
                        //     controller: emailController,
                        //     decoration: InputDecoration(
                        //       hintText: "Email",
                        //     )),
                        // TextField(
                        //     controller: passwordController,
                        //     decoration: InputDecoration(
                        //       hintText: "Password",
                        //     ),
                        //     obscureText: true),
                        // TextField(
                        //     controller: locationController,
                        //     decoration: InputDecoration(
                        //       hintText: "Location",
                        //     )),
                        // TextField(
                        //   controller: phoneController,
                        //   decoration: InputDecoration(
                        //     hintText: "Phone Number",
                        //   ),
                        //   keyboardType: TextInputType.number,
                        // ),
                        // SizedBox(height: 15),
                      ]),
                    ),
                    currentState != MobileVerificationState.SHOW_OTP_FORM_STATE
                        ? TextButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                setState(() {
                                  showLoading = true;
                                });

                                await _auth.verifyPhoneNumber(
                                  phoneNumber: "+91" + phoneController.text,
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
                                          msg: verificationFailed.message);
                                    });
                                  },
                                  codeSent:
                                      (verificationId, resendingToken) async {
                                    setState(() {
                                      showLoading = false;
                                      currentState = MobileVerificationState
                                          .SHOW_OTP_FORM_STATE;
                                      this.verificationId = verificationId;
                                    });
                                  },
                                  codeAutoRetrievalTimeout:
                                      (verificationId) async {},
                                );
                              } else {
                                print('Error');
                              }
                            },
                            child: Text("SEND OTP"),
                            style: TextButton.styleFrom(
                              primary: Colors.redAccent,
                            ),
                          )
                        : SizedBox(height: 0),
                    currentState == MobileVerificationState.SHOW_OTP_FORM_STATE
                        ? getOtpFormWidget(context)
                        : SizedBox(height: 0),
                    showLoading
                        ? SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : SizedBox(height: 0),
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
