import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/common/values/colors.dart';
import 'package:training_app/common/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 0)
                ]),
            child: BottomNavigationBar(
              currentIndex: _index,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              elevation: 0,
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                    label: "Home",
                    icon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset("assets/icons/home.png"),
                    ),
                    activeIcon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset(
                        "assets/icons/home.png",
                        color: AppColors.primaryElement,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "Search",
                    icon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset("assets/icons/search2.png"),
                    ),
                    activeIcon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset(
                        "assets/icons/search2.png",
                        color: AppColors.primaryElement,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "Course",
                    icon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset("assets/icons/play-circle1.png"),
                    ),
                    activeIcon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset(
                        "assets/icons/play-circle1.png",
                        color: AppColors.primaryElement,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "Chat",
                    icon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset("assets/icons/message-circle.png"),
                    ),
                    activeIcon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset(
                        "assets/icons/message-circle.png",
                        color: AppColors.primaryElement,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "Profile",
                    icon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset("assets/icons/person2.png"),
                    ),
                    activeIcon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset(
                        "assets/icons/person2.png",
                        color: AppColors.primaryElement,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
