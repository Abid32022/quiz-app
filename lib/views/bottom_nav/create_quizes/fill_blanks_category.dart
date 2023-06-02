import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/controllers.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/views/bottom_nav/create_quizes/question_answer.dart';
import '../../../utils/my_size.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class FillBlanksCategory extends StatefulWidget {
  FillBlanksCategory({Key? key,required this.data}) : super(key: key);

  final FillBlankModel data;

  @override
  State<FillBlanksCategory> createState() => _FillBlanksCategoryState();
}

class _FillBlanksCategoryState extends State<FillBlanksCategory> {
  final GenericController controller = Get.find();
  ImagePickerController  Imagescontroller = Get.put(ImagePickerController());

  bool icon = true;
  int isTrue = -1;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.bagroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MySize.size40,),
              genericAppBar(text: "True & False"),
              SizedBox(height: MySize.size40,),
              Container(
                height: MySize.scaleFactorHeight*142,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  image:  DecorationImage(
                    image: FileImage(File(Imagescontroller.imagePath4.toString())),fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(height: MySize.size20,),
              customTextRegular(title: "Category",fontWeight: FontWeight.w500,color: AppColors.grey97,fontSize: MySize.size14),
              SizedBox(height: MySize.size5,),
              Theme(
                data: Theme.of(context).copyWith(
                  appBarTheme: AppBarTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  unselectedWidgetColor: Colors.white,
                  colorScheme: const ColorScheme.light(
                  ),
                  dividerColor: Colors.white10,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    color:  AppColors.white,
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: ExpansionTile(
                    initiallyExpanded: false,
                    trailing:  Icon  ( icon?  Icons.keyboard_arrow_up_rounded:Icons.keyboard_arrow_down_rounded,color: AppColors.grey97,),
                    onExpansionChanged: (bool expanded){
                      setState(() {
                        icon = expanded;
                      });
                    },
                    tilePadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                    childrenPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                    title: Container(
                      child:
                      customTextRegular(title:"English",fontSize:MySize.size16,fontWeight: FontWeight.w600,color: AppColors.black  ),
                    ),

                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color:  AppColors.themecolor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),

                          ),
                          child:Column(
                            children: [
                              customTextRegular(title:"sddsvsvdfgsd",fontSize:MySize.size14,fontWeight: FontWeight.w400,color: Colors.black87  ),
                              SizedBox(height: MySize.size10,),
                            ],
                          )),


                    ],
                  ),
                ),
              ),
              SizedBox(height: MySize.size15,),
              customTextRegular(title: "Type Question",fontWeight: FontWeight.w500,color: AppColors.grey97,fontSize: MySize.size14),
              SizedBox(height: MySize.size5,),
              Container(
                height: MySize.size54,
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8)
                ),
                child:Row(
                  children: [
                    SizedBox(width: MySize.size8,),
                    customTextRegular(title: widget.data.text1,fontWeight: FontWeight.w500,color: AppColors.grey97,fontSize: MySize.size14),
                  ],
                ),
              ),
              SizedBox(height: MySize.size15,),
              customTextRegular(title: "Quiz Points",fontWeight: FontWeight.w500,color: AppColors.grey97,fontSize: MySize.size14),
              SizedBox(height: MySize.size5,),
              SizedBox(
                  height: MySize.size54,
                  child: textField(hintText: "Points ",fontSize: MySize.size16,fontWeight: FontWeight.w600,prefixIcon: false,prefixImage: "assets/icons/msgs.png",bordercolor: Colors.transparent,filled: true,fillcolor: AppColors.white)),

              SizedBox(height: MySize.size15,),
              customTextRegular(title: "Time Duration",fontWeight: FontWeight.w500,color: AppColors.grey97,fontSize: MySize.size14),
              SizedBox(height: MySize.size5,),
              SizedBox(
                  height: MySize.size54,
                  child: textField(hintText: "Sec",fontSize: MySize.size16,isKeyboard: true,fontWeight: FontWeight.w600,prefixIcon: false,suffix: true,suffixWidget: Image.asset("assets/icons/incre.png",scale: 6,),prefixImage: "assets/icons/incre.png",bordercolor: Colors.transparent,filled: true,fillcolor: AppColors.white)),
              SizedBox(height: MySize.size30,),
              customTextRegular(title: "Type Answers",fontWeight: FontWeight.w500,color: AppColors.black87,fontSize: MySize.size14),
              SizedBox(height: MySize.size10,),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                    4, (index) =>
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isTrue = index;
                        });
                      },
                      child: ab(index),
                    )
                ),
              ),
              SizedBox(height: MySize.size30,),
              custombutton2(text: "Publish",height: MySize.size50,ontap: (){
                Get.to(()=>QuestionAnswer());
              },
                  width: Get.width,fontColor: AppColors.white,fontWeight: FontWeight.w600,fontSize: MySize.size16),
              SizedBox(height: MySize.size30,),
            ],
          ),
        ),
      ),
    );
  }
  Widget ab(int index){
    return  Container(
      //height: MySize.scaleFactorHeight*50,
      width: MySize.scaleFactorWidth*162,
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all( color: index == isTrue? AppColors.green: Colors.white)
      ),
      child: Row(
        children: [
          RichText(text: TextSpan(
              children: [
                TextSpan(
                    text: controller.typeList[index].No,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color:index == isTrue? AppColors.green:Colors.black87)
                ),
                WidgetSpan(child: SizedBox(width: MySize.size40,)),
                TextSpan(
                  //   text: controller.typeList[index].answer,
                    text:index ==0 ? widget.data.text2 :index ==1 ?widget.data.text3: index ==2 ?widget.data.text4:index ==3 ?widget.data.text5:   null,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color:index == isTrue? AppColors.green:Colors.black87)
                ),
              ]
          ))
        ],
      ),
    );
  }
}
