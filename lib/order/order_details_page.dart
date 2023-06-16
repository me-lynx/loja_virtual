import 'package:flutter/material.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

///Detalhes do pedido
///https://dribbble.com/shots/14821385-Shopping-App
///O ITEM E INFOS
///ENDEREÇO DE ENTREGA
///METODO DE PAGAMENTO
///FRETE/SUBTOTAL E TOTAL.
///
class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Pedido'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            color: Colors.black,
          ),
          Text('Informações de Entrega'),
          Card(
            child: Text('Endereço de Entrega'),
          ),
          Text('Métodos de Pagamento'),
          Text('Informações do Pedido'),
          TextButton(
            onPressed: () {},
            child: Text('Finalizar pedido '),
          )
        ],
      ),
    );
  }
}
