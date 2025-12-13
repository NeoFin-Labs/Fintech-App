abstract class Success {
  final String? message;
  const Success([this.message]);
}

class AuthenticationSuccess extends Success {
  final dynamic data;
  const AuthenticationSuccess(this.data, [super.message]);
}

class PasswordResetSuccess extends Success {
  const PasswordResetSuccess([
    super.message = 'Password reset email sent successfully',
  ]);
}
