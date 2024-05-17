import 'package:bybus/enum/enum.dart';
import 'package:bybus/services/auth_services.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:bybus/widgets/show_snackbar.dart';
import 'package:bybus/widgets/text_input.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  AuthService authServices = AuthService();
  final _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

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
              _inputs(),
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
          "Cadastrar",
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
          "Crie uma conta na ByBus",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  _inputs() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _nameInput(),
          const SizedBox(height: 20.0),
          _emailInput(),
          const SizedBox(height: 20.0),
          _passwordInput(),
          const SizedBox(height: 20.0),
          _repasswordInput(),
        ],
      ),
    );
  }

  _nameInput() {
    return Column(
      children: [
        const Row(
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
        const SizedBox(height: 10.0),
        TextInput(
          off: false,
          password: false,
          name: true,
          text: 'Nome Completo',
          controller: _nameController,
        ),
      ],
    );
  }

  _emailInput() {
    return Column(
      children: [
        const Row(
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
        const SizedBox(height: 10.0),
        TextInput(
          off: false,
          password: false,
          text: 'Seu e-mail',
          controller: _emailController,
        ),
      ],
    );
  }

  _passwordInput() {
    return Column(
      children: [
        const Row(
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
        const SizedBox(height: 10.0),
        TextInput(
          off: false,
          password: true,
          text: 'Sua senha',
          controller: _passwordController,
        ),
      ],
    );
  }

  _repasswordInput() {
    return Column(
      children: [
        const Row(
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
        const SizedBox(height: 10.0),
        TextInput(
          off: false,
          password: true,
          text: "Repita sua senha",
          controller: _rePasswordController,
        ),
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
            _registerButtonPressed(context);
          },
          text: "Cadastrar"),
    );
  }

  _passwordCorrect() {
    if (_passwordController.text == _rePasswordController.text) {
      return true;
    }
    return false;
  }

  _registerButtonPressed(context) {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;

    if (_formKey.currentState!.validate() && _passwordCorrect()) {
      authServices
          .registerUser(name: name, email: email, password: password)
          .then((error) {
        if (error == null) {
          showSnackBar(
              context: context,
              mensagem: "Usuario cadastrado com sucesso!",
              isErro: true);
          Navigator.pushNamed(context, '/navpage');
        }
      });
    }
  }
}
