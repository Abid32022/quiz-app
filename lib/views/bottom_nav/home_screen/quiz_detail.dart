import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/controllers/controllers.dart';
import 'package:quiz_app/models/homescreen_model.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/views/bottom_nav/bottom_nav.dart';
import 'package:quiz_app/views/bottom_nav/home_screen/finished.dart';
import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import '../../../utils/my_size.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';

class QuizDetail extends StatefulWidget {
   QuizDetail({Key? key,required this.b}) : super(key: key);

   final HomeScreenModel b;

  @override
  State<QuizDetail> createState() => _QuizDetailState();
}

class _QuizDetailState extends State<QuizDetail> {
  ImagePickerController  Imagescontroller = Get.put(ImagePickerController());
  int currentindex = 0;
  bool isTrue = false;

  bool  isStarted = false ;

  final controller = PageController(initialPage: 0);


 // final getxController = PageController(initialPage: 0);
  final GenericController _controller = Get.find();

  int currentIndex = -1;
  String text = "";

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.bagroundColor,
          child: Column(
            children: [
              SizedBox(height: MySize.size40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: genericAppBar(text: "Quiz Detail",isText: true,boxcolor: Colors.transparent,isanything: false,
                ),
              ),
              SizedBox(height: MySize.size24,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: MySize.scaleFactorHeight*186,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  image:  DecorationImage(
                    image: AssetImage(widget.b.image),
                 //   image: FileImage(File(Imagescontroller.imagePath.toString())),fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(height: MySize.size20,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
             height:currentindex ==2?MySize.scaleFactorHeight*510: MySize.scaleFactorHeight*461,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffB2B2B233).withOpacity(0.20),
                    blurRadius: 27,
                    spreadRadius: 0,
                    offset: Offset(0,4),
                  ),
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///page1
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: currentindex == 0? SizedBox():customTextRegular(title: text,fontWeight: FontWeight.w600,color: AppColors.bluec7,fontSize: MySize.size16,)),

                      SizedBox(height: MySize.size23,),
                      ///pageView area///
                    ],
                  ),

                  Expanded(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: controller,
                      onPageChanged: (value) {
                        setState(() {
                          // print(value);
                          currentindex = value;
                          if (currentindex == 1){
                            text = '1/5';
                          }else if (currentindex == 2){
                            text = '2/5';
                          }else if(currentindex == 3){
                            text = '3/5';
                          }else if(currentindex ==4){
                            text = '4/5';
                          }else{
                            print("Not Valid");
                          }
                        });
                      },
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Center(child: customTextRegular(title: "Quiz Information",fontWeight: FontWeight.w600,color: AppColors.black87,fontSize: MySize.size16,)),
                              SizedBox(height: MySize.size23,),
                              quiz(text1: "Category",text2: widget.b.text),
                              quiz(text1: "Questions",text2: "15"),
                              quiz(text1: "Time",text2: "15 Min"),
                              quiz(text1: "Points",text2: "30"),
                              SizedBox(height: MySize.size50,),
                            ],
                          ),
                        ),
                        ///page2
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Center(child: customTextRegular(title: "Pakistan has 6 provinces",fontWeight: FontWeight.w600,color: AppColors.black87,fontSize: MySize.size16,)),
                              SizedBox(height: MySize.size50),
                              Container(
                                //color: AppColors.red1b,
                                height: MySize.scaleFactorHeight*123,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _controller.startList.length,
                                    itemBuilder: (context,index){
                                      return  GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            currentIndex = index;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                                            height: MySize.scaleFactorHeight*123,
                                            width: MySize.scaleFactorWidth*145,
                                            decoration: BoxDecoration(
                                                color: currentIndex == index ? _controller.startList[index].color:Colors.white,
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color:currentIndex == index ? AppColors.white: AppColors.greyd8)
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Image.asset(_controller.startList[index].image,height: MySize.scaleFactorHeight*20,width: MySize.scaleFactorWidth*20)
                                                  ],
                                                ),
                                                SizedBox(height: MySize.size14,),
                                                customTextRegular(title:_controller.startList[index].text,fontWeight: FontWeight.w600,color: currentIndex == index? AppColors.white: AppColors.black87,fontSize: MySize.size14,),

                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                        ///page2
                        ///page3
                        Column(
                          children: [
                            Center(child: customTextRegular(title: "Adding two numbers 3+4 = ?",fontWeight: FontWeight.w600,color: AppColors.black87,fontSize: MySize.size16,)),
                            SizedBox(height: MySize.size20),
                            Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: _controller.addingList.length,
                                  itemBuilder: (context,index){
                                    return  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                                          //  height: MySize.scaleFactorHeight*50,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              color: currentIndex == index ? AppColors.green:Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color:currentIndex == index ? AppColors.white: AppColors.greyd8)
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              customTextRegular(title: _controller.addingList[index],fontWeight: FontWeight.w600,color: currentIndex ==index? AppColors.white:AppColors.black87,fontSize: MySize.size16,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        ///page3
                        ///page4
                        Column(
                          children: [
                            customTextRegular(title: "What is computer?",fontWeight: FontWeight.w600,color: AppColors.black87,fontSize: MySize.size16,),
                            SizedBox(height: MySize.size30),
                            Container(
                                height: MySize.size54,
                                child: textField(hintText: "Type your Answer",fontSize: MySize.size16,fontWeight: FontWeight.w400,prefixIcon: false,prefixImage: "assets/icons/msgs.png",bordercolor: AppColors.greyd8,filled: true,fillcolor: AppColors.white)),
                            SizedBox(height: MySize.size50,),
                          ],
                        ),
                        ///page4
                        ///page5
                        Column(
                          children: [
                            Center(child: customTextRegular(title: "He ___ eating apple yesterday!",fontWeight: FontWeight.w600,color: AppColors.black87,fontSize: MySize.size14,)),
                            SizedBox(height: MySize.size50),
                            GridView.builder(
                                itemCount: _controller.fillList.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 17,
                                  crossAxisSpacing: 0,
                                  mainAxisExtent: 50,
                                  childAspectRatio: 4/4,
                                ), itemBuilder: (context,index){
                              return GestureDetector(
                                onTap: (){
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                      height: MySize.scaleFactorHeight*123,
                                      width: MySize.scaleFactorWidth*145,
                                      decoration: BoxDecoration(
                                          color: currentIndex == index ? AppColors.green:AppColors.white,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color:currentIndex == index ? AppColors.white: AppColors.greyd8)
                                      ),
                                      child: Center(
                                        child: customTextRegular(title:_controller.fillList[index],fontWeight: FontWeight.w600,color: currentIndex == index? AppColors.white: AppColors.black87,fontSize: MySize.size14,),

                                      )
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                        ///page5
                      ],
                    ),
                  ),
                  SizedBox(height: MySize.size40),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: custombutton2(
                      text:currentindex == 0? "Start":"Submit",
                      buttonColor: AppColors.themecolor,
                      height: MySize.size50,
                      width: Get.width,
                      ontap: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                        if(currentindex == 0){
                          null;
                        }else if(currentindex ==1){
                          Get.dialog(dialogueBox());
                        }else if(currentindex ==2){
                          Get.dialog(dialogueBox());
                        }else if(currentindex ==3){
                          Get.dialog(dialogueBox());
                        }else{
                          Get.to(()=> FinishedScreen());
                        }

                       // FinishedScreen
                        //     currentindex == 1 ?   Get.dialog(dialogueBox()) : currentIndex == 3 ? Get.dialog(dialogueBox()):   null;
                      },
                      fontColor: AppColors.white,
                      bordercolor: AppColors.themecolor,
                    ),
                  ),
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
  Widget dialogueBox(){
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 32,vertical: 32),
        height: MySize.scaleFactorHeight*340,
        width: MySize.scaleFactorWidth*313,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: GestureDetector(
                onTap: (){
                  setState(() {
                    isTrue=!isTrue;
                  });
                },
                child: Image.asset(isTrue? "assets/icons/dailgoue1.png": "assets/icons/incorrect.png",height: MySize.scaleFactorHeight*96,width: MySize.scaleFactorWidth*120,))),
            SizedBox(height: MySize.size20,),
            Center(child: customTextRegular(title:isTrue? "Your Answer Is Correct": "Your Answer Is InCorrect",fontWeight: FontWeight.w500,color: AppColors.black87,fontSize: MySize.size20,)),
            SizedBox(height: MySize.size6,),
            Center(child: customTextRegular(title: "Congratulation your answer has been submitted right",fontWeight: FontWeight.w400,color: AppColors.grey8f,fontSize: MySize.size14,align: TextAlign.center)),
            SizedBox(height: MySize.size24,),
            Center(
              child: custombutton2(text: "Back",height: MySize.scaleFactorHeight*46,ontap: (){
                Get.back();
              },
                  width: MySize.scaleFactorWidth*127,fontColor: AppColors.white,fontWeight: FontWeight.w500,fontSize: MySize.size14),
            ),

          ],
        ),
      ),
    );
  }
  Widget quiz({String ? text1,String ? text2,}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            customTextRegular(title: text1!,fontWeight: FontWeight.w600,color: AppColors.bluec7,fontSize: MySize.size14,),
            Spacer(),
            customTextRegular(title: text2!,fontWeight: FontWeight.w500,color: AppColors.grey68,fontSize: MySize.size12,),
          ],
        ),
        SizedBox(height: MySize.size4,),
        Divider(color: AppColors.greyf0,),

      ],
    );
  }
}
