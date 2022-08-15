import 'package:facebook_clone/components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../color_constant.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  RoundedPasswordField(
      {Key? key, required this.onChanged, required this.controller})
      : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        onChanged: widget.onChanged,
        // cursorColor: kPrimaryColor,
        cursorColor: primaryColor,
        validator: passwordValidator,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            // color: kPrimaryColor,
            color: primaryColor,
            icon: Icon(Icons.visibility),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  //password validator possible structure
  String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Password empty';
    } else if (password.length < 3) {
      return 'Password too short';
    }
    return null;
  }
}
