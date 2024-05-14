import 'package:bybus/enum/enum.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:bybus/widgets/text_input.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              _title(),
              const SizedBox(height: 10.0),
              _subtitle(),
              const SizedBox(height: 30.0),
              _nameInput(),
              const SizedBox(height: 20.0),
              _emailInput(),
              const SizedBox(height: 20.0),
              _passwordInput(),
              const SizedBox(height: 20.0),
              _repasswordInput(),
              const SizedBox(height: 30.0),
              _registerButton(context),
            ],
          ),
        ),
      ),
    );
  }

  _title() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Perfil",
          style: TextStyle(
              fontSize: 32,
              color: AppColors.primary,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _subtitle() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Edite sua conta na ByBus",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  _nameInput() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Nome Completo",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        TextInput(),
      ],
    );
  }

  _emailInput() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "E-mail",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        TextInput(),
      ],
    );
  }

  _passwordInput() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Senha",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        TextInput(),
      ],
    );
  }

  _repasswordInput() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Repita sua senha",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        TextInput(),
      ],
    );
  }

  _registerButton(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(context, '/configpage');
          },
          text: "Editar"),
    );
  }
}
