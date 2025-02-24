import 'package:flutter/material.dart';

import '../colors/colors.dart';

class SkipActionButton extends StatefulWidget {
  void Function()? onSkipPressed;
  SkipActionButton({super.key, required this.onSkipPressed});

  @override
  State<SkipActionButton> createState() => _SkipActionButtonState();
}

class _SkipActionButtonState extends State<SkipActionButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onSkipPressed,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('Skip',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: appPrimaryColor,
                      fontSize: 14)),
            ),
            const Icon(Icons.chevron_right_rounded,
                size: 24.0, color: appPrimaryColor),
          ],
        ),
      ),
    );
  }
}
