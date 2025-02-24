import 'package:flutter/material.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/helper/enum/cubit_message_enums.dart';
import 'package:well_path/helper/helpers.dart';
import 'package:well_path/localization/app_localization.dart';
import 'package:well_path/localization/translations/translations.i69n.dart';

extension ObjectX on Object? {
  bool get isNotNull => this != null;
}

extension BuildContextX on BuildContext {
  Translations get l10n => AppLocalizations.of(this);

  NavigatorState get navigator => Navigator.of(this);

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Future<T?> showLoadingDialog<T>(Widget widget) {
    return showGeneralDialog<T>(
      context: this,
      pageBuilder: (_, __, ___) => widget,
      barrierDismissible: false,
      transitionBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  void showSnackBar(String message, {bool isError = true}) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: isError ? Colors.red : appPrimaryBlueColor,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 1),
      content: Text(
        message,
        style: textTheme.bodyLarge!.withColor(theme.colorScheme.surface),
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}

extension TextStyleX on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}

extension StringX on String? {
  bool get isEmailValid {
    return RegExp(_emailRegex).hasMatch(this ?? emptyString);
  }

  bool get isPasswordValid {
    return (this?.length ?? 0) >= _minPasswordLength;
  }

  bool get isUsaPhoneNumberValid {
    return RegExp(_ukPhoneNumberRegex).hasMatch(this ?? emptyString);
  }

  bool get isPhoneNumberLengthIsValid {
    return (this?.length ?? 0) >= _minPhoneNumberLength;
  }

  bool get isZipCodeValid {
    return RegExp(_zipCodeRegex).hasMatch(this ?? emptyString);
  }

  bool isConfirmPasswordValid(String password) {
    return this?.compareTo(password) == 0;
  }

  bool isValidURL(String url) {
    return Uri.parse(url).isAbsolute;
  }

  bool hasNumbersOrSpecialCharacters() {
    return RegExp(_onlyStringRegex).hasMatch(this ?? emptyString);
  }

  String get orEmpty => isNotNull ? this! : emptyString;

  static const _onlyStringRegex = r'[^a-zA-Z\s]';

  static const _emailRegex = r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+';

  static const _zipCodeRegex = r'(^\d{5}$)|(^\d{5}-\d{4}$)';

  static const _ukPhoneNumberRegex = r'^(?:00|\\+)[0-9\\s.\\/-]{6,20}$';

  static const _minPasswordLength = 6;

  static const _minPhoneNumberLength = 10;
}

extension CubitMessagesX on CubitMessages? {
  String? toLocalizedString(BuildContext context) {
    switch (this) {
      case CubitMessages.emailInvalid:
        return 'Enter a valid email address';
      case CubitMessages.passwordInvalid:
        return 'Password should be minimum 6 characters long';
      case CubitMessages.passwordDontMatch:
        return 'Please make sure your passwords match';
      case CubitMessages.requiredField:
        return 'This is a required field';
      case CubitMessages.zipCodeInvalid:
        return 'Please enter a valid Zip Code';
      case CubitMessages.phoneInvalid:
        return 'Please enter a valid phone number';
      case CubitMessages.unexpectedError:
        return 'Unexpected error occurred';
      case null:
        return null;
      case CubitMessages.enterBetween2And200:
        return 'Enter between 2 and 200 characters';
      case CubitMessages.fullNameSpecialCharacters:
        return 'Full name should not contain any numbers or special characters';
      case CubitMessages.somethingWentWrong:
        return 'some thing Went Wrong';
    }
  }
}

extension DateTimeX on DateTime {
  String formatedOffset() {
    final offset = timeZoneOffset;
    final sign = offset.isNegative ? '-' : '+';
    final hours = offset.abs().inHours;
    final minutes = offset.abs().inMinutes % 60;

    final formattedOffset =
        '$sign${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
    return formattedOffset;
  }
}
