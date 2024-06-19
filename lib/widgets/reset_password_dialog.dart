// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybus/services/auth_services.dart';
import 'package:bybus/widgets/show_snackbar.dart';
import 'package:bybus/widgets/text_input.dart';
import 'package:flutter/material.dart';

class PasswordResetDialog extends StatefulWidget {
  bool? password = false;
  PasswordResetDialog({
    Key? key,
    this.password,
  }) : super(key: key);

  @override
  _PasswordResetDialogState createState() => _PasswordResetDialogState();
}

class _PasswordResetDialogState extends State<PasswordResetDialog> {
  final TextEditingController _emailController = TextEditingController();
  AuthService authServices = AuthService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.password! ? 'Deletar conta, sua senha' : 'Redefinir Senha',
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextInput(
            off: false,
            password: false,
            email: true,
            controller: _emailController,
            text: widget.password! ? 'Senha' : 'E-mail',
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (widget.password == true) {
              String email = _emailController.text;
              authServices.removerConta(password: email).then((error) {
                if (error == null) {
                  showSnackBar(
                      context: context,
                      mensagem: "Usuario removido com sucesso!",
                      isErro: true);
                  Navigator.pushNamed(context, '/homeloginpage');
                }
              });
            } else {
              String email = _emailController.text;
              authServices.resetPassword(email: email);
              Navigator.of(context).pop(); // Fecha o diálogo
            }
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
      return PasswordResetDialog();
    },
  );
}
