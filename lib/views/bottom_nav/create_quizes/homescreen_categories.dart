import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/discover/new_quizes.dart';
import 'package:quiz_app/views/bottom_nav/home_screen/quiz_detail.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import '../../../controllers/controllers.dart';

class HomeScreenCategories extends StatefulWidget {
  const HomeScreenCategories({Key? key}) : super(key: key);

  @override
  State<HomeScreenCategories> createState() => _HomeScreenCategoriesState();
}

class _HomeScreenCategoriesState extends State<HomeScreenCategories> {
  final GenericController userController2 = Get.find();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
        itemCount: userController2.homeList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      mainAxisExtent: 150,
      childAspectRatio: 4/6,
    ), itemBuilder: (context,index){
      return Obx(()=> GestureDetector(
        onTap: (){
          setState(() {
           // Get.to(()=> QuizDetail(b: userController2.homeList[index],));
            Get.to(()=> NewQuizes(title:userController2.homeList[index].text,));

          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          width: MySize.scaleFactorWidth*140,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              Image.asset(userController2.homeList[index].image,height: MySize.scaleFactorHeight*78,width: MySize.scaleFactorWidth*86,),
              SizedBox(height: MySize.size10,),
              customTextRegular(title: userController2.homeList[index].text,fontWeight: FontWeight.w600,color: AppColors.themecolor,fontSize: MySize.size14,),
            ],
          ),
        ),
      ));
    });

  }
}
