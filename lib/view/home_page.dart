import 'package:bybus/enum/enum.dart';
import 'package:bybus/theme/theme_provider.dart';
import 'package:bybus/widgets/color_button.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              const SizedBox(height: 20.0),
              _subtitle(),
              const SizedBox(height: 50.0),
              _primaryThemeButton(context),
              const SizedBox(height: 30.0),
              _deuteranopiThemeButton(context),
              const SizedBox(height: 30.0),
              _protanopiaThemeButton(context),
              const SizedBox(height: 30.0),
              _tritanopiaThemeButton(context),
              const SizedBox(height: 50.0),
              _confirmButton(context),
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
          "Cores",
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
          "Configure as cores do aplicativo da  ByBus",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  _primaryThemeButton(context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Original",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 50,
          child: ColorButton(
            color1: AppColors.primary,
            color2: AppColors.secondary,
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(1);
            },
          ),
        ),
      ],
    );
  }

  _deuteranopiThemeButton(context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Daltonismo Deuteranopia",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 50,
          child: ColorButton(
            color1: AppColors.primaryDeuteranopi,
            color2: AppColors.secondaryDeuteranopi,
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(2);
            },
          ),
        ),
      ],
    );
  }

  _protanopiaThemeButton(context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Daltonismo Protanopia",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 50,
          child: ColorButton(
            color1: AppColors.primaryProtanopia,
            color2: AppColors.secondaryProtanopia,
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(3);
            },
          ),
        ),
      ],
    );
  }

  _tritanopiaThemeButton(context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Daltonismo Tritanopia",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 50,
          child: ColorButton(
            color1: AppColors.primaryTritanopia,
            color2: AppColors.secondaryTritanopia,
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(4);
            },
          ),
        ),
      ],
    );
  }

  _confirmButton(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(context, '/navpage');
          },
          text: "Confirmar edição"),
    );
  }
}
