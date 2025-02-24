import 'package:flutter/material.dart';

// class WellPathSecondaryButton extends StatefulWidget {
//   final void Function()? onPressed;
//   final String buttonText;
//   final double? width;
//   const WellPathSecondaryButton(
//       {Key? key, required this.onPressed, required this.buttonText, this.width})
//       : super(key: key);

//   @override
//   State<WellPathSecondaryButton> createState() =>
//       _WellPathSecondaryButtonState();
// }

// class _WellPathSecondaryButtonState extends State<WellPathSecondaryButton> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
//       height: 50,
//       child: OutlinedButton(
//         style: OutlinedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30.0),
//             ),
//             backgroundColor: Colors.white,
//             foregroundColor: const Color(0xFFA9A9A9)),
//         onPressed: widget.onPressed,
//         child: Text(
//           widget.buttonText,
//           style: const TextStyle(fontSize: 15),
//         ),
//       ),
//     );
//   }
// }

class WellPathSecondaryButton extends StatefulWidget {
  final void Function()? onPressed;
  final Text buttonText;
  final double? width;
  final double height;
  final Color borderColor;

  const WellPathSecondaryButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.width,
      this.height = 50,
      this.borderColor = const Color(0xff4AB7C3)})
      : super(key: key);

  @override
  State<WellPathSecondaryButton> createState() =>
      _WellPathSecondaryButtonState();
}

class _WellPathSecondaryButtonState extends State<WellPathSecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
      height: widget.height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFFA9A9A9),
            side: BorderSide(color: widget.borderColor, width: 1)),
        onPressed: widget.onPressed,
        child: widget.buttonText,
      ),
    );
  }
}
