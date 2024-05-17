import 'package:bybus/enum/enum.dart';
import 'package:flutter/material.dart';

class LoadingAlert extends StatelessWidget {
  const LoadingAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            color: AppColors.primary,
          ),
          SizedBox(height: 16),
          Text("Carregando..."),
        ],
      ),
    );
  }
}
