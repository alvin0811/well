import 'package:flutter/material.dart';

class WellPathTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon, suffixIcon;
  TextEditingController? textEditingController;
  double? horizontalPadding;
  TextInputType? keyboardType;

  final void Function(String)? onChanged;

  WellPathTextField(
      {required this.hintText,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.onChanged,
      required this.obscureText,
      Key? key,
      this.horizontalPadding = 15,
      this.keyboardType = TextInputType.text,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding!),
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD0D0D0),
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              0.5, // Move to right 5  horizontally
              0.5, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: TextField(
        keyboardType: keyboardType,
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.center,
        obscureText: obscureText,
        onChanged: onChanged,
        autocorrect: false,
        enableSuggestions: false,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontSize: 15.0, color: Colors.black),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 15.0),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 5)),
      ),
    );
  }
}
