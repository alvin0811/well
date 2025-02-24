import 'package:flutter/material.dart';

class WellPathAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final bool isShowBackButton;
  final bool isProfileImageVisible;
  final List<Widget>? actions;
  final Widget? leading;

  const WellPathAppBar(
      {super.key,
      // this.isShowBackButton = true,
      this.isProfileImageVisible = false,
      this.actions,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leadingWidth: isProfileImageVisible ? 250 : 110,
        leading: leading,
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
