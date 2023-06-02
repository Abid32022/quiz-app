import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/auth/verification_screen.dart';
import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: MySize.size40,
            ),
            genericAppBar(showText: false),
            SizedBox(
              height: MySize.size30,
            ),
            customTextRegular(
                title: "Forgot Password",
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                fontSize: MySize.size32),
            SizedBox(
              height: MySize.size5,
            ),
            customTextRegular(
              title: "Create new password easily",
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
              height: MySize.size40,
            ),
            customButton(
              text: "Sign in ",
              fontColor: Colors.white,
              fontWeight: FontWeight.w500,
              width: Get.width,
              height: MySize.size50,
              ontap: () {
                Get.to(()=>VerificationScreen());
              },
              color: AppColors.themecolor,
              fontSize: MySize.size16,
            ),
            SizedBox(
              height: MySize.size30,
            ),
          ]),
        ),
      ),
    );
  }
}
