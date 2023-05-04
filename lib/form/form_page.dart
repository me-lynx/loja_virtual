import 'package:flutter/material.dart';
import 'package:loja_virtual/constants/constants.dart';

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
  final _password = TextEditingController();
  List<String> list = <String>['Feminino', 'Masculino', 'Prefiro não dizer'];
  final Constants _constants = Constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          _constants.signUpTitlePage,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _constants.completedUsername,
              style: const TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: FteamTextFormField(
                textoController: _nome,
                obscureText: false,
              ),
            ),
            Text(
              _constants.cpf,
              style: const TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: FteamTextFormField(
                textoController: _cpf,
                obscureText: false,
              ),
            ),
            Text(
              _constants.cellPhone,
              style: const TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: FteamTextFormField(
                textoController: _celular,
                obscureText: false,
              ),
            ),
            Text(
              _constants.gender,
              style: const TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.white),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text(_constants.gender),
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // setState(() {
                        //   value = value;
                        // });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Text(
              _constants.password,
              style: const TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: FteamTextFormField(
                textoController: _password,
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(_constants.signUp),
            ),
          ],
        ),
      ),
    );
  }
}
