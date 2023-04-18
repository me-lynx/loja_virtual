import 'package:flutter/material.dart';

import '../login/widgets/fteam_textformfield.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _nome = TextEditingController();
  final _cpf = TextEditingController();
  final _celular = TextEditingController();
  List<String> list = <String>['Feminino', 'Masculino', 'Prefiro não dizer'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Teste',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nome completo',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: FteamTextFormField(
                textoController: _nome,
                obscureText: false,
              ),
            ),
            const Text(
              'CPF',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: FteamTextFormField(
                textoController: _cpf,
                obscureText: false,
              ),
            ),
            const Text(
              'Celular',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: FteamTextFormField(
                textoController: _celular,
                obscureText: false,
              ),
            ),
            const Text(
              'Sexo',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {}),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
