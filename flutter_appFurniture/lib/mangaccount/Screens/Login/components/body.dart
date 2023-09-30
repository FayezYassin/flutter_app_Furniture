import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appltessst/admin_exhibition/mainscreen.dart';
import 'package:flutter_appltessst/controlapi/blockapp.dart';
import 'package:flutter_appltessst/controlapi/statesapp.dart';
import 'package:flutter_appltessst/homescreen.dart';
import 'package:flutter_appltessst/main.dart';
import 'package:flutter_appltessst/mangaccount/Screens/Login/components/background.dart';
import 'package:flutter_appltessst/mangaccount/Screens/Signup/signup_screen.dart';
import 'package:flutter_appltessst/mangaccount/components/already_have_an_account_acheck.dart';
import 'package:flutter_appltessst/mangaccount/components/rounded_button.dart';
import 'package:flutter_appltessst/mangaccount/components/rounded_input_field.dart';
import 'package:flutter_appltessst/mangaccount/components/rounded_password_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  var controlerpassword = TextEditingController();
  var controleremail = TextEditingController();

  var keyvaled = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<Cubitapp, Statesapp>(
      listener: (context, stat) {},
      builder: (context, stat) {
        var cubit = Cubitapp.get(context);
        bool ispasscubit = cubit.ispassword;
        return Background(
          child: SingleChildScrollView(
            child: Form(
              key: keyvaled,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  //assets/icons/chat.svg
                  SvgPicture.asset(
                    "assets/icons/signup.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    emailcontroller: controleremail,
                    hintText: "Your Email",
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    controller: controlerpassword,
                    ispassword: ispasscubit,
                    preficon:
                        ispasscubit ? Icons.visibility_off : Icons.visibility,
                    onChanged: (value) {},
                    iconbutten: () {
                      cubit.changepassword();
                    },
                  ),
                  ConditionalBuilder(
                    condition: stat is! Loginloading,
                    builder: (context) {
                      return RoundedButton(
                        text: "LOGIN",
                        press: () {
                          if (keyvaled.currentState!.validate()) {
                            print(
                                'password ${controlerpassword.text}  ${controlerpassword.text}');
                            cubit.postlogin(
                                email: controleremail.text,
                                password: controlerpassword.text);
                            if (controleremail.text.contains('adminsa')) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Mainscreenexhi()),
                                  (route) => false);
                            } else {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Homescreen()),
                                  (route) => false);
                            }
                          }
                        },
                      );
                    },
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
