import 'package:bybus/enum/enum.dart';
import 'package:bybus/widgets/loading_alert.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:bybus/widgets/reset_password_dialog.dart';
import 'package:bybus/widgets/show_snackbar.dart';
import 'package:bybus/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../services/auth_services.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService authServices = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                _logo(),
                const SizedBox(height: 15),
                _title(),
                const SizedBox(height: 15.0),
                _inputs(),
                const SizedBox(height: 30.0),
                _loginButton(context),
                const SizedBox(height: 15),
                _resetPasswordButton(context),
                _orText(),
                const SizedBox(height: 15.0),
                _registerButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _logo() {
    return Image.asset(
      height: 300,
      'lib/assets/logo.jpeg',
    );
  }

  _title() {
    return const HBox(
      children: [
        Text(
          "Entrar",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _inputs() {
    return Form(
      key: _formKey,
      child: VBox(
        children: [
          TextInput(
            off: false,
            password: false,
            email: true,
            controller: _emailController,
            text: 'Seu e-mail',
          ),
          const SizedBox(height: 20.0),
          TextInput(
            off: false,
            password: true,
            controller: _passwordController,
            text: 'Sua senha',
          ),
        ],
      ),
    );
  }

  _loginButton(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            _loginButtonPressed(context);
          },
          text: "Entrar"),
    );
  }

  _loginButtonPressed(context) {
    String email = _emailController.text;
    String senha = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible:
            false, // Impedir que o diálogo seja fechado ao tocar fora dele
        builder: (BuildContext context) {
          return const LoadingAlert();
        },
      );
      authServices.loginUser(email: email, password: senha).then((error) {
        if (error == null) {
          showSnackBar(
              context: context, mensagem: "Logado com sucesso!", isErro: false);
          Navigator.pushNamed(context, '/navpage');
        } else {
          showSnackBar(context: context, mensagem: error, isErro: true);
        }
      });
    }
  }

  _resetPasswordButton(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: VBox(
        style: Style(
          $box.alignment(Alignment.bottomRight),
        ),
        children: [
          GestureDetector(
            onTap: () {
              showPasswordResetDialog(context);
            },
            child: const Text(
              "Esqueci minha senha",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline, // Adiciona o sublinhado
              ),
            ),
          )
        ],
      ),
    );
  }

  _orText() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: VBox(
          style: Style(
            $box.alignment(Alignment.topLeft),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Colors.white, // Define a cor de fundo como branca
                  child: const SizedBox(height: 1.0, width: 140),
                ),
                const Text(
                  "ou",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  color: Colors.white, // Define a cor de fundo como branca
                  child: const SizedBox(height: 1.0, width: 140),
                ),
              ],
            ),
          ]),
    );
  }

  _registerButton(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(context, '/registerpage');
          },
          text: "Cadastre-se agora"),
    );
  }
}
