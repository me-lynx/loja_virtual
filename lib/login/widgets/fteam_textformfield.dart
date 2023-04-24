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
      this.sufixIcon,
      this.validator});

  bool? obscureText = false;
  final TextEditingController textoController;
  Widget? icon;
  String? hintText;
  String? Function(String?)? validator;
  TextInputType? textInputType;
  Widget? sufixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: textoController,
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        suffixIcon: sufixIcon,
        border: const OutlineInputBorder(),
        icon: icon,
        suffixIconColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      validator: validator,
    );
  }
}
