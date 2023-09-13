import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/common/values/colors.dart';
import 'package:training_app/common/widgets/common_widgets.dart';
import 'package:training_app/pages/signin/bloc/signin_blocs.dart';
import 'package:training_app/pages/signin/bloc/signin_events.dart';
import 'package:training_app/pages/signin/bloc/signin_states.dart';
import 'package:training_app/pages/signin/signIn_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar(title: 'Log In'),
              body: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                // physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 80.w),
                            child: buildThirdPartyLogin(context),
                          ),
                          reusableText(text: 'Or use your email account login'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 56.h),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText(text: 'Email'),
                          buildTextField(
                            hintText: "Enter your email address",
                            funcChange: (value) {
                              BlocProvider.of<SignInBlocs>(context)
                                  .add(EmailEvent(value));
                            },
                            icon: Icons.person,
                            isObscure: false,
                            inputType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          reusableText(text: 'Password'),
                          buildTextField(
                            hintText: "Enter your password",
                            funcChange: (value) {
                              BlocProvider.of<SignInBlocs>(context)
                                  .add(PasswordEvent(value));
                            },
                            icon: Icons.lock,
                            isObscure: true,
                            inputType: TextInputType.visiblePassword,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          reusableText(
                            text: 'Forgot Password?',
                            textColor: Colors.black,
                            tapped: () {},
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                SignInController(context: context)
                                    .handleSignIn('email');
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: AppColors.primaryElement,
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(15.w),
                                  ))),
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                    color: AppColors.primaryElementText),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("/register");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBackground,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.w),
                                  ),
                                  side: const BorderSide(
                                      color: AppColors.primaryText),
                                ),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
