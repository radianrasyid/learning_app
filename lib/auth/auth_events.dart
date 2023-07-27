abstract class AuthEvent {
  const AuthEvent();
}

class UsernameEmailEvent extends AuthEvent {
  final String email;
  final String username;

  const UsernameEmailEvent({
    this.email = "",
    this.username = "",
  });
}
