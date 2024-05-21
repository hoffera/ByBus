import 'package:bybus/enum/enum.dart';
import 'package:flutter/material.dart';

class DropButton extends StatefulWidget {
  const DropButton({Key? key}) : super(key: key);

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    List<String> dropDownItems = <String>['12:00', '13:00', '14:00', '1:00'];

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
          hint: const Text(
            "Univali",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          value: selectedValue,
          isExpanded: true,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(20.0),
          dropdownColor: AppColors.primary,
          items: dropDownItems.map((String value) {
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
          },
        ),
      ),
    );
  }
}
