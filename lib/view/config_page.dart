import 'package:bybus/enum/enum.dart';
import 'package:bybus/services/auth_services.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:bybus/widgets/reset_password_dialog.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              _title(),
              const SizedBox(height: 10.0),
              _subtitle(),
              const SizedBox(height: 50.0),
              _colorButton(context),
              const SizedBox(height: 50.0),
              _languageButton(context),
              const SizedBox(height: 50.0),
              _deleteAccountButton(context),
              const SizedBox(height: 50.0),
              _logoutButton(context),
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
          "Configuração",
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
          "Configure o aplicativo da  ByBus",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  _colorButton(context) {
    return SizedBox(
      height: 60,
      child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          text: "Modo daltonismo"),
    );
  }

  _languageButton(context) {
    return SizedBox(
      height: 60,
      child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          text: "Idioma / EM ANDAMENTO"),
    );
  }

  _logoutButton(context) {
    return SizedBox(
        height: 60,
        child: PrimaryButton(
          funds: true,
          logoff: true,
          color: Colors.grey,
          text: "Sair",
          onPressed: () {
            AuthService().deslogar().then((error) {
              if (error == null) {
                Navigator.pushNamed(context, '/homeloginpage');
              }
            });
          },
        ));
  }

  void showPasswordResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PasswordResetDialog(
          password: true,
        );
      },
    );
  }

  _deleteAccountButton(context) {
    return SizedBox(
      height: 60,
      child: PrimaryButton(
          funds: true,
          logoff: true,
          color: Colors.red,
          onPressed: () {
            showPasswordResetDialog(context);
          },
          text: "Deletar conta"),
    );
  }
}
