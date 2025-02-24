import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon, suffixIcon;
  double? horizontalPadding;
  final String? error;
  final Function(String) onChanged;
  final TextInputType? inputType;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final bool? textFieldEnabled;
  AppTextField({
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.onChanged,
    required this.obscureText,
    this.textEditingController,
    this.textInputFormatter,
    this.error,
    this.inputType,
    this.action,
    this.focusNode,
    this.textFieldEnabled,
    Key? key,
    this.horizontalPadding = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
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
            controller: textEditingController,
            textAlignVertical: TextAlignVertical.center,
            obscureText: obscureText,
            onChanged: onChanged,
            enabled: textFieldEnabled,
            textInputAction: action,
            inputFormatters: textInputFormatter,
            keyboardType: inputType,
            enableSuggestions: false,
            textAlign: TextAlign.left,
            focusNode: focusNode,
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
                  ?.copyWith(fontSize: 14.0, color: Colors.black),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
          ),
        ),
        const SizedBox.square(dimension: 4.0),
        error != null
            ? Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 9.0,
                        color: Colors.red,
                      ),
                ),
              )
            : const SizedBox.square(dimension: 0.0),
      ],
    );
  }
}
