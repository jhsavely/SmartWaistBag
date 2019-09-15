//import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
//
//final String assetName = 'images/user_profile_3.svg';
//
//class SecondScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("On the next Screen"),
//      ),
//      body: Center(
//        child: new Container(
//          width: 200,
//          height: 200,
//          child: RaisedButton(
//            elevation: 8,
//            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
//            child: SvgPicture.asset(assetName, color: Colors.black),
//            onPressed: () {
//              Navigator.pop(context);
//            },
//          ),
//        ),
//      ),
//    );
//  }
//}