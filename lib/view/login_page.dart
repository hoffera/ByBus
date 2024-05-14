import 'package:bybus/enum/enum.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:bybus/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              _logo(),
              const SizedBox(height: 15),
              _title(),
              const SizedBox(height: 15.0),
              _inputs(),
              const SizedBox(height: 15.0),
              _loginButton(context),
              const SizedBox(height: 15),
              _resetPasswordButton(),
              _orText(),
              const SizedBox(height: 15.0),
              _registerButton(context),
            ],
          ),
        ),
      ),
    );
  }

  _logo() {
    return Image.asset(
      height: 326,
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
    return const VBox(
      children: [
        TextInput(),
        SizedBox(height: 15.0),
        TextInput(),
      ],
    );
  }

  _loginButton(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(context, '/loginpage');
          },
          text: "Entrar"),
    );
  }

  _resetPasswordButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: VBox(
        style: Style(
          $box.alignment(Alignment.bottomRight),
        ),
        children: const [
          Text("Esqueci minha senha",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ))
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
            Navigator.pushNamed(context, '/loginpage');
          },
          text: "Cadastre-se agora"),
    );
  }
}