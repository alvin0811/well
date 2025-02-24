import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/helper/enum/cubit_message_enums.dart';

extension StringValidationX on String {
  CubitMessages? get emailError {
    if (isEmpty) {
      return CubitMessages.requiredField;
    }

    if (!isEmailValid) {
      return CubitMessages.emailInvalid;
    }

    return null;
  }

  CubitMessages? get passwordError {
    if (isEmpty) {
      return CubitMessages.requiredField;
    }

    if (!isPasswordValid) {
      return CubitMessages.passwordInvalid;
    }

    return null;
  }

  CubitMessages? toConfirmPasswordError(String pass2) {
    if (isEmpty) {
      return CubitMessages.requiredField;
    }

    if (!isConfirmPasswordValid(pass2)) {
      return CubitMessages.passwordDontMatch;
    }

    return null;
  }

  CubitMessages? get fullNameError {
    if (isEmpty) {
      return CubitMessages.requiredField;
    }

    if (length < 2 || length > 199) {
      return CubitMessages.enterBetween2And200;
    }

    if (hasNumbersOrSpecialCharacters()) {
      return CubitMessages.fullNameSpecialCharacters;
    }

    return null;
  }

  CubitMessages? get zipCodeError {
    if (isEmpty) {
      return CubitMessages.requiredField;
    }

    if (!isZipCodeValid) {
      return CubitMessages.zipCodeInvalid;
    }

    return null;
  }

  CubitMessages? get phoneError {
    if (isEmpty) {
      return CubitMessages.requiredField;
    }

    // if (!isUsaPhoneNumberValid) {
    //   return CubitMessages.phoneInvalid;
    // }

    if (!isPhoneNumberLengthIsValid) {
      return CubitMessages.phoneInvalid;
    }

    return null;
  }

  CubitMessages? get universalError {
    if (isEmpty) {
      return CubitMessages.requiredField;
    }

    return null;
  }
}
