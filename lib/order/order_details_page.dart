import 'package:flutter/material.dart';

import '../address/address_page.dart';
import '../cart/models/cart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class OrderDetailsPage extends StatefulWidget {
  OrderDetailsPage({
    super.key,
    required this.cart,
  });

  Cart cart;
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
      backgroundColor: const Color(0xFFF9F7FF),
      appBar: AppBar(
        title: const Text('Detalhes do Pedido'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = widget.cart.items[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(item.image),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' R\$ ${item.price.toString()}',
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(30.0),
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                              5.0) //                 <--- border radius here
                                          ),
                                    ),
                                    child: const FaIcon(
                                      FontAwesomeIcons.minus,
                                      size: 10,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(30.0),
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                              5.0) //                 <--- border radius here
                                          ),
                                    ),
                                    child: const FaIcon(
                                      FontAwesomeIcons.plus,
                                      size: 10,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
                itemCount: widget.cart.items.length),
          ),

          ///endereço será incluido depois no cadastro, assim fica mais facil receber o melhor endereço de entrega
          const Text(
            'Informações de Entrega',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.locationArrow,
                    size: 20,
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      'Rua Dos Milagres.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '11234-000 - São Paulo',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddressPage()));
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.arrowRight,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Métodos de Pagamento',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.moneyBill1Wave,
                    size: 20,
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      'Visa International',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '*****-0023',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                  ],
                ),
                const FaIcon(
                  FontAwesomeIcons.arrowRight,
                  size: 20,
                ),
              ],
            ),
          ),

          const Text(
            'Informações do Pedido',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Subtotal',
                    ),
                    Text(
                      ' R\$ ${widget.cart.totalPrice.toString()}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 212, 204, 238)),
            child: Text(
              ' Finalizar Pedido -  Total: (R\$ ${widget.cart.totalPrice.toString()})',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          )
          // TextButton(
          //   style: ButtonStyle(
          //       backgroundColor:
          //           TextButton.styleFrom(backgroundColor: Colors.red)),
          //   onPressed: () {},
          //   child: Text(
          //     ' Finalizar Pedido -  Total: (R\$ ${widget.cart.totalPrice.toString()})',
          //     style: const TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // )
        ],
      ),
    );
  }
}
