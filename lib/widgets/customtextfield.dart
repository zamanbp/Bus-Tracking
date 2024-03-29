import 'package:flutter/material.dart';

@override
Widget buildTextField(
    BuildContext context,
    String labelText,
    bool obscureText,
    Widget IconButton,
    TextEditingController controller,
    Widget Icon,
    String? Function(String?)? validator) {
  return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: IconButton,
        prefixIcon: Icon,
      ));
}