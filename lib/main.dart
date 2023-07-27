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
                  home:
                      BlocProvider.of<AuthBloc>(context).state.email.isEmpty &&
                              BlocProvider.of<AuthBloc>(context)
                                  .state
                                  .username
                                  .isEmpty
                          ? const SignIn()
                          : const ApplicationPage(),
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

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: const Text("Learning App"),
//       ),
//       body: Center(
//           // Center is a layout widget. It takes a single child and positions it
//           // in the middle of the parent.
//           child: BlocBuilder<HomeBlocs, HomeStates>(
//         builder: (context, state) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'You have pushed the button this many times:',
//               ),
//               Text(
//                 "${BlocProvider.of<HomeBlocs>(context).state.counter}",
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ],
//           );
//         },
//       )),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             heroTag: 'decrement-btn',
//             onPressed: () =>
//                 BlocProvider.of<HomeBlocs>(context).add(Decrement()),
//             tooltip: 'Decrement',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             heroTag: 'increment-btn',
//             onPressed: () =>
//                 BlocProvider.of<HomeBlocs>(context).add(Increment()),
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           )
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
