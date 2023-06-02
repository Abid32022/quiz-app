import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/create_quizes/fill_blanks_category.dart';
import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';
import '../../../controllers/controllers.dart';

class FillBlanks extends StatefulWidget {
  const FillBlanks({Key? key}) : super(key: key);

  @override
  State<FillBlanks> createState() => _FillBlanksState();
}

class _FillBlanksState extends State<FillBlanks> {

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
              genericAppBar(text: "Fill & False"),
              SizedBox(height: MySize.size30,),
              Obx(() =>
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          Imagescontroller.getImage4();
                        });
                      },
                      child: Container(
                        height: MySize.scaleFactorWidth*142,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: FileImage(File(Imagescontroller.imagePath4.toString())),fit: BoxFit.fitWidth
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:Imagescontroller.imagePath4.isNotEmpty? SizedBox(): Column(
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
                  child: textField(hintText: "Enter your Question",controller: controller2.text111Controller,
                      fontSize: MySize.size16,fontWeight: FontWeight.w400,prefixIcon: false,prefixImage: "assets/icons/Search.png",bordercolor: Colors.transparent,filled: true,fillcolor: AppColors.white)),
              SizedBox(height: MySize.size20,),
              customTextBold(title: "Type Answers",
                  fontWeight: FontWeight.w500,color: AppColors.black87,fontSize: MySize.size14),
              SizedBox(height: MySize.size20,),
              Wrap(
                runSpacing: 15,
                spacing: 10,
                children: List.generate(4, (index) =>
                    part1(
                        index: index,
                        partController: controller2.text222Controller,
                        data: FillBlankModel(
                          text1: controller2.text111Controller.text,
                          text2: controller2.text222Controller.text,
                          text3: controller2.text333Controller.text,
                          text4: controller2.text444Controller.text,
                          text5: controller2.text555Controller.text,
                        ) ),
                ),
              ),
              SizedBox(height: MySize.size40,),
              custombutton2(
                text: "Next",height: MySize.size50,ontap: (){
                FillBlankModel data = FillBlankModel(
                  text1: controller2.text111Controller.text,
                  text2: controller2.text222Controller.text,
                  text3: controller2.text333Controller.text,
                  text4: controller2.text444Controller.text,
                  text5: controller2.text555Controller.text,
                );
                controller2.clearTextFieldBlank();
                Get.to(() => FillBlanksCategory(data: data));
              },
                width: Get.width,fontColor: AppColors.white,fontWeight: FontWeight.w600,fontSize: MySize.size16,)
            ],
          ),
        ),
      ),
    );
  }
  Widget part1({TextEditingController ? partController, FillBlankModel? data,int? index }){
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
                                    controller: index ==0 ? controller2.text222Controller: index ==1? controller2.text333Controller:index ==2? controller2.text444Controller:index ==3? controller2.text555Controller  :null,
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
                    customTextBold(title: index ==0? data!.text2: index ==1? data!.text3:  index ==2? data!.text4:  index ==3? data!.text5: "null",fontWeight: FontWeight.w600,color: AppColors.grey68,fontSize: MySize.size14),

                  ],
                ),
              ),
            ),)
      ),

    );
  }
}
