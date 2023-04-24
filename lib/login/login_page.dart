import 'package:flutter/material.dart';
import 'package:loja_virtual/form/form_page.dart';
import 'package:loja_virtual/login/widgets/fteam_textformfield.dart';

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

//TODO: Colocar onfocus na tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 200,
                ),
                const SizedBox(
                  height: 30,
                ),
                FteamTextFormField(
                  icon: const Icon(Icons.person),
                  textoController: _nomeDeUsuario,
                  hintText: 'NOME DE USUÁRIO',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, informe seu e-mail';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Por favor, informe um e-mail válido';
                    }
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
                  icon: const Icon(Icons.lock),
                  textoController: _senha,
                  obscureText: _mostrarSenha,
                  hintText: 'SENHA',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Recuperar senha'),
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
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text('Entrar'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const FormPage(),
                            ),
                          );
                        },
                        child: const Text('Cadastrar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
