import 'package:flutter/material.dart';

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
    Container(
      color: Colors.purple,
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          //TODO: Colocar icone de carrinho
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business_rounded),
            label: 'Comprar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_sharp),
            label: 'Usuário',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
