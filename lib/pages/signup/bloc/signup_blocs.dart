import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/pages/signup/bloc/signup_events.dart';
import 'package:training_app/pages/signup/bloc/signup_states.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpStates> {
  SignUpBloc() : super(const SignUpStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(username: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpStates> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
