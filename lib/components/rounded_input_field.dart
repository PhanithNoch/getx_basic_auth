import 'package:facebook_clone/components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../color_constant.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool? isEmail;
  final String messageError;
  const RoundedInputField(
      {Key? key,
      required this.hintText,
      this.icon = Icons.person,
      required this.onChanged,
      required this.controller,
      required this.messageError,
      this.isEmail})
      : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validateText,
        controller: widget.controller,
        onChanged: widget.onChanged,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            // color: kPrimaryColor,
            color: primaryColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  String? validateText(String? value) {
    if (value!.isEmpty) {
      return widget.messageError;
    } else if (value.length < 3 && widget.isEmail != null) {
      return 'Please enter correct username';
    } else if (widget.isEmail != null) {}
    return null;
  }
}
