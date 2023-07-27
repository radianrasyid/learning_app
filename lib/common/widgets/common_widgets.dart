import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/common/values/colors.dart';
import 'package:training_app/pages/signin/signIn_controller.dart';

AppBar buildAppBar({String? title}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    title: Text(
      title ?? 'Title',
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
    centerTitle: true,
  );
}

// WE NEED CONTEXT FOR ACCESSING BLOC
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        reusableIcons('google', () {
          SignInController(context: context).handleSignIn('google');
          print('tap google ni');
        }),
        reusableIcons('apple', () {}),
        reusableIcons('facebook', () {}),
      ],
    ),
  );
}

Widget reusableIcons(String iconName, void Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reusableText(
    {required String text, void Function()? tapped, Color? textColor}) {
  return GestureDetector(
    onTap: tapped,
    child: Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.grey.withOpacity(0.5),
          fontSize: 14.sp,
        ),
      ),
    ),
  );
}

Widget buildTextField({
  required void Function(String) funcChange,
  required String hintText,
  bool? isObscure,
  IconData? icon,
  TextInputType? inputType,
}) {
  return TextField(
    keyboardType: inputType ?? TextInputType.multiline,
    decoration: inputStyle(hintText: hintText, icon: icon),
    onChanged: funcChange,
    obscureText: isObscure ?? false,
    cursorColor: Colors.black,
  );
}

InputDecoration inputStyle({IconData? icon, required String hintText}) {
  return InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(icon),
      prefixIconColor: Colors.black,
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryElementBg),
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.primaryThreeElementText),
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryElement),
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)));
}

Widget regulerTextField({
  required void Function(String) funcChange,
  required String hintText,
  TextInputType? inputType,
  bool? isObscure,
}) {
  return TextField(
    keyboardType: inputType ?? TextInputType.text,
    onChanged: funcChange,
    obscureText: isObscure ?? false,
    cursorColor: Colors.black,
    decoration: InputDecoration(
        hintText: hintText,
        prefixIconColor: Colors.black,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryElementBg),
            borderRadius: BorderRadius.all(Radius.circular(15.w))),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.primaryThreeElementText),
            borderRadius: BorderRadius.all(Radius.circular(15.w))),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryElement),
            borderRadius: BorderRadius.all(Radius.circular(15.w))),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.all(Radius.circular(15.w))),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(15.w))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(15.w))),
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))),
  );
}
