import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_appltessst/homescreen.dart';
import 'package:flutter_appltessst/mangaccount/constants.dart';

import 'package:flutter_appltessst/widgets/styleScheme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'mangaccount/Screens/Login/login_screen.dart';
import 'mangaccount/Screens/Signup/components/social_icon.dart';

class SpalshSecreen extends StatefulWidget {
  const SpalshSecreen({Key? key}) : super(key: key);

  @override
  State<SpalshSecreen> createState() => _SpalshSecreenState();
}

class _SpalshSecreenState extends State<SpalshSecreen> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    new Timer(const Duration(milliseconds: 3500), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      });
    });
    return Scaffold(
      //backgroundColor: kPrimaryColor, //Colors.green[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset(
              'assets/logo1.jpg',
              height: 200.0,
              width: 230.0,
            ),
            SizedBox(
              height: 100,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            )
          ],
        ),
      ),
    );
    /* Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColor
          ],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              //'welcome ❤️ ',
              'welcome',
              style: TextStyle(
                  fontFamily: 'Avenir', fontSize: 28.0, color: Colors.white),
            ),
          ),
          Container(
            height: 190,
            width: 190,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/sp2.jpg'), fit: BoxFit.cover)),
            //iconapp.jpeg
          ),
          SizedBox(
            height: 120.0,
          ),
          Container(
            width: 200,
            height: 200,
            child: Lottie.asset('assets/ch3.json', repeat: false),
          ),
        ],
      ),
    );*/
  }
}
