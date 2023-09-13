import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/pages/signin/bloc/signin_events.dart';
import 'package:training_app/pages/signin/bloc/signin_states.dart';

class SignInBlocs extends Bloc<SignInEvents, SignInState> {
  SignInBlocs() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
