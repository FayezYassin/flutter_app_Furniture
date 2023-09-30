import 'package:flutter/material.dart';
import 'package:flutter_appltessst/mangaccount/components/text_field_container.dart';
import 'package:flutter_appltessst/mangaccount/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController emailcontroller;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.emailcontroller,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        controller: emailcontroller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is empty';
          }
        },
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
