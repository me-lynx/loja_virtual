import 'package:flutter/material.dart';
import 'package:loja_virtual/constants/constants.dart';
import 'package:loja_virtual/login/widgets/fteam_textformfield.dart';
import 'package:loja_virtual/routes_helper/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nomeDeUsuario = TextEditingController();
  final _senha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _mostrarSenha = false;
  final Constants _constants = Constants();

//TODO: Colocar onfocus na tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  FteamTextFormField(
                    icon: const FaIcon(
                      FontAwesomeIcons.solidUser,
                      color: Colors.black,
                    ),
                    textoController: _nomeDeUsuario,
                    hintText: _constants.userName,
                    validator: (value) {
                      // if (value!.isEmpty) {
                      //   return 'Por favor, informe seu e-mail';
                      // }
                      // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      //   return 'Por favor, informe um e-mail válido';
                      // }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FteamTextFormField(
                    sufixIcon: GestureDetector(
                      child: _mostrarSenha
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onTap: () {
                        setState(() {
                          _mostrarSenha = !_mostrarSenha;
                        });
                      },
                    ),
                    validator: (value) {
                      // if (value!.isEmpty) {
                      //   return 'Digite sua senha';
                      // }
                      return null;
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.lock,
                      color: Colors.black,
                    ),
                    textoController: _senha,
                    obscureText: _mostrarSenha,
                    hintText: _constants.password,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routes().requestPasswordPage);
                        },
                        child: Text(_constants.passwordRecover),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushNamed(Routes().homePage);
                          }
                        },
                        child: Text(_constants.enter),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes().formPage);
                          },
                          child: Text(_constants.signUp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
