// UNIFY BLOC PROVIDER, ROUTES, AND PAGES
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/common/routes/names.dart';
import 'package:training_app/pages/application/application_page.dart';
import 'package:training_app/pages/application/bloc/application_blocs.dart';
import 'package:training_app/pages/signin/bloc/signin_blocs.dart';
import 'package:training_app/pages/signin/signin_page.dart';
import 'package:training_app/pages/signup/bloc/signup_blocs.dart';
import 'package:training_app/pages/signup/signup_page.dart';
import 'package:training_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:training_app/pages/welcome/welcome_page.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        Route: AppRoutes.INITIAL,
        Page: const Welcome(),
        Bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        Route: AppRoutes.SIGN_IN,
        Page: const SignIn(),
        Bloc: BlocProvider(
          create: (_) => SignInBlocs(),
        ),
      ),
      PageEntity(
        Route: AppRoutes.REGISTER,
        Page: const SignUpPage(),
        Bloc: BlocProvider(
          create: (_) => SignUpBloc(),
        ),
      ),
      PageEntity(
        Route: AppRoutes.APPLICATION,
        Page: const ApplicationPage(),
        Bloc: BlocProvider(
          create: (context) {
            return ApplicationBloc();
          },
        ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];

    for (var bloc in routes()) {
      blocProviders.add(bloc.Bloc);
    }

    return blocProviders;
  }
}

class PageEntity {
  String Route;
  Widget Page;
  dynamic? Bloc;

  PageEntity({
    required this.Route,
    required this.Page,
    this.Bloc,
  });
}
