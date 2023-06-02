import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/controllers.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/create_quizes/fill_blanks.dart';
import 'package:quiz_app/views/bottom_nav/create_quizes/question_answer.dart';
import 'package:quiz_app/views/bottom_nav/create_quizes/true_false.dart';
import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text.dart';

import 'checkbox_questions.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final GenericController userController7 = Get.find();

  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: Container(
        color: AppColors.bagroundColor,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MySize.size40,),

            genericAppBar(text: "Create Quiz"),
            SizedBox(height: MySize.size30,),
            customTextBold(title: "Select Question type",fontWeight: FontWeight.w600,color: AppColors.black87,fontSize: MySize.size18,),
            SizedBox(height: MySize.size26,),
              GridView.builder(
                  itemCount: userController7.createList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 17,
                crossAxisSpacing: 17,
                mainAxisExtent: 150,
                childAspectRatio: 5/4,
              ), itemBuilder: (context,index){
                return name(index);
              }),
            SizedBox(height: MySize.size100,),
            custombutton2(text: "Next",height: MySize.size50,ontap: (){
           //   Get.to(()=>TrueFalse());
            },
                width: Get.width,fontColor: AppColors.white,fontWeight: FontWeight.w600,fontSize: MySize.size16)

          ],
        ),
      ),
    );
  }
  Widget name(int index){
    return  GestureDetector(
      onTap: (){
        setState(() {
          currentIndex = index;
          if (index == 0){
            Get.to(()=> TrueFalse());
          }else if(index ==1){
            Get.to(()=> QuestionAnswer());
          }else if(index == 2){
            Get.to(()=> CheckBoxQuestion());
          }else if (index == 3){
            Get.to(()=> FillBlanks());
          }
        });
      },
      child: Container(
        height: MySize.scaleFactorHeight*168,
        width: MySize.scaleFactorWidth*162,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.63),
          color: Colors.white,
          border:  Border.all(color:index== currentIndex? AppColors.green:Colors.white),
        ),
        child: Column(
          children: [
            SizedBox(height: MySize.size12,),
            Image.asset(userController7.createList[index].image,height: MySize.scaleFactorHeight*105,width: MySize.scaleFactorWidth*105,),
            SizedBox(height: MySize.size15,),
            customTextBold(title: userController7.createList[index].text,fontWeight: FontWeight.w600,color: AppColors.black42,fontSize: MySize.size14,),
          ],
        ),
      ),
    );
  }
}
