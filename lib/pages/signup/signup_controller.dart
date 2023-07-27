import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/common/widgets/flutter_toast.dart';
import 'package:training_app/pages/signup/bloc/signup_blocs.dart';

class SignUpController {
  final BuildContext context;

  const SignUpController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<SignUpBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    print(email);

    final Map<String, String> myMap = {
      'userName': state.userName,
      'email': state.email,
      'password': state.password,
      'confirmPassword': state.confirmPassword,
    };

    bool validateForm = true;
    List<String> needValidation = [];
    myMap.forEach((key, value) {
      if (value.isEmpty) {
        validateForm = false;
        needValidation.add('key');
      }
    });

    if (needValidation.isNotEmpty) {
      toastInfo(msg: '${needValidation.toString()} got errors');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg: "An email has been sent to your email address to verify");
        Navigator.of(context).pop();
      }
    } on FirebaseException catch (e) {
      toastInfo(msg: e.message.toString());
    }
  }
}
