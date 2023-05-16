import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrinho',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: '2 itens',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' no seu carrinho de compras',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15), // Image border
                child: SizedBox(
                  height: 10.h,
                  child: Image.asset('images/image1boots.jpg'),
                ),
              ),
              Column(
                children: [
                  Text('Botas'),
                  Text("R\$ 100,00"),
                  Text('Tamanho: 40'),
                  Text('Cor'),
                  Text('Quantidade: 1')
                ],
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15), // Image border
                child: SizedBox(
                  height: 10.h,
                  child: Image.asset('images/image2shoes.jpg'),
                ),
              ),
              Column(
                children: [
                  Text('Botas'),
                  Text("R\$ 100,00"),
                  Text('Tamanho: 40'),
                  Text('Cor'),
                  Text('Quantidade: 1')
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Finalizar Compra'),
            ),
          ),
        ],
      ),
    );
  }
}
