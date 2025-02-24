abstract class OtpVerificationNavigation {}

class VerificationNavigation extends OtpVerificationNavigation {
  VerificationNavigation(this.email);
  final String email;
}
