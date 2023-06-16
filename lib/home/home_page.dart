import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loja_virtual/cart/view/cart_page.dart';
import 'package:loja_virtual/catalog/view/catalog_page.dart';
import 'package:loja_virtual/home/drawer_screens/settings_page.dart';
import 'package:loja_virtual/home/home_content_page.dart';
import 'package:loja_virtual/routes_helper/routes.dart';
import 'package:sizer/sizer.dart';
// import '../catalog/view/catalog_page.dart';
// import '../constants/constants.dart';
// import '../order/order_details_page.dart';

// //Na tela de inicio teremos o carregamento dos itens favoritados.
// //precisamos pensar em uma navegação dinamica entre o menu
// //validação de itens favoritados
// //correção de fluxos entre as tabs com a navegação dinamica
// //resolver o cadastro

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final Constants _constants = Constants();
//   static final List<Widget> _widgetOptions = <Widget>[
//     const HomeContentPage(),
//     const CartPage(),
//     CatalogPage(),
//   ];
//   int _selectedIndex = 0;
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       drawer: Drawer(
//         width: SizerUtil.deviceType == DeviceType.web ? 80.w : 75.w,
//         child: ListView(
//           children: [
//             SizedBox(
//               height: SizerUtil.deviceType == DeviceType.web ? 30.h : 25.h,
//               child: DrawerHeader(
//                 decoration: const BoxDecoration(
//                   color: Colors.black,
//                 ),
//                 curve: Curves.easeInCirc,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 5.h,
//                       width: 10.w,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: Icon(
//                           Icons.person_2,
//                           size: 20.sp,
//                           color: Colors.black,
//                         ),
//                         // backgroundImage: NetworkImage(userAvatarUrl),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(
//                           SizerUtil.deviceType == DeviceType.web ? 1.w : 3.w),
//                       child: Text(
//                         'João das Neves',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: SizerUtil.deviceType == DeviceType.web
//                                 ? 8.sp
//                                 : 12.sp),
//                       ),
//                     ),
//                     Text(
//                       'joaodasneves@joao.com.br',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: SizerUtil.deviceType == DeviceType.web
//                               ? 5.sp
//                               : 8.sp),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Card(
//               color: const Color(0xfFF2F2F2),
//               child: Padding(
//                 padding: EdgeInsets.all(1.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     FaIcon(
//                       FontAwesomeIcons.gears,
//                       color: Colors.black,
//                       size: SizerUtil.deviceType == DeviceType.web
//                           ? 12.sp
//                           : 20.sp,
//                     ),
//                     Text(
//                       _constants.settings,
//                       style: const TextStyle(color: Colors.black),
//                     ),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.grey,
//                       size: SizerUtil.deviceType == DeviceType.web
//                           ? 12.sp
//                           : 10.sp,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Card(
//               color: const Color(0xfFF2F2F2),
//               child: Padding(
//                 padding: EdgeInsets.all(1.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     FaIcon(
//                       FontAwesomeIcons.locationCrosshairs,
//                       color: Colors.black,
//                       size: SizerUtil.deviceType == DeviceType.web
//                           ? 12.sp
//                           : 20.sp,
//                     ),
//                     Text(
//                       _constants.address,
//                       style: const TextStyle(color: Colors.black),
//                     ),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.grey,
//                       size: SizerUtil.deviceType == DeviceType.web
//                           ? 12.sp
//                           : 10.sp,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Card(
//               color: const Color(0xfFF2F2F2),
//               child: Padding(
//                 padding: EdgeInsets.all(1.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     FaIcon(
//                       FontAwesomeIcons.userShield,
//                       color: Colors.black,
//                       size: SizerUtil.deviceType == DeviceType.web
//                           ? 12.sp
//                           : 20.sp,
//                     ),
//                     Text(
//                       _constants.personalInfo,
//                       style: const TextStyle(color: Colors.black),
//                     ),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.grey,
//                       size: SizerUtil.deviceType == DeviceType.web
//                           ? 12.sp
//                           : 10.sp,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Card(
//               color: const Color(0xfFF2F2F2),
//               child: Padding(
//                 padding: EdgeInsets.all(1.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     FaIcon(
//                       FontAwesomeIcons.creditCard,
//                       color: Colors.black,
//                       size: SizerUtil.deviceType == DeviceType.web
//                           ? 12.sp
//                           : 20.sp,
//                     ),
//                     Text(
//                       _constants.payment,
//                       style: const TextStyle(color: Colors.black),
//                     ),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.grey,
//                       size: SizerUtil.deviceType == DeviceType.web
//                           ? 12.sp
//                           : 10.sp,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pushNamed(Routes().helpPage);
//               },
//               child: SizedBox(
//                 height: 10.h,
//                 child: Card(
//                   color: const Color(0xfFA4DA95),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         FaIcon(
//                           FontAwesomeIcons.circleInfo,
//                           color: Colors.black,
//                           size: SizerUtil.deviceType == DeviceType.web
//                               ? 12.sp
//                               : 20.sp,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 2.h),
//                           child: Text(
//                             _constants.help,
//                             style: const TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Card(
//               color: const Color(0xfFF2F2F2),
//               child: Padding(
//                 padding: EdgeInsets.all(1.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     FaIcon(
//                       FontAwesomeIcons.arrowRightFromBracket,
//                       color: Colors.black,
//                       size: SizerUtil.deviceType == DeviceType.web
//                           ? 12.sp
//                           : 20.sp,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 2.h),
//                       child: Text(
//                         _constants.exit,
//                         style: const TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.grey,
//         iconSize: 30.sp,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               size: 20.sp,
//             ),
//             label: _constants.home,
//           ),
//           BottomNavigationBarItem(
//             icon: FaIcon(
//               FontAwesomeIcons.cartShopping,
//               size: 20.sp,
//             ),
//             label: _constants.cart,
//           ),
//           BottomNavigationBarItem(
//             icon: FaIcon(
//               FontAwesomeIcons.book,
//               size: 20.sp,
//             ),
//             label: _constants.catalog,
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//       body: _widgetOptions.elementAt(_selectedIndex),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:loja_virtual/login/login_page.dart';
import 'package:loja_virtual/login/recovery_password_page.dart';
import 'package:loja_virtual/order/order_details_page.dart';

import '../constants/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
  };
  final List<Widget> _widgetOptions = <Widget>[
    SafeArea(child: const HomeContentPage()),
    const CartPage(),
    const CatalogPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Constants _constants = Constants();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 20.sp,
            ),
            label: _constants.home,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.cartShopping,
              size: 20.sp,
            ),
            label: _constants.cart,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.book,
              size: 20.sp,
            ),
            label: _constants.catalog,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.gears,
              size: 20.sp,
            ),
            label: _constants.settings,
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      body: buildNavigator(),
    );
  }

  buildNavigator() {
    return Navigator(
      key: navigatorKeys[_selectedIndex],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (_) => _widgetOptions.elementAt(_selectedIndex));
      },
    );
  }
}
