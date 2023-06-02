
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/auth/forget_screen.dart';
import 'package:quiz_app/views/auth/sign_up.dart';
import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';

import '../bottom_nav/bottom_nav.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.bagroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
          height: MySize.size40,
              ),
              genericAppBar(showText: false),
              SizedBox(
          height: MySize.size30,
              ),
              customTextRegular(
            title: "Welcome Back",
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            fontSize: MySize.size32),
              SizedBox(
          height: MySize.size5,
              ),
              customTextRegular(
          title: "Welcome Back! Please Enter Your Details.",
          fontWeight: FontWeight.w400,
          color: AppColors.grey89,
          fontSize: MySize.size16,
              ),
              SizedBox(
          height: MySize.size30,
              ),
              customTextRegular(
          title: "Email",
          fontWeight: FontWeight.w500,
          color: AppColors.black87,
          fontSize: MySize.size14,
              ),
              SizedBox(
          height: MySize.size5,
              ),
              SizedBox(
            height: MySize.size54,
            child: textField(
                hintText: "Enter your email",
                fontSize: MySize.size16,
                fontWeight: FontWeight.w400,
                prefixIcon: false,
                prefixImage: "assets/icons/msgs.png",
                bordercolor: Colors.transparent,
                filled: true,
                fillcolor: AppColors.white,


            )),
              SizedBox(
          height: MySize.size24,
              ),
              customTextRegular(
          title: "Password",
          fontWeight: FontWeight.w500,
          color: AppColors.black87,
          fontSize: MySize.size14,
              ),
              SizedBox(
          height: MySize.size5,
              ),
              SizedBox(
          height: MySize.size54,
          child: textField(
            hintText: "Password",
            fontSize: MySize.size16,
            fontWeight: FontWeight.w400,
            prefixIcon: false,
            prefixImage: "assets/icons/lock.png",
            isObscure: visible,
            suffix: true,
            bordercolor: Colors.transparent,
            filled: true,
            fillcolor: AppColors.white,

          ),
              ),
              SizedBox(
          height: MySize.size10,
              ),
              Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const ForgotScreen());
              },
              child: customTextRegular(
                title: "Forget Password",
                fontWeight: FontWeight.w400,
                color: AppColors.black87,
                fontSize: MySize.size14,
              ),
            )
          ],
              ),
              SizedBox(
          height: MySize.size40,
              ),
              customButton(
          text: "Sign in ",
          fontColor: Colors.white,
          fontWeight: FontWeight.w500,
          width: Get.width,
          height: MySize.size50,
          ontap: () {
            Get.to(()=>BottomNavigation());
          },
          color: AppColors.themecolor,
          fontSize: MySize.size16,
              ),
              SizedBox(
          height: MySize.size30,
              ),
              Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MySize.size20,
              height: MySize.size2,
              color: AppColors.grey9E,
            ),
            SizedBox(
              width: MySize.size10,
            ),
            customTextRegular(
              title: "Or Continue with",
              fontWeight: FontWeight.w400,
              color: AppColors.grey6A,
              fontSize: MySize.size16,
            ),
            SizedBox(
              width: MySize.size10,
            ),
            Container(
              width: MySize.size20,
              height: MySize.size2,
              color: AppColors.grey9E,
            ),
          ],
              ),
              SizedBox(
          height: MySize.size30,
              ),
              Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){

              },
              child: Container(
                height: MySize.size60,
                width: MySize.size60,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  "assets/icons/google.png",
                  scale: 3.8,
                ),
              ),
            ),
            SizedBox(
              width: MySize.size20,
            ),
            Container(
              height: MySize.size60,
              width: MySize.size60,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                "assets/icons/facebookicon.png",
                scale: 3.8,
              ),
            ),
          ],
              ),
              SizedBox(
          height: MySize.size90,
              ),
              Center(
          child: GestureDetector(
            onTap: () {
              Get.to(() => const SignUp());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextBold(
                  title: "I don’t have an account?",
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey89,
                  fontSize: MySize.size14,
                ),
                customTextBold(
                  title: " Sign Up ",
                  fontWeight: FontWeight.w400,
                  color: AppColors.themecolor,
                  fontSize: MySize.size14,
                ),
              ],
            ),
          ),
              ),
            ]),
        ),
      ),
    );
  }
}
