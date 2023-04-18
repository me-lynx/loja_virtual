// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FteamTextFormField extends StatelessWidget {
  FteamTextFormField(
      {super.key,
      required this.senha,
      this.obscureText,
      required this.icon,
      this.hintText,
      this.validator});

  bool? obscureText = false;
  final TextEditingController senha;
  Widget? icon;
  String? hintText;

  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: senha,
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
