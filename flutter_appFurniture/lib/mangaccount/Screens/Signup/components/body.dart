import 'package:flutter/material.dart';
import 'package:flutter_appltessst/mangaccount/Screens/Login/components/background.dart';
import 'package:flutter_appltessst/mangaccount/Screens/Login/login_screen.dart';
import 'package:flutter_appltessst/mangaccount/Screens/Signup/components/or_divider.dart';
import 'package:flutter_appltessst/mangaccount/Screens/Signup/components/social_icon.dart';
import 'package:flutter_appltessst/mangaccount/components/already_have_an_account_acheck.dart';
import 'package:flutter_appltessst/mangaccount/components/rounded_button.dart';
import 'package:flutter_appltessst/mangaccount/components/rounded_input_field.dart';
import 'package:flutter_appltessst/mangaccount/components/rounded_password_field.dart';

import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  var controlerpassword = TextEditingController();
  var controleremail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              emailcontroller: controleremail,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              ispassword: true,
              controller: controlerpassword,
              preficon: Icons.visibility,
              onChanged: (value) {},
              iconbutten: () {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
