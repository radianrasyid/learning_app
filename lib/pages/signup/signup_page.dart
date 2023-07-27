import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/common/values/colors.dart';
import 'package:training_app/common/widgets/common_widgets.dart';
import 'package:training_app/pages/signup/bloc/signup_blocs.dart';
import 'package:training_app/pages/signup/bloc/signup_events.dart';
import 'package:training_app/pages/signup/bloc/signup_states.dart';
import 'package:training_app/pages/signup/signup_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar(title: 'Sign Up'),
              body: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        reusableText(
                            text: "Enter your details below & free sign up"),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10.h, left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reusableText(text: "Username"),
                              regulerTextField(
                                  funcChange: (value) {
                                    BlocProvider.of<SignUpBloc>(context)
                                        .add(UserNameEvent(userName: value));
                                  },
                                  hintText: "Enter your username",
                                  inputType: TextInputType.text),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10.h, left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reusableText(text: "Email"),
                              regulerTextField(
                                  funcChange: (value) {
                                    BlocProvider.of<SignUpBloc>(context)
                                        .add(EmailEvent(email: value));
                                  },
                                  hintText: "Enter your email",
                                  inputType: TextInputType.text),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10.h, left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reusableText(text: "Password"),
                              regulerTextField(
                                  funcChange: (value) {
                                    BlocProvider.of<SignUpBloc>(context)
                                        .add(PasswordEvent(password: value));
                                  },
                                  hintText: "Enter your password",
                                  inputType: TextInputType.text,
                                  isObscure: true),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 15.h, left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reusableText(text: "Confirm Password"),
                              regulerTextField(
                                funcChange: (value) {
                                  BlocProvider.of<SignUpBloc>(context).add(
                                      ConfirmPasswordEvent(
                                          confirmPassword: value));
                                },
                                hintText: "Confirm your password",
                                inputType: TextInputType.text,
                                isObscure: true,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          child: reusableText(
                              text:
                                  "By creating an account you have to agree with our term & condition.",
                              textColor: Colors.black),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamed("signup");
                          SignUpController(context: context)
                              .handleEmailRegister();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          elevation: 0,
                          backgroundColor: AppColors.primaryElement,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.w)),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: AppColors.primaryElementText),
                        ),
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
