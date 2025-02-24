import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/gen/assets.gen.dart';

class SettingsActionButton extends StatefulWidget {
  void Function()? onSettingPressed;
  bool isShowWhiteIcon;
  SettingsActionButton(
      {super.key,
      required this.onSettingPressed,
      this.isShowWhiteIcon = false});

  @override
  State<SettingsActionButton> createState() => _SettingsActionButtonState();
}

class _SettingsActionButtonState extends State<SettingsActionButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onSettingPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            widget.isShowWhiteIcon
                ? Assets.images.icSettingWhite
                : Assets.images.icSetting,
          ),
        ));
  }
}
