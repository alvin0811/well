import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    super.key,
    required this.onChanged,
  });
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      textStyle: Theme.of(context).textTheme.headlineSmall,
      showCursor: false,
      autoDismissKeyboard: true,
      keyboardType: TextInputType.number,
      length: 4,
      obscureText: false,
      animationType: AnimationType.none,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 45,
        fieldWidth: 60,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.black,
        selectedColor: const Color(0xFF4AB7C3),
        inactiveColor: const Color(0xFFD0D0D0),
        activeColor: const Color(0xFF4AB7C3),
      ),
      cursorHeight: 50,
      cursorWidth: 40,
      appContext: context,
      onChanged: onChanged,
    );
  }
}
