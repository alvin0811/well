import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/gen/assets.gen.dart';

class AppBarBackButton extends StatefulWidget {
  final Function() onBackPressed;
  bool isShowWhiteIcon;
  AppBarBackButton(
      {super.key, required this.onBackPressed, this.isShowWhiteIcon = false});

  @override
  State<AppBarBackButton> createState() => _AppBarBackButtonState();
}

class _AppBarBackButtonState extends State<AppBarBackButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onBackPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            SvgPicture.asset(widget.isShowWhiteIcon
                ? Assets.images.icAppBarBackArrowWhite
                : Assets.images.icAppBarBackArrow),
            Text(
              'Back',
              style: TextStyle(
                  color: widget.isShowWhiteIcon ? Colors.white : Colors.black),
            )
          ]),
        ));
  }
}
