import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/create_quizes/checkbox_answers.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';
import '../../../controllers/controllers.dart';
import '../../../widgets/appbar.dart';

class CheckBoxQuestion extends StatefulWidget {
  CheckBoxQuestion({Key? key,}) : super(key: key);

  @override
  State<CheckBoxQuestion> createState() => _CheckBoxQuestionState();
}

class _CheckBoxQuestionState extends State<CheckBoxQuestion> {

  ImagePickerController  controller3 = Get.put(ImagePickerController());
  bool add = false;
  final MyController controller2 = Get.put(MyController());


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
              genericAppBar(text: "Checkbox"),
              SizedBox(height: MySize.size34,),

              Obx(() =>
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        controller3.getImage3();
                      });
                    },
                    child: Container(
                      height: MySize.scaleFactorWidth*142,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: FileImage(File(controller3.imagePath3.toString())),fit: BoxFit.fitWidth
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:controller3.imagePath3.isNotEmpty? SizedBox(): Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/camera.png",height: MySize.size16,width: MySize.size16,),
                          SizedBox(height: MySize.size4,),
                          customTextBold(title: "Add Image",fontWeight: FontWeight.w400,color: AppColors.grey9c,fontSize: MySize.size10),
                          SizedBox(height: MySize.size5,),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: MySize.size15,),
              customTextRegular(title: "Type Question",fontWeight: FontWeight.w500,color: AppColors.black87,fontSize: MySize.size14),
              SizedBox(height: MySize.size5,),
              SizedBox(
                  height: MySize.size54,
                  child: textField(hintText: "Enter your question ",controller: controller2.text11Controller,fontSize: MySize.size16,fontWeight: FontWeight.w600,prefixIcon: false,prefixImage: "assets/icons/msgs.png",bordercolor: Colors.transparent,filled: true,fillcolor: AppColors.white)),

              SizedBox(height: MySize.size20,),
              customTextRegular(title:"Type Answers",fontWeight: FontWeight.w500,color: AppColors.black87,fontSize: MySize.size14),
              SizedBox(height: MySize.size10,),
              Wrap(
                runSpacing: 15,
                children: List.generate(4, (index) =>
                    checkboxPart(
                        index: index,
                        partController: controller2.text22Controller,
                        data: FillBlankModel(
                          text1: controller2.text11Controller.text,
                          text2: controller2.text22Controller.text,
                          text3: controller2.text33Controller.text,
                          text4: controller2.text44Controller.text,
                          text5: controller2.text55Controller.text,
                        ),
                ),
              ),),
              SizedBox(height: MySize.size72,),
              custombutton2(
                text: "Next",height: MySize.size50,ontap: (){
                FillBlankModel data = FillBlankModel(
                  text1: controller2.text11Controller.text,
                  text2: controller2.text22Controller.text,
                  text3: controller2.text33Controller.text,
                  text4: controller2.text44Controller.text,
                  text5: controller2.text55Controller.text,

                );
                controller2.clearTextField();
                Get.to(() => CheckBoxAnswers(data: data));
              },
                width: Get.width,fontColor: AppColors.white,fontWeight: FontWeight.w600,fontSize: MySize.size16,)            ],
          ),
        ),
      ),
    );
  }
  Widget checkboxPart({ index, TextEditingController ? partController, FillBlankModel? data}){
    return SizedBox(
      height: MySize.size56,
      width: Get.width,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: DottedBorder(
            color: AppColors.themecolor,
            strokeWidth: 3,
            dashPattern: const [6,4],
            child:   Container(
              height:MySize.size180,
              width: Get.width,
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
                                    controller: index ==0 ? controller2.text22Controller: index ==1? controller2.text33Controller:index ==2?controller2.text44Controller:index ==3?controller2.text55Controller:null,
                                  ),
                                  SizedBox(height: MySize.size30,),
                                  custombutton2(text: "Submit",fontWeight: FontWeight.w500,ontap: (){
                                    Get.back();
                                  },
                                      fontSize: MySize.size14,fontColor: AppColors.white),
                                  //     Text(message,style: TextStyle(color: AppColors.black33,fontSize: 14),)
                                ],
                              ),
                            ),
                          ],
                        ));
                  });
                },
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Image.asset("assets/icons/plus.png",scale:4,),
                    SizedBox(width: MySize.size10,),
                    customTextBold(title: index ==0? data!.text2: index ==1? data!.text3:index ==2? data!.text4: index ==3?data!.text5:"Add",fontWeight: FontWeight.w600,color: AppColors.grey68,fontSize: MySize.size14),

                  ],
                ),
              ),
            ),)
      ),

    );
  }
}


class QuestionPart extends StatefulWidget {
  QuestionPart({Key? key,}) : super(key: key);


  @override
  State<QuestionPart> createState() => _QuestionPartState();
}

class _QuestionPartState extends State<QuestionPart> {
  TextEditingController messageController = TextEditingController();

  // ImagePickerController  controller = Get.put(ImagePickerController());
  void submitMessage() {
    setState(() {
      message = messageController.text;
      messageController.clear();
    });
  }

  String message = '';
  ImagePickerController  controller = Get.put(ImagePickerController());
  bool add = false;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: MySize.size56,
        width: Get.width,
        child:add?
        Container(
          height: MySize.size56,
          width: Get.width,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.green)
          ),
          child:  Center(child: customTextRegular(title: message,fontWeight: FontWeight.w500,color: AppColors.green,fontSize: MySize.size14)),

        ):
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: DottedBorder(
              color: AppColors.themecolor,//color of dotted/dash line
              strokeWidth: 4, //thickness of dash/dots
              dashPattern: const [7,6],
              child:   Container(  //inner container
                height:MySize.size180, //height of inner container
                width: Get.width, //width to 100% match to parent container.
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
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
                                    textField(hintText: "Ans",controller: messageController,onChanged: (text){
                                      setState(() {
                                        message = text;
                                      });
                                    }),
                                    SizedBox(height: MySize.size30,),
                                    custombutton2(text: "Submit",fontWeight: FontWeight.w500,ontap: (){
                                      submitMessage();

                                      setState(() {
                                        add =!add;
                                        Get.back();
                                      });
                                    },
                                        fontSize: MySize.size14,fontColor: AppColors.white),
                                    //     Text(message,style: TextStyle(color: AppColors.black33,fontSize: 14),)
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
                      add? SizedBox():Image.asset("assets/icons/plus.png",scale:4,),
                      SizedBox(width: MySize.size10,),
                      customTextBold(title: add? message: "Add",fontWeight: FontWeight.w600,color: AppColors.grey68,fontSize: MySize.size14),
                    ],
                  ),
                ),
              ),)
        ),

      );
  }
}

