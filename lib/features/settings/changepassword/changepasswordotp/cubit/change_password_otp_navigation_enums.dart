abstract class SettingResetPasswordNavigation {}

class OtpSettingResetPasswordNavigation extends SettingResetPasswordNavigation {
  OtpSettingResetPasswordNavigation(this.otp);
  final String otp;
}
