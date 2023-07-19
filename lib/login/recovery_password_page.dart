import 'package:flutter/material.dart';
import 'package:loja_virtual/constants/constants.dart';
import 'package:loja_virtual/login/widgets/fteam_textformfield.dart';

import '../Auth/auth.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  final _nomeDeUsuario = TextEditingController();
  final Constants _constants = Constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: FteamTextFormField(
              textoController: _nomeDeUsuario,
              hintText: _constants.userName,
              validator: (value) {
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var teste = await Auth().recoverPassword(_nomeDeUsuario.text);
              snackBarMessage(teste, context);
            },
            child: Text(_constants.passwordRecover),
          ),
        ],
      ),
    );
  }

  void snackBarMessage(String? message, BuildContext context) {
      final snackBar = SnackBar(
      content:  Text(message!),
      action: SnackBarAction(
        label: 'Fechar',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
