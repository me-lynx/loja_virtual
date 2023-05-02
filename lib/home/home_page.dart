import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loja_virtual/routes_helper/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<Widget> _widgetOptions = <Widget>[
    Container(
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.red,
    ),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              curve: Curves.easeInCirc,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person_2,
                        size: 30,
                        color: Colors.black,
                      ),
                      // backgroundImage: NetworkImage(userAvatarUrl),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'João das Neves',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const Text(
                    'joaodasneves@joao.com.br',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
            const Card(
              color: Color(0xfFF2F2F2),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.gears,
                      color: Colors.black,
                    ),
                    Text(
                      'Configurações',
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ),
            const Card(
              color: Color(0xfFF2F2F2),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationCrosshairs,
                      color: Colors.black,
                    ),
                    Text(
                      'Endereço',
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ),
            const Card(
              color: Color(0xfFF2F2F2),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.userShield,
                      color: Colors.black,
                    ),
                    Text(
                      'Informações Pessoais',
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ),
            const Card(
              color: Color(0xfFF2F2F2),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.creditCard,
                      color: Colors.black,
                    ),
                    Text(
                      'Pagamento',
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Routes().helpPage);
              },
              child: const SizedBox(
                height: 100,
                child: Card(
                  color: Color(0xfFA4DA95),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleInfo,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Ajuda',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartShopping),
            label: 'Comprar',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
