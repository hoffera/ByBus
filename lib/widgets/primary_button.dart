import 'package:bybus/enum/enum.dart';
import 'package:bybus/widgets/core_button.dart'; // Suponho que esteja importado corretamente
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final void Function() onPressed;
  final bool funds;
  final bool? logoff;
  final String text;
  final Color color;

  const PrimaryButton({
    Key? key,
    required this.color,
    this.logoff = false,
    required this.text,
    required this.funds,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  Color? currentColor;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentColor = widget.funds ? widget.color : AppColors.primary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(
            20), // Mesmo valor do borderRadius usado no Material
        child: _buildContainer(),
      ),
    );
  }

  Widget _buildContainer() {
    return Ink(
      decoration: BoxDecoration(
        color: currentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
          child: CoreButton(
            logoff: widget.logoff!,
            funds: widget.funds,
            cta: true,
            text: widget.text,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
