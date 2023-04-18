// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FteamTextFormField extends StatelessWidget {
  FteamTextFormField(
      {super.key,
      required this.textoController,
      this.obscureText,
      this.icon,
      this.hintText,
      this.textInputType,
      this.validator});

  bool? obscureText = false;
  final TextEditingController textoController;
  Widget? icon;
  String? hintText;
  String? Function(String?)? validator;
  TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textoController,
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        icon: icon,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      validator: validator,
    );
  }
}
