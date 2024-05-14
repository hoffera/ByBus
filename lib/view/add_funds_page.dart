import 'package:bybus/enum/enum.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class AddFundsPage extends StatelessWidget {
  const AddFundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 70.0),
              _title(),
              const SizedBox(height: 10.0),
              _subtitle(),
              const SizedBox(height: 40.0),
              _addFunds5(context),
              const SizedBox(height: 20.0),
              _addFunds10(context),
              const SizedBox(height: 20.0),
              _addFunds20(context),
              const SizedBox(height: 20.0),
              _addFunds50(context),
              const SizedBox(height: 20.0),
              _addFunds100(context),
              const SizedBox(height: 20.0),
              _addFunds200(context),
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
          "Adicionar fundos",
          style: TextStyle(
              fontSize: 32,
              color: AppColors.primary,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _subtitle() {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "Adicionar fundos à sua carteira ByBus\n",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Fundos na sua Carteira podem ser usados na compra de qualquer viagem. Você terá a oportunidade de revisar o seu pedido antes que ele seja finalizado.",
            ),
          ],
        ),
      ),
    );
  }

  _addFunds5(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: true,
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          text: "Adicionar R\$ 5,00"),
    );
  }

  _addFunds10(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: true,
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          text: "Adicionar R\$ 10,00"),
    );
  }

  _addFunds20(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: true,
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          text: "Adicionar R\$ 20,00"),
    );
  }

  _addFunds50(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: true,
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          text: "Adicionar R\$ 50,00"),
    );
  }

  _addFunds100(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: true,
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          text: "Adicionar R\$ 100,00"),
    );
  }

  _addFunds200(context) {
    return SizedBox(
      height: 50,
      child: PrimaryButton(
          funds: true,
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          text: "Adicionar R\$ 200,00"),
    );
  }
}
