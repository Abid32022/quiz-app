import 'package:flutter/material.dart';
import 'package:quiz_app/views/bottom_nav/create_quizes/create_quiz.dart';

import 'package:quiz_app/views/bottom_nav/discover/discover_screen.dart';
import 'package:quiz_app/views/bottom_nav/home_screen/home_screen.dart';
import 'package:quiz_app/views/bottom_nav/my_quizes/my_quizes.dart';
import 'package:quiz_app/views/bottom_nav/my_status/my_status.dart';

import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  final screens = [
  const HomeScreen(),
  DiscoverScreen(),
    CreateQuiz(),
    MyQuizes(),
    MyStatusScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 3),
        height: MySize.scaleFactorHeight*72,
        decoration: const BoxDecoration(
          color: AppColors.bagroundColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.white,
              selectedItemColor: AppColors.themecolor,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,height: 1.8,color: AppColors.themecolor),
              unselectedLabelStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white),
              currentIndex: currentIndex,
              onTap: (a){
                setState(() {
                  currentIndex = a;
                });
              },
              items: [
                BottomNavigationBarItem(icon: Image.asset("assets/icons/bottom1.png",height: MySize.size20,color: currentIndex == 0 ? AppColors.themecolor: Colors.grey ,),label: "",),
                BottomNavigationBarItem(icon: Image.asset("assets/icons/bottom2.png",height: MySize.size20,color: currentIndex == 1? AppColors.themecolor:Colors.grey,),label: ""),
                BottomNavigationBarItem(icon: Image.asset("assets/icons/bottom3.png",height: MySize.size32,color: currentIndex == 2?AppColors.themecolor:Colors.grey,),label: ""),
                BottomNavigationBarItem(icon: Image.asset("assets/icons/bottom4.png",height: MySize.size20,color: currentIndex == 3?AppColors.themecolor:Colors.grey,),label: ""),
                BottomNavigationBarItem(icon: Image.asset("assets/icons/bottom5.png",height: MySize.size20,color: currentIndex == 4?AppColors.themecolor:Colors.grey,),label: ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
