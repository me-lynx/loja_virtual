import 'package:flutter/material.dart';
import 'package:loja_virtual/constants/constants.dart';

import '../Auth/auth.dart';
import '../login/widgets/fteam_textformfield.dart';
import '../routes_helper/routes.dart';

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
              _constants.userNameEmail,
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
              onPressed: () {
                Auth().registerWithEmailAndPassword(_nome.text, _password.text);
                //Navigator.of(context).pushNamed(Routes().homePage);
              },
              child: Text(_constants.signUp),
            ),
          ],
        ),
      ),
    );
  }
}
