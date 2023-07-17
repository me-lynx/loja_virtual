import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'models/address.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

/// carregar campos de endereço
///
class _AddressPageState extends State<AddressPage> {
  TextEditingController searchCep = TextEditingController();
  TextEditingController logradouro = TextEditingController();
  TextEditingController complemento = TextEditingController();
  TextEditingController uf = TextEditingController();
  TextEditingController bairro = TextEditingController();
  TextEditingController cidade = TextEditingController();

  late Address address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormFieldComponent(controller: searchCep),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    address = await loadAddress(searchCep.text);
                    setState(() {
                      logradouro.text = address.logradouro!;
                      cidade.text = address.cidade!;
                      uf.text = address.uf!;
                      bairro.text = address.bairro!;
                      complemento.text = address.complemento!;
                    });
                  },
                  child: const Text('Buscar'),
                ),
              ],
            ),
            TextFormFieldComponent(
              controller: logradouro,
            ),
            TextFormFieldComponent(controller: cidade),
            TextFormFieldComponent(
              controller: uf,
            ),
            TextFormFieldComponent(controller: bairro),
            TextFormFieldComponent(controller: complemento),
            TextButton(onPressed: () {}, child: const Text('Salvar')),
          ],
        ),
      ),
    );
  }

  changeState(String value) {
    setState(() {});
  }
}

//resolver o estado.
//colocar como statefull
class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent({
    super.key,
    required this.controller,
    this.setsstate,
  });

  final TextEditingController controller;
  final Function(String value)? setsstate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintStyle: const TextStyle(color: Colors.black),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.clear),
        ),
      ),
    );
  }
}

Future<Address> loadAddress(String cep) async {
  final url = Uri.parse("http://viacep.com.br/ws/$cep/json/");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return Address.fromJson(response.body);
  } else {
    throw Exception('Requisição inválida!');
  }
}
