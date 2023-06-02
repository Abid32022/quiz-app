import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/auth/new_passward_screen.dart';

import '../../widgets/appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,

      body: Container(
        color: AppColors.bagroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MySize.size40,),
            genericAppBar(showText: false),
            SizedBox(height: MySize.size40,),
            customTextRegular(title: "Verification Code",fontWeight: FontWeight.w600,color: AppColors.black,fontSize: MySize.size32),
            SizedBox(height: MySize.size5,),
            customTextRegular(title: "Check email & enter the code",fontWeight: FontWeight.w400,color: AppColors.grey89,fontSize: MySize.size16,),
            SizedBox(height: MySize.size40,),
            OtpTextField(
              obscureText: false,
              numberOfFields: 5,
              borderRadius: BorderRadius.circular(100),
              fieldWidth: MySize.scaleFactorWidth * 27,
              margin: EdgeInsets.symmetric(horizontal: MySize.size10),
              borderWidth: MySize.size5,
              textStyle: GoogleFonts.urbanist(
                  fontSize: MySize.scaleFactorHeight * 28,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
              focusedBorderColor: AppColors.themecolor,
             borderColor: AppColors.themecolor,
              enabledBorderColor: AppColors.themecolor,
            ),
            SizedBox(height: MySize.size40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                customTextRegular(title: "Code will expire in  ",fontWeight: FontWeight.w500,color: AppColors.grey97,fontSize: MySize.size14),

                TweenAnimationBuilder(
                    tween: Tween(
                        begin: const Duration(minutes: 1, seconds: 13),
                        end: Duration.zero),
                    onEnd: () {},
                    duration: (const Duration(minutes: 1, seconds: 27)),
                    builder: (BuildContext context, Duration value, Widget? child) {
                      final minutes = value.inMinutes;
                      final seconds = value.inSeconds % 60;
                      return Align(
                        alignment: Alignment.center,
                        child: Text(
                          '$minutes: $seconds',
                          style: GoogleFonts.inter(
                              fontSize: MySize.scaleFactorHeight * 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black),
                        ),
                      );
                    }),
              ],
            ),
            SizedBox(height: MySize.size40,),
            customButton(text: "Resend",fontColor: Colors.white,fontWeight: FontWeight.w500,width: Get.width,height: MySize.size50,ontap: (){
              Get.to(()=>const NewPassward());
            },
              color: AppColors.themecolor,
              fontSize: MySize.size16,),

          ],
        ),
      ),
    );
  }
}
