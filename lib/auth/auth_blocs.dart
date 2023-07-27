import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/auth/auth_events.dart';
import 'package:training_app/auth/auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<UsernameEmailEvent>(_usernameEmailEvent);
  }

  void _usernameEmailEvent(UsernameEmailEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email, username: event.username));
  }
}
