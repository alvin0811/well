import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationActionButton extends StatefulWidget {
  void Function()? onNotificationPressed;
  NotificationActionButton({super.key, required this.onNotificationPressed});

  @override
  State<NotificationActionButton> createState() =>
      _NotificationActionButtonState();
}

class _NotificationActionButtonState extends State<NotificationActionButton> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: InkWell(
          onTap: widget.onNotificationPressed,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/images/ic_setting_notification.svg',
            ),
          )),
    );
  }
}
