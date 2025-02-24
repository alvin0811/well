import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/corewidgets/wellPath_secondary_button.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';

class _WellPathLogoutDialog extends StatelessWidget {
  final String title;
  final String primaryButtonText;
  final String secondaryButtonText;
  final void Function()? onPrimaryPressed;
  final void Function()? onSecondaryPressed;

  const _WellPathLogoutDialog(
      {required this.title,
      required this.primaryButtonText,
      required this.secondaryButtonText,
      required this.onPrimaryPressed,
      required this.onSecondaryPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset("assets/images/ic_logout_popup.svg"),
              const SizedBox(height: 30),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WellPathButton(
                      width: MediaQuery.of(context).size.width * 0.32,
                      buttonText: primaryButtonText,
                      onPressed: onPrimaryPressed,
                    ),
                    WellPathSecondaryButton(
                        width: MediaQuery.of(context).size.width * 0.32,
                        onPressed: onSecondaryPressed,
                        buttonText: Text(secondaryButtonText))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> showLogoutDialog(
  BuildContext context, {
  required String title,
  required final String primaryButtonText,
  required final String secondaryButtonText,
  final void Function()? onPrimaryPressed,
  final void Function()? onSecondaryPressed,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return _WellPathLogoutDialog(
          title: title,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          onPrimaryPressed: onPrimaryPressed,
          onSecondaryPressed: onSecondaryPressed);
    },
  );
}
