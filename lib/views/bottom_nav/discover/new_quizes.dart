import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/homescreen_model.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/discover/discover_screen.dart';
import 'package:quiz_app/views/bottom_nav/home_screen/quiz_detail.dart';
import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';

import '../../../controllers/controllers.dart';
import '../../../widgets/data.dart';
class NewQuizes extends StatefulWidget {
   NewQuizes({Key? key,required this.title}) : super(key: key);

   String title ;

  @override
  State<NewQuizes> createState() => _NewQuizesState();
}

class _NewQuizesState extends State<NewQuizes> {
  final GenericController userController4 = Get.find();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: Container(
    //    padding: const EdgeInsets.symmetric(horizontal: 10),
        color: AppColors.bagroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MySize.size40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: genericAppBar(text:widget.title),
            ),
            SizedBox(height: MySize.size30,),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: SizedBox(
            //       height: MySize.size54,
            //       child: textField(hintText: "Search here...",
            //           fontSize: MySize.size16,fontWeight: FontWeight.w400,prefixIcon: true,prefixImage: "assets/icons/Search.png",bordercolor: Colors.transparent,filled: true,fillcolor: AppColors.white)),
            // ),

            SizedBox(height: MySize.size20,),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                  itemCount: userController4.quizzList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4/9,
                mainAxisExtent: 186,
                crossAxisSpacing: 0,
                mainAxisSpacing: 20,
              ), itemBuilder: (context,index){
                return GestureDetector(
                    onTap: (){
                      Get.to(()=>QuizDetail(b: userController4.homeList[index]));
                      print("Tapped");
                    },
                    child: NewQuizesComponent(b: userController4.quizzList[index],fontSize: 11.22,tutorDetail: true,));
              }),
            ),
            SizedBox(height: MySize.size40,),
          ],
        ),
      ),
    );
  }
}
