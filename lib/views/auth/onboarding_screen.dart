import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/controllers.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/auth/sign_in.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/custom_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final GenericController userController = Get.put(GenericController());

  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        body: Container(
          color: AppColors.bagroundColor,
          child: Column(
            children: [
              SizedBox(height: MySize.size40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.to(()=>SignIn());
                      },
                      child: customTextBold(title:currentIndex ==2 ? "":"Skip",fontSize: MySize.size14,fontWeight: FontWeight.w500,color:AppColors.grey68,textAlign: TextAlign.center)),
                SizedBox(width: MySize.size20,),
                ],
              ),
              SizedBox(height: MySize.size160),
              SizedBox(
                height: MySize.scaleFactorHeight*430,
                width: Get.width,
                child: PageView.builder(
                    itemCount: userController.users.length,
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemBuilder: (context, i) {
                      return

                        Obx(() =>  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MySize.scaleFactorHeight * 242,
                            width: Get.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(userController.users[i].img)
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MySize.scaleFactorHeight * 40,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child:
                            customTextBold(title: userController.users[i].title,fontSize: MySize.size24,fontWeight: FontWeight.w800,color:AppColors.grey5b,textAlign: TextAlign.center),
                          ),

                          SizedBox(height: MySize.size16,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: customTextBold(title: userController.users[i].subtitle2,fontSize: MySize.size14,fontWeight: FontWeight.w500,color:AppColors.greyA8,textAlign: TextAlign.center),
                          ),
                        ],
                      ));


                    }),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(
                  activeDotColor: AppColors.themecolor,
                  dotColor: const Color(0xffD9D9D9),
                  dotHeight: MySize.size5,
                  dotWidth: MySize.size15,
                ),
              ),
              SizedBox(height: MySize.size80,),
              custombuttonArrow(
                width: MySize.scaleFactorWidth*144,
                ontap: (){
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  currentIndex == 2?Get.to(()=> const SignIn()):null;
                },
                text: "Next",
              ),
            ],
          ),
        ));
  }
}