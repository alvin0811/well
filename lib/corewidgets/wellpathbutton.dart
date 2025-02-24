import 'package:flutter/material.dart';

import '../colors/colors.dart';

class WellPathButton extends StatefulWidget {
  final void Function()? onPressed;
  final String buttonText;
  final double? width;
  Color? backgroundColor;
  WellPathButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.width,
      this.backgroundColor = appPrimaryColor})
      : super(key: key);

  @override
  State<WellPathButton> createState() => _WellPathButtonState();
}

class _WellPathButtonState extends State<WellPathButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor: widget.backgroundColor,
            elevation: 10),
        onPressed: widget.onPressed,
        child: Text(
          widget.buttonText,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
