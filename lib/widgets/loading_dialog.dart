import 'package:flutter/material.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/extensions/extensions.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog._();

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: appPrimaryColor,
    ));
  }

  static const dialog = LoadingDialog._();

  static Future<void> show(BuildContext context) async {
    return context.showLoadingDialog(dialog);
  }

  static Future<void> hide(BuildContext context) async {
    return _closeDialog(context);
  }

  static void _closeDialog(BuildContext context) {
    final rootNavigator = Navigator.of(context, rootNavigator: true);

    if (_isDialogVisible(context)) {
      rootNavigator.pop();
    }
  }

  static bool _isDialogVisible(BuildContext context) {
    var isVisible = false;
    Navigator.of(context, rootNavigator: true).popUntil((route) {
      isVisible = route is PopupRoute;
      return !isVisible;
    });
    return isVisible;
  }
}
