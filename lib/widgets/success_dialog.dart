import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';

class _WellPathSuccessDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final String buttonText;
  final void Function()? onPressed;
  const _WellPathSuccessDialog({
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: SizedBox(
        height: 400,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            SvgPicture.asset("assets/images/ic_congratulations.svg"),
            const SizedBox(height: 30),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: WellPathButton(
                buttonText: buttonText,
                onPressed: onPressed,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> showSuccessDialog(
  BuildContext context, {
  final void Function()? onPressed,
  required String title,
  required String subTitle,
  required String buttonText,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return _WellPathSuccessDialog(
        title: title,
        subTitle: subTitle,
        buttonText: buttonText,
        onPressed: onPressed,
      );
    },
  );
}
