import 'package:bybus/services/auth_services.dart';
import 'package:bybus/widgets/text_input.dart';
import 'package:flutter/material.dart';

class PasswordResetDialog extends StatefulWidget {
  const PasswordResetDialog({super.key});

  @override
  _PasswordResetDialogState createState() => _PasswordResetDialogState();
}

class _PasswordResetDialogState extends State<PasswordResetDialog> {
  final TextEditingController _emailController = TextEditingController();
  AuthService authServices = AuthService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Redefinir Senha',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextInput(
            off: false,
            password: false,
            email: true,
            controller: _emailController,
            text: 'E-mail',
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Adicione aqui a lógica para enviar o email de redefinição de senha
            String email = _emailController.text;
            authServices.resetPassword(email: email);
            Navigator.of(context).pop(); // Fecha o diálogo
          },
          child: const Text(
            'Enviar',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

// Para mostrar o popup:
void showPasswordResetDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const PasswordResetDialog();
    },
  );
}
