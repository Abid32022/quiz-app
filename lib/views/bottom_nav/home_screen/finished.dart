import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/homescreen_model.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/home_screen/home_screen.dart';
import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_text.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../bottom_nav.dart';
class FinishedScreen extends StatelessWidget {
   FinishedScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.bagroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MySize.size40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: genericAppBar(text: "Start...",isText: true,isanything: false,boxcolor: Colors.transparent,anything: Image.asset("assets/icons/edit.png",height: MySize.size17,width: MySize.size17,)),
              ),
              SizedBox(height: MySize.size20,),
                Center(child: Image.asset("assets/icons/succes.png",height: MySize.scaleFactorHeight*247,width: MySize.scaleFactorWidth*269,)),
            SizedBox(height: MySize.size40,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 33,vertical: 15),
                height: MySize.scaleFactorHeight*461,
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffB2B2B233).withOpacity(0.20),
                        blurRadius: 27,
                        spreadRadius: 0,
                        offset: Offset(0,4),
                      ),
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: customTextRegular(title: "Congratulations",fontWeight: FontWeight.w600,color: AppColors.black87,fontSize: MySize.size20,)),
                    Center(child: customTextRegular(title: "You have finished your quiz",fontWeight: FontWeight.w400,color: AppColors.grey97,fontSize: MySize.size14,)),
                    SizedBox(height: MySize.size40,),
                    quiz(text1: "Category",text2: "General Knowledge"),
                    quiz(text1: "Status",text2: "Passed"),
                    quiz(text1: "Your Points",text2: "45"),
                    quiz(text1: "Total Points",text2: "50"),
                    SizedBox(height: MySize.size50,),
                    Center(
                      child: custombutton2(text: "Back to Home",height: MySize.size50,ontap: (){
                        Get.to(()=>BottomNavigation());
                      },
                          width: MySize.scaleFactorWidth*142,fontColor: AppColors.white,fontWeight: FontWeight.w600,fontSize: MySize.size16),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget quiz({String ? text1,String ? text2,}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            customTextRegular(title: text1!,fontWeight: FontWeight.w600,color: AppColors.bluec7,fontSize: MySize.size14,),
            Spacer(),
            customTextRegular(title: text2!,fontWeight: FontWeight.w500,color: AppColors.grey68,fontSize: MySize.size12,),
          ],
        ),
        SizedBox(height: MySize.size4,),
        Divider(color: AppColors.greyf0,),

      ],
    );
  }
}
