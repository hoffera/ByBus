import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class ColorButton extends StatefulWidget {
  final void Function() onPressed;

  final Color color1;
  final Color color2;

  const ColorButton({
    super.key,
    required this.color1,
    required this.color2,
    required this.onPressed,
  });

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  Color? currentColor;

  @override
  void initState() {
    super.initState();

    setState(() {
      currentColor = Colors.white;
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
    final color1 = Style(
      $box.color(widget.color1),
      $box.borderRadius(20),
      $box.width(80),
      $box.height(35),
      $box.padding(9, 15),
      $with.opacity(1),
    );
    final color2 = Style(
      $box.color(widget.color2),
      $box.borderRadius(20),
      $box.width(80),
      $box.height(35),
      $box.padding(9, 15),
      $with.opacity(1),
    );
    return Box(
        style: styles,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Box(
              style: color1,
            ),
            Box(
              style: color2,
            )
          ],
        ));
  }
}
