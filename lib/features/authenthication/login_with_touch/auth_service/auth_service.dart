import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class AuthService {
  static Future<bool> authenticateUser() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();

    bool isAuthenticated = false;

    bool isBiometricSupported = await localAuthentication.isDeviceSupported();

    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
            useErrorDialogs: true,
          ),
        );
      } on PlatformException catch (e) {
        if (e.code == auth_error.notAvailable) {
          BotToast.showText(text: auth_error.notAvailable.toString());
        } else if (e.code == auth_error.notEnrolled) {
          BotToast.showText(text: auth_error.notEnrolled.toString());
        } else if (e.code == auth_error.lockedOut ||
            e.code == auth_error.permanentlyLockedOut) {
          BotToast.showText(
              text:
                  "${auth_error.permanentlyLockedOut} Please come back later after 30 Seconds");
        } else {
          BotToast.showText(text: e.message.toString());
        }
      }
    }
    return isAuthenticated;
  }
}
