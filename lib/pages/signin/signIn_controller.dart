import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:training_app/auth/auth_blocs.dart';
import 'package:training_app/auth/auth_events.dart';
import 'package:training_app/common/widgets/flutter_toast.dart';
import 'package:training_app/pages/signin/bloc/signin_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future handleSignIn(String type) async {
    try {
      switch (type) {
        case 'email':
          {
            final state = BlocProvider.of<SignInBlocs>(context).state;
            String emailAddress = state.email;
            String password = state.password;

            if (emailAddress.isEmpty) {
              return toastInfo(msg: "Please enter your email");
            }
            if (password.isEmpty) {
              return toastInfo(msg: "Please enter your password");
            }

            try {
              final credential =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: emailAddress,
                password: password,
              );

              BlocProvider.of<AuthBloc>(context).add(
                  UsernameEmailEvent(email: emailAddress, username: "test"));

              if (credential.user == null) {
                return toastInfo(
                    msg:
                        "You might provided wrong credential or account is not found");
              }
              if (!credential.user!.emailVerified) {
                return toastInfo(msg: "You need to verify your email");
              }

              var user = credential.user;
              if (user != null) {
                // GET VERIFIED USER FROM FIREBASE
              } else {
                return toastInfo(msg: "Account not found, please sign up");
              }
            } on FirebaseAuthException catch (e) {
              switch (e.code) {
                case 'invalid-email':
                  {
                    return toastInfo(
                        msg: "Your email or password might be wrong");
                  }
                case 'wrong-password':
                  {
                    return toastInfo(
                        msg: "Your email or password might be wrong");
                  }
                case 'user-not-found':
                  {
                    return toastInfo(msg: "Account not found");
                  }
                default:
                  {
                    return toastInfo(msg: "Error occured: ${e.message}");
                  }
              }
            }
          }
          break;
        case 'google':
          {
            GoogleSignIn _googleSignIn = GoogleSignIn(
              scopes: [
                'email',
                'https://www.googleapis.com/auth/contacts.readonly',
              ],
            );
            final GoogleSignInAccount? googleUser =
                await _googleSignIn.signIn();

            final GoogleSignInAuthentication? googleAuth =
                await googleUser?.authentication;

            final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth?.accessToken,
              idToken: googleAuth?.idToken,
            );

            return await FirebaseAuth.instance.signInWithCredential(credential);
          }
          break;
        default:
          {}
          break;
      }
    } catch (e) {
      return toastInfo(msg: e.toString());
    }
  }
}
