import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final double? hintFontSize;
  final double? labelFontSize;
  final Function(dynamic)? onSave;
  final String? Function(String?)? validator; // Change the type of validator

  const CustomTextFormField(
      {super.key,
      this.labelText,
      this.hintText,
      this.hintFontSize,
      this.labelFontSize,
      this.onSave,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Colors.grey,
        onSaved: onSave,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: hintFontSize,
            color: Colors.black,
          ),
          labelStyle: TextStyle(
            fontSize: labelFontSize,
            color: Colors.grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ));
  }
}
