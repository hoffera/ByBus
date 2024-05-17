import 'package:bybus/enum/enum.dart';
import 'package:bybus/services/auth_services.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:bybus/widgets/show_snackbar.dart';
import 'package:bybus/widgets/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final User user;
  UserPage({super.key, required this.user});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthService authServices = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              _title(),
              const SizedBox(height: 10.0),
              _subtitle(),
              const SizedBox(height: 30.0),
              _inputs(),
              const SizedBox(height: 30.0),
              _editButton(context),
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

  _inputs() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _nameInput(),
          const SizedBox(height: 20.0),
          _emailInput(),
          const SizedBox(height: 20.0),
          //  _passwordInput(),
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
          text: "${user.displayName}",
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
          off: true,
          password: false,
          text: "${user.email}",
          controller: _emailController,
        ),
      ],
    );
  }

  _editButton(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            _editButtonPressed(context);
          },
          text: "Editar"),
    );
  }

  _editButtonPressed(context) {
    String name = _nameController.text;

    if (name != "") {
      authServices.editUser(name: name).then((error) {
        if (error != null) {
          showSnackBar(context: context, mensagem: error, isErro: true);
        } else {
          showSnackBar(
              context: context,
              mensagem: "Usuário atualizado com sucesso!",
              isErro: false);
        }
      });
    } else {
      showSnackBar(
          context: context, mensagem: "Insira um novo Nome!", isErro: true);
    }
  }
}
