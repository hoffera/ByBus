import 'package:bybus/enum/enum.dart';
import 'package:bybus/widgets/BalanceText.dart';
import 'package:bybus/widgets/drop_button.dart';
import 'package:bybus/widgets/map_widget.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  final User user;
  const MapPage({super.key, required this.user});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          _map(),
          const SizedBox(height: 10),
         _balance(),
          _goToText(),
          _timeText(),
          const SizedBox(height: 10.0),
          _payButton(context),
        ],
      ),
    ));
  }
  

  _map() {
    return const SizedBox(
      height: 500,
      width: double.infinity,
      child: MapWidget(),
    );
  }
  _balance(){
    return Padding(
              padding: const EdgeInsets.all(15.0),
              child: BalanceText(uid: widget.user.uid)),

  }

  _goToText() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title("Ir para:"),
          const SizedBox(width: 10),
          const DropButton(),
        ],
      ),
    );
  }

  _timeText() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title("Hora:"),
          const SizedBox(width: 50),
          const DropButton(),
        ],
      ),
    );
  }

  _title(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
  _payButton(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 50,
        child: PrimaryButton(
            funds: false,
            color: AppColors.primary,
            onPressed: () {
              Navigator.pushNamed(context, '/configpage');
            },
            text: "Prosseguir para a compra"),
      ),
    );
  }


}
