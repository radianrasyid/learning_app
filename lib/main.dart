import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/auth/auth_blocs.dart';
import 'package:training_app/auth/auth_states.dart';
import 'package:training_app/firebase_options.dart';
import 'package:training_app/pages/application/application_page.dart';
import 'package:training_app/pages/block_provider.dart';
import 'package:training_app/pages/signin/signin_page.dart';
import 'package:training_app/pages/signup/signup_page.dart';
import 'package:training_app/pages/welcome/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlockProviders.allBlocProviders,
        child: ScreenUtilInit(
          builder: (context, child) {
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      appBarTheme: const AppBarTheme(
                          elevation: 0, backgroundColor: Colors.white),
                      buttonTheme: const ButtonThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      )),
                  home: const SignIn(),
                  routes: {
                    // 'myHomePage': (context) => const MyHomePage(),
                    'welcomeScreen': (context) => const Welcome(),
                    'signIn': (context) => const SignIn(),
                    'signup': (context) => const SignUpPage(),
                    'home': (context) => const ApplicationPage(),
                  },
                );
              },
            );
          },
        ));
  }
}
