abstract class ForgotPasswordNavigation {}

class OtpForgotPasswordNavigation extends ForgotPasswordNavigation {
  OtpForgotPasswordNavigation(this.email);
  final String email;
}
