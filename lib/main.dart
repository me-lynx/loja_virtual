import 'package:flutter/material.dart';
import 'package:loja_virtual/form/form_page.dart';
import 'package:loja_virtual/home/drawer_screens/address_page.dart';
import 'package:loja_virtual/home/drawer_screens/help_page.dart';
import 'package:loja_virtual/home/drawer_screens/payment_info.dart';
import 'package:loja_virtual/home/drawer_screens/personal_info.dart';
import 'package:loja_virtual/home/drawer_screens/settings_page.dart';
import 'package:loja_virtual/home/home_page.dart';
import 'package:loja_virtual/login/login_page.dart';
import 'package:loja_virtual/login/request_password_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home_page': (context) => const HomePage(),
        '/request_password_page': (context) => const RequestPasswordPage(),
        '/form_page': (context) => const FormPage(),
        '/help_page': (context) => const HelpPage(),
        '/address_page': (context) => const AddressPage(),
        '/payment_info_page': (context) => const PaymentInfoPage(),
        '/personal_info_page': (context) => const PersonalInfoPage(),
        '/settings_page': (context) => const SettingsPage(),
      },
    );
  }
}
