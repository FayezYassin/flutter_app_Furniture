import 'package:flutter/material.dart';
import 'package:flutter_appltessst/mangaccount/components/text_field_container.dart';
import 'package:flutter_appltessst/mangaccount/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final IconData preficon;
  final bool ispassword;
  final VoidCallback iconbutten;
  final TextEditingController controller;
  const RoundedPasswordField(
      {Key? key,
      required this.preficon,
      required this.onChanged,
      required this.ispassword,
      required this.iconbutten,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: ispassword,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is empty';
          }
        },
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: iconbutten,
            icon: Icon(
              preficon,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
