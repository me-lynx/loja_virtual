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
  late Address address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchCep,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintStyle: const TextStyle(color: Colors.black),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      searchCep.clear();
                    });
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  address = await loadAddress(searchCep.text);
                  setState(() {
                    logradouro.text = address.logradouro!;
                  });
                },
                child: const Text('Buscar'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: logradouro,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintStyle: const TextStyle(color: Colors.black),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      logradouro.clear();
                    });
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
        ],
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
