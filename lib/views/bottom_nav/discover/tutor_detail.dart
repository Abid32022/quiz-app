import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_const.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/discover/discover_screen.dart';
import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/data.dart';

import '../../../controllers/controllers.dart';
import '../../../utils/app_colors.dart';
class TutorDetail extends StatefulWidget {
  const TutorDetail({Key? key}) : super(key: key);

  @override
  State<TutorDetail> createState() => _TutorDetailState();
}

class _TutorDetailState extends State<TutorDetail> {
  final GenericController userController4 = Get.find();
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: genericAppBar(text: "Discover"),
              ),
              SizedBox(height: MySize.size50,),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                   // / height: MySize.scaleFactorHeight*229,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyb2.withOpacity(0.020),
                          spreadRadius: 0,
                          blurRadius: 40,
                          offset: Offset(0,6.79)
                        )
                      ],
                      borderRadius: BorderRadius.circular(30)
                    ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MySize.size50,),
                          Center(child: customTextRegular(title: "John Peter",fontWeight: FontWeight.w600,color: AppColors.black,fontSize: MySize.size16,)),
                          SizedBox(height: MySize.size2,),
                          Center(child: customTextRegular(title: "Chemistry",fontWeight: FontWeight.w400,color: AppColors.grey9f,fontSize: MySize.size12,)),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 29,vertical: 12),
                            child: customTextRegular(title: AppConst.lorem,fontWeight: FontWeight.w400,color: AppColors.grey9c,fontSize: MySize.size12,align: TextAlign.center),
                          ),
                        SizedBox(height: MySize.size5,),
                          Center(child: custombutton2(text: "Follow",fontSize: MySize.size18,fontWeight: FontWeight.w600,width: MySize.scaleFactorWidth*242,fontColor: AppColors.white)),
                          SizedBox(height: MySize.size30,),

                        ],
                      ),
                  ),
                  Positioned(
                    top: -40,
                    left: 140,
                    child: Container(
                      height: MySize.size90,
                      width: MySize.size90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/tutor_detail_avatar.png"),
                          fit: BoxFit.fill
                        ),
                      ),
                    ),
                  )
                ],
              ),SizedBox(height: MySize.size30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MySize.size90,
                          width: MySize.size90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Image.asset("assets/images/t1.png",scale: 3.6,),
                        ),
                        Container(
                          height: MySize.size90,
                          width: MySize.size90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Image.asset("assets/icons/t2.png",scale: 3.6,),
                        ),

                        Container(
                          height: MySize.size90,
                          width: MySize.size90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Image.asset("assets/icons/t3.png",scale: 3.6,),
                        ),
                      ],
                    ),
                    SizedBox(height: MySize.size18,),
                    Padding(
                      padding: const EdgeInsets.only(right: 18,left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customTextRegular(title: "Total Quizzes",fontWeight: FontWeight.w600,color: AppColors.greyAb,fontSize: MySize.scaleFactorHeight*13,),
                          customTextRegular(title: "In Progress",fontWeight: FontWeight.w600,color: AppColors.greyAb,fontSize: MySize.scaleFactorHeight*13,),
                          customTextRegular(title: "Watched",fontWeight: FontWeight.w600,color: AppColors.greyAb,fontSize: MySize.scaleFactorHeight*13,),
                       // SizedBox(width: MySize.size0,),
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.scaleFactorHeight*12,),
                    Padding(
                      padding: const EdgeInsets.only(right: 27,left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customTextRegular(title: "45",fontWeight: FontWeight.w600,color: AppColors.themecolor,fontSize: MySize.scaleFactorHeight*24,),
                          customTextRegular(title: "34",fontWeight: FontWeight.w600,color: AppColors.themecolor,fontSize: MySize.scaleFactorHeight*24,),
                          customTextRegular(title: "98",fontWeight: FontWeight.w600,color: AppColors.themecolor,fontSize: MySize.scaleFactorHeight*24,),

                        ],
                      ),
                    ),
                    SizedBox(height: MySize.size20,),
                    Divider(color: Color(0xffD1D5DB),thickness: 0.3,),
                    SizedBox(height: MySize.size20,),
                    Container(
                      width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customTextBold(title: "All Quizzes",fontWeight: FontWeight.w600,color: AppColors.black42,fontSize: MySize.scaleFactorHeight*16,),
                            SizedBox(height: MySize.size15,),

                          ],
                        )),

                  ],
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userController4.quizzList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4/9,
                    mainAxisExtent: 186,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 20,
                  ), itemBuilder: (context,index){
                return NewQuizesComponent(b: userController4.quizzList[index],fontSize: 11.22,tutorDetail: false,);
              }),
              SizedBox(height: MySize.size40,),
            ],
          ),
        ),
      ),
    );
  }
}
