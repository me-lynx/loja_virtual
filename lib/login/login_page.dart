import 'package:flutter/material.dart';
import 'package:loja_virtual/login/widgets/fteam_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

//TODO: VERIFICAR AS VALIDAÇÕES

class _LoginPageState extends State<LoginPage> {
  final _nomeDeUsuario = TextEditingController();
  final _senha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FteamTextFormField(
              icon: const Icon(Icons.person),
              senha: _nomeDeUsuario,
              hintText: 'NOME DE USUÁRIO',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, informe um email válido';
                }
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return 'Por favor, informe um email válido';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            FteamTextFormField(
              icon: const Icon(Icons.lock),
              senha: _senha,
              obscureText: true,
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
                    onPressed: () {},
                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
