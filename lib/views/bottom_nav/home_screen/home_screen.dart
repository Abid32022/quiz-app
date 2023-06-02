import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/create_quizes/homescreen_categories.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.bagroundColor,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MySize.scaleFactorHeight*310,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: AppColors.themecolor,
                  borderRadius:  BorderRadius.vertical(bottom: Radius.circular(30))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MySize.size40,),
                  Row(
                    children: [
                      customTextRegular(title: "Hi, John Peter",fontWeight: FontWeight.w600,color: AppColors.white.withOpacity(0.75),fontSize: MySize.size16,),
                   Spacer(),
                      Stack(
                        children: [
                          Container(
                            height: MySize.scaleFactorHeight*51,
                            width: MySize.scaleFactorHeight*51,
                            decoration: BoxDecoration(
                              color: AppColors.blueB0.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Image.asset("assets/icons/bell.png",scale: 3.5,),
                          ),
                          Positioned(
                            right: 7,
                            top: 6,
                            child: Container(
                              height: MySize.size6,
                              width: MySize.size6,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFF4545),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                    SizedBox(height: MySize.size15,),
                    SizedBox(
                        width: MySize.scaleFactorWidth*230,
                        child: customTextRegular(title: "Let’s start your test easily",fontWeight: FontWeight.w600,color: AppColors.white,fontSize: MySize.size32,)),
                    SizedBox(height: MySize.size32,),
                    SizedBox(
                        height: MySize.size54,
                        child: textField(hintText: "Search here...",  isObscure: visible,
                            fontSize: MySize.size16,fontWeight: FontWeight.w400,prefixIcon: true,prefixImage: "assets/icons/Search.png",bordercolor: Colors.transparent,filled: true,fillcolor: AppColors.white)),
                  ],
                ),
              ),
              SizedBox(height: MySize.size20,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextRegular(title: "Categories",fontWeight: FontWeight.w600,color: AppColors.black,fontSize: MySize.size16,),
                   SizedBox(height: MySize.size16,),

                      const HomeScreenCategories(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
