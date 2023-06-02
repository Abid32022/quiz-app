import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/auth/sign_in.dart';
import 'package:quiz_app/views/bottom_nav/bottom_nav.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isChecked = false;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bagroundColor,
        // leadingWidth: 40,
        leading: Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          height: MySize.size48,
          width: MySize.size48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
          ),
          child: Center(
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  "assets/icons/arrow_left [#335].png",
                  height: MySize.scaleFactorHeight * 15,
                  width: MySize.scaleFactorWidth * 12,
                )),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.bagroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
          height: MySize.size30,
              ),
              customTextRegular(
            title: "Create Account",
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            fontSize: MySize.size32),
              SizedBox(
          height: MySize.size5,
              ),
              customTextRegular(
          title: "Let’s Create your account",
          fontWeight: FontWeight.w400,
          color: AppColors.grey89,
          fontSize: MySize.size16,
              ),
              SizedBox(
          height: MySize.size30,
              ),
              customTextRegular(
          title: "Full Name",
          fontWeight: FontWeight.w500,
          color: AppColors.black87,
          fontSize: MySize.size14,
              ),
              SizedBox(
          height: MySize.size5,
              ),
              Container(
            height: MySize.size54,
            child: textField(
                hintText: "Enter your Full name",
                fontSize: MySize.size16,
                fontWeight: FontWeight.w400,
                prefixIcon: false,
              onChanged:(){} ,
                prefixImage: "assets/icons/msgs.png",
                bordercolor: Colors.transparent,
                filled: true,
                fillcolor: AppColors.white,



            )),
              SizedBox(
          height: MySize.size15,
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
            prefixImage: "assets/icons/lock.png",
           // isObscure: visible,
            bordercolor: Colors.transparent,
            filled: true,
            fillcolor: AppColors.white,
            onChanged:(){} ,


          ),
              ),
              SizedBox(
          height: MySize.size15,
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
                isObscure: visible,
                fontSize: MySize.size16,
                fontWeight: FontWeight.w400,
                prefixIcon: false,
                prefixImage: "assets/icons/msgs.png",
                bordercolor: Colors.transparent,
                filled: true,
                fillcolor: AppColors.white,

            onChanged:(){} ,

            )),
              SizedBox(
          height: MySize.size5,
              ),
              Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform.scale(
                scale: 1.5,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    height: MySize.scaleFactorHeight * 14,
                    width: MySize.scaleFactorWidth * 14,
                    decoration: BoxDecoration(
                        color:
                            isChecked ? AppColors.grey89 : Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                            color: AppColors.grey89, width: 1)),
                    child: Center(
                      child: isChecked
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 10,
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MySize.size8,
            ),
            customTextRegular(
              title: "Remember me",
              fontWeight: FontWeight.w400,
              color: AppColors.grey89,
              fontSize: MySize.size14,
            ),
          ],
              ),
              SizedBox(
          height: MySize.size40,
              ),
              customButton(
          text: "Sign up ",
          fontColor: Colors.white,
          fontWeight: FontWeight.w500,
          width: Get.width,
          height: MySize.size50,
          ontap: () {
            Get.to(()=> BottomNavigation());
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
            Container(
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
          height: MySize.size30,
              ),
              Center(
          child: GestureDetector(
            onTap: () {
              Get.to(() => const SignIn());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextBold(
                  title: "I already have an account?",
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey89,
                  fontSize: MySize.size14,
                ),
                customTextBold(
                  title: " Sign In ",
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
