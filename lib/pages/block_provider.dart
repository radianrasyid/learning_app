import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/auth/auth_blocs.dart';
import 'package:training_app/pages/signin/bloc/signin_blocs.dart';
import 'package:training_app/pages/signup/bloc/signup_blocs.dart';
import 'package:training_app/pages/welcome/bloc/welcome_blocs.dart';

class AppBlockProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => AuthBloc(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => WelcomeBloc(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SignInBlocs(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
      ];
}
