import 'package:flutter/material.dart';

class VendorScreen extends StatefulWidget {
  static String id = 'vendor_screen';

  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Text("Vendors"),
    );
  }
}
