import 'package:bybus/enum/enum.dart';
import 'package:bybus/services/auth_services.dart';
import 'package:bybus/widgets/primary_button.dart';
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
              const SizedBox(height: 80.0),
              _title(),
              const SizedBox(height: 10.0),
              _subtitle(),
              const SizedBox(height: 70.0),
              _colorButton(context),
              const SizedBox(height: 50.0),
              _languageButton(context),
              const SizedBox(height: 50.0),
              _fontButton(context),
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
          text: "Idioma"),
    );
  }

  _logoutButton(context) {
    return SizedBox(
      height: 60,
      child: PrimaryButton(
          funds: true,
          logoff: true,
          color: Colors.red,
          onPressed: () {
            AuthService().deslogar();
          },
          text: "Sair"),
    );
  }

  _fontButton(context) {
    return SizedBox(
      height: 60,
      child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          text: "Tamanho da fonte"),
    );
  }
}
