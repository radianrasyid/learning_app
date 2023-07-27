class AuthState {
  final String email;
  final String username;

  const AuthState({this.email = "", this.username = ""});

  AuthState copyWith({
    String? email,
    String? username,
  }) {
    return AuthState(
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }
}
