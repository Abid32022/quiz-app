import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/create_quizes/true_false_category.dart';

import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';

import '../../../controllers/controllers.dart';

class TrueFalse extends StatefulWidget {
  const TrueFalse({Key? key}) : super(key: key);

  @override
  State<TrueFalse> createState() => _TrueFalseState();
}

class _TrueFalseState extends State<TrueFalse> {

  ImagePickerController  Imagescontroller = Get.put(ImagePickerController());

  int currentIndex =-1;

  final MyController controller2 = Get.put(MyController());
  bool add = false;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.bagroundColor,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MySize.size40,),
              genericAppBar(text: "True & False"),
              SizedBox(height: MySize.size30,),
              Obx(() =>
                  GestureDetector(
                      onTap: (){
                  setState(() {
                   Imagescontroller.getImage();
                  });
                   },
                  child: Container(
                  height: MySize.scaleFactorWidth*142,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: FileImage(File(Imagescontroller.imagePath.toString())),fit: BoxFit.fitWidth
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:Imagescontroller.imagePath.isNotEmpty? SizedBox(): Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/camera.png",height: MySize.size16,width: MySize.size16,),
                      SizedBox(height: MySize.size4,),
                      customTextBold(title: "Add Image",fontWeight: FontWeight.w400,color: AppColors.grey9c,fontSize: MySize.size10),
                      SizedBox(height: MySize.size5,),
                    ],
                  ),
                )
              )),

              SizedBox(height: MySize.size15,),
              customTextBold(title: "Type Question",fontWeight: FontWeight.w500,color: AppColors.black87,fontSize: MySize.size14),
              SizedBox(height: MySize.size5,),
              SizedBox(
                  height: MySize.size54,
                  child: textField(hintText: "Enter your Question",controller: controller2.text1Controller,
                      fontSize: MySize.size16,fontWeight: FontWeight.w400,prefixIcon: false,prefixImage: "assets/icons/Search.png",bordercolor: Colors.transparent,filled: true,fillcolor: AppColors.white)),
              SizedBox(height: MySize.size20,),
              customTextBold(title: "Type Answers",
                  fontWeight: FontWeight.w500,color: AppColors.black87,fontSize: MySize.size14),
              SizedBox(height: MySize.size20,),
              Wrap(
                runSpacing: 15,
                spacing: 10,
                children: List.generate(2, (index) =>
                    part1(
                      index: index,
                    partController: controller2.text2Controller,
                    data: MyData(
                      text1: controller2.text1Controller.text,
                      text2: controller2.text2Controller.text,
                      text3: controller2.text3Controller.text,
                      text4: controller2.text4Controller.text,
                      text5: controller2.text5Controller.text,
                      text6: controller2.text6Controller.text,
                      text7: controller2.text7Controller.text,
                      text8: controller2.text8Controller.text,
                    ) ),
                ),
                ),

              SizedBox(height: MySize.size40,),
              custombutton2(
                text: "Next",height: MySize.size50,ontap: (){
                MyData data = MyData(
                  text1: controller2.text1Controller.text,
                  text2: controller2.text2Controller.text,
                  text3: controller2.text3Controller.text,
                  text4: controller2.text4Controller.text,
                  text5: controller2.text5Controller.text,
                  text6: controller2.text6Controller.text,
                  text7: controller2.text7Controller.text,
                  text8: controller2.text8Controller.text,
                );
                controller2.clearTextFields();
                Get.to(() => TrueCategory(data: data));
              },
                width: Get.width,fontColor: AppColors.white,fontWeight: FontWeight.w600,fontSize: MySize.size16,)
            ],
          ),
        ),
      ),
    );
  }
  Widget part1({TextEditingController ? partController, MyData? data,int? index }){
    return SizedBox(
      height: MySize.size56,
      width: MySize.scaleFactorWidth*162,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: DottedBorder(
            color: AppColors.themecolor,
            strokeWidth: 3,
            dashPattern: const [6,4],
            child:   Container(
              height:MySize.size180,
              width: MySize.scaleFactorWidth*162,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: InkWell(
                onTap: (){
                  setState(() {
                    Get.dialog(
                        AlertDialog(
                          actions: [
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: MySize.size20,),
                                  textField(hintText: "Ans",
                                    controller: index ==0 ? controller2.text2Controller: index ==1? controller2.text3Controller:null,
                                    ),
                                  SizedBox(height: MySize.size30,),
                                  custombutton2(text: "Submit",fontWeight: FontWeight.w500,ontap: (){
                                        Get.back();
                                  },
                                      fontSize: MySize.size14,fontColor: AppColors.white),
                                ],
                              ),
                            ),
                          ],
                        ));
                    print('sskdfn');
                  });
                },
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/plus.png",scale:4,),
                    SizedBox(width: MySize.size10,),
                    customTextBold(title: index ==0? data!.text2: index ==1? data!.text3:"null",fontWeight: FontWeight.w600,color: AppColors.grey68,fontSize: MySize.size14),

                  ],
                ),
              ),
            ),)
      ),

    );
  }
}
