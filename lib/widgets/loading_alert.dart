import 'package:flutter/material.dart';

class LoadingAlert extends StatelessWidget {
  const LoadingAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text("Carregando..."),
        ],
      ),
    );
  }
}
