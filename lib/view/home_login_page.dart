import 'package:bybus/enum/enum.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class HomeLoginPage extends StatelessWidget {
  const HomeLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'lib/assets/logosem.png',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 50,
                child: PrimaryButton(
                  funds: true,
                  logoff: true,
                  color: AppColors.secondary,
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginpage');
                  },
                  text: "Entrar",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registerpage');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text(
                    'Cadastre-se agora',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                      // fontFamily: 'SourceSans'
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
