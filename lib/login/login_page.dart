import 'package:flutter/material.dart';
import 'package:loja_virtual/Auth/auth.dart';
import 'package:loja_virtual/constants/constants.dart';
import 'package:loja_virtual/login/widgets/fteam_textformfield.dart';
import 'package:loja_virtual/routes_helper/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../user/user.dart';

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
  final bool _isUserAuth = false;

//TODO: Colocar onfocus na tela
  ///TODO: Validar se o usuario logou ou não pra avançar as telas
  ///TODO: Se o usuario for vazio no retorno da api ou vier mensagem de erro, avisar o usuario.
  ///TODO: Olhar mensagens de retorno do Firebase e mapear os erros comuns;
  ///TODO: Recuperar senha - utilizar os métodos do firebase de envio de e-mail
  ///TODO: Validar código de recuperação de senha com o Firebase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: SizerUtil.deviceType == DeviceType.web
                  ? EdgeInsets.all(15.h)
                  : EdgeInsets.all(6.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height:
                        SizerUtil.deviceType == DeviceType.web ? 30.h : 10.h,
                  ),
                  FteamTextFormField(
                    icon: FaIcon(
                      FontAwesomeIcons.solidUser,
                      color: Colors.black,
                      size: SizerUtil.deviceType == DeviceType.web
                          ? 12.sp
                          : 15.sp,
                    ),
                    textoController: _nomeDeUsuario,
                    hintText: _constants.userName,
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
                  SizedBox(
                    height: SizerUtil.deviceType == DeviceType.web ? 4.h : 3.h,
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
                      if (value!.isEmpty) {
                        return 'Digite sua senha';
                      }
                      return null;
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.lock,
                      color: Colors.black,
                      size: SizerUtil.deviceType == DeviceType.web
                          ? 12.sp
                          : 15.sp,
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
                        child: Text(
                          _constants.passwordRecover,
                          style: TextStyle(
                              fontSize: SizerUtil.deviceType == DeviceType.web
                                  ? 5.sp
                                  : 10.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                        SizerUtil.deviceType == DeviceType.web ? 12.h : 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.h,
                        width: SizerUtil.deviceType == DeviceType.web
                            ? 20.w
                            : 30.w,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //validaçao de usuario não encontrado
                              loginUser();
                              Navigator.of(context)
                                  .pushNamed(Routes().homePage);
                            }
                          },
                          child: Text(
                            _constants.enter,
                            style: TextStyle(
                                fontSize: SizerUtil.deviceType == DeviceType.web
                                    ? 5.sp
                                    : 10.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                        width: SizerUtil.deviceType == DeviceType.web
                            ? 20.w
                            : 30.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes().formPage);
                          },
                          child: Text(
                            _constants.signUp,
                            style: TextStyle(
                                fontSize: SizerUtil.deviceType == DeviceType.web
                                    ? 5.sp
                                    : 10.sp),
                          ),
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

  bool loginUser() {
    Auth().loginWithEmailAndPassword(_nomeDeUsuario.text, _senha.text);
    // User.fromJson(user.toString());
    Auth().getCurrentUser();
    return true;
  }
}
