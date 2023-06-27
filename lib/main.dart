import 'package:flutter/material.dart';
import 'package:loja_virtual/address/address_page.dart';
import 'package:loja_virtual/cart/bloc/cart_bloc.dart';
import 'package:loja_virtual/cart/bloc/cart_event.dart';
import 'package:loja_virtual/cart/view/cart_page.dart';
import 'package:loja_virtual/catalog/bloc/catalog_bloc.dart';
import 'package:loja_virtual/catalog/bloc/catalog_event.dart';
import 'package:loja_virtual/form/form_page.dart';
import 'package:loja_virtual/home/drawer_screens/help_page.dart';
import 'package:loja_virtual/home/drawer_screens/payment_info.dart';
import 'package:loja_virtual/home/drawer_screens/personal_info.dart';
import 'package:loja_virtual/home/drawer_screens/settings_page.dart';
import 'package:loja_virtual/home/home_page.dart';
import 'package:loja_virtual/login/login_page.dart';
import 'package:loja_virtual/login/recovery_password_page.dart';
import 'package:loja_virtual/order/order_details_page.dart';
import 'package:loja_virtual/shopping_repository.dart';
import 'package:sizer/sizer.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(
    shoppingRepository: ShoppingRepository(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.shoppingRepository});
  final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CatalogBloc(shoppingRepository: shoppingRepository)
              ..add(
                CatalogStarted(),
              ),
          ),
          BlocProvider(
              create: (_) => CartBloc(shoppingRepository)..add(CartStarted()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            '/home_page': (context) => MyHomePage(
                  title: 'Tst',
                ),
            '/request_password_page': (context) => const RecoveryPasswordPage(),
            '/form_page': (context) => const FormPage(),
            '/help_page': (context) => const HelpPage(),
            '/address_page': (context) => const AddressPage(),
            '/payment_info_page': (context) => const PaymentInfoPage(),
            '/personal_info_page': (context) => const PersonalInfoPage(),
            '/settings_page': (context) => const SettingsPage(),
            '/cart_page': (context) => const CartPage(),
          },
        ),
      );
    });
  }
}
