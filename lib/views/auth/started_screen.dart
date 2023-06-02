import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/auth/onboarding_screen.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
class StartedScreen extends StatelessWidget {
  const StartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
           children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.43,),
            Image.asset("assets/icons/started1.png",height: MySize.scaleFactorHeight*129,width: MySize.scaleFactorWidth*213,),
            customTextBold(title: "Test Solver",fontSize: MySize.size24,fontWeight: FontWeight.w400,color:AppColors.black),
            const Spacer(),
            custombuttonArrow(
              ontap: (){
                Get.to(()=> const OnboardingScreen());
              },
              text: "Get to Start",
            ),
            SizedBox(height: MySize.size40,),
          ],
        ),
      ),
    );
  }
}
