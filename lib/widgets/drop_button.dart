import 'package:bybus/enum/enum.dart';
import 'package:flutter/material.dart';

class DropButton extends StatefulWidget {
  List<String> dropDownItems;
  final void Function(String) onSelected;
  DropButton({Key? key, required this.dropDownItems, required this.onSelected})
      : super(key: key);

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  @override
  void initState() {
    super.initState();

    setState(() {
      selectedValue = widget.dropDownItems.first;
    });
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary, // Define a cor rosa aqui
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 7, 7, 7),
        child: DropdownButton<String>(
          hint: Text(
            selectedValue!,
            style: const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          value: selectedValue,
          isExpanded: true,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(20.0),
          dropdownColor: AppColors.primary,
          items: widget.dropDownItems.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue!;
            });
            widget.onSelected(selectedValue!);
          },
        ),
      ),
    );
  }
}
