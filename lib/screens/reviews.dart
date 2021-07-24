import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fashup/components/appbar.dart';

class Reviews extends StatefulWidget {
  static String id = 'Reviews';

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(size.height * 0.07), // here the desired height
        child: Custom_Appbar(colour: Colors.white, elev: 8.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [NewWidget(), NewWidget(), NewWidget(), NewWidget()],
        ),
      ),
      // body: NewWidget(),
    );
  }
}

class NewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/8050084/pexels-photo-8050084.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Selection Women Paradise',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Mathura',
                      style: TextStyle(
                          fontSize: 16.0, color: Colors.grey.shade700),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.looks_two_rounded,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.star,
                          size: 17.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '4 months ago',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.grey.shade800),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 40.0, 0.0),
            child: Text(
              'Value for money really nice clothes, will definitely try again',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.46,
                  height: MediaQuery.of(context).size.height * 0.37,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1617627143750-d86bc21e42bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.46,
                  height: MediaQuery.of(context).size.height * 0.37,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1615886753866-79396abc446e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2FyZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
