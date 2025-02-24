abstract class ChangePasswordNavigation {}

class OtpChangePasswordNavigation extends ChangePasswordNavigation {
  OtpChangePasswordNavigation(this.otp);
  final String otp;
}
