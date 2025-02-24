import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {
  AppCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  Function(bool?)? onChanged;
  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color(0xFF22586B);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: 24,
        width: 24,
        child: Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.5)),
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: widget.isChecked,
          onChanged: widget.onChanged,
          isError: widget.isChecked == false ? true : false,
        ),
      ),
    );
  }
}
