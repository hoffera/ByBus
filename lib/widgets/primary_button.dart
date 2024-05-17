import 'package:bybus/enum/enum.dart';
import 'package:bybus/widgets/core_button.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class PrimaryButton extends StatefulWidget {
  final void Function() onPressed;
  final bool funds;
  final bool? logoff;

  final String text;
  final Color color;

  const PrimaryButton({
    super.key,
    required this.color,
    this.logoff = false,
    required this.text,
    required this.funds,
    required this.onPressed,
  });

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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapUp: (_) {
        widget.onPressed.call();

        return;
      },
      child: _buildContainer(),
    );
  }

  _buildContainer() {
    final styles = Style(
      $box.color(currentColor!),
      $box.borderRadius(20),
      $box.width(double.infinity),
      $box.padding(9, 15),
      $with.opacity(1),
    );
    return Box(
      style: styles,
      child: CoreButton(
        logoff: widget.logoff!,
        funds: widget.funds,
        cta: true,
        text: widget.text,
        color: Colors.white,
      ),
    );
  }
}
