import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool? email;
  final bool? password;

  const TextInput({
    super.key,
    required this.controller,
    required this.text,
    this.email,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (email == true) {
            if (value == null || value == "") {
              return "O valor de e-mail deve ser preenchido";
            }
            if (!value.contains("@") ||
                !value.contains(".") ||
                value.length < 4) {
              return "O valor do e-mail deve ser válido";
            }
            print('oi');
          } else if (password == true) {
            if (value == null || value.length < 4) {
              return "Insira uma senha válida.";
            }
          }

          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: text,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        style: const TextStyle(color: Colors.grey, fontSize: 14.0),
      ),
    );
  }
}
