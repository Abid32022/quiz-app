import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/new_quizes_model.dart';
import 'package:quiz_app/models/top_quiz_model.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/discover/new_quizes.dart';
import 'package:quiz_app/views/bottom_nav/discover/top_author.dart';
import 'package:quiz_app/views/bottom_nav/my_quizes/my_quizes.dart';
import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/data.dart';
import '../../../controllers/controllers.dart';
import '../../../widgets/custom_text_field.dart';
import '../home_screen/quiz_detail.dart';
class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final GenericController userController3 = Get.find();
  final GenericController userController4 = Get.find();
  final GenericController userController5 = Get.find();

  bool visible = false;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(

      backgroundColor: AppColors.bagroundColor,
      body: SingleChildScrollView(
        child: Container(
     //   padding: EdgeInsets.symmetric(horizontal: 20),
          color: AppColors.bagroundColor,
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: MySize.size40,),
                    genericAppBar(text: "Discover"),
                    SizedBox(height: MySize.size28,),

                    SizedBox(
                        height: MySize.size54,
                        child: textField(hintText: "Search here...",  isObscure: visible,
                            fontSize: MySize.size16,fontWeight: FontWeight.w400,prefixIcon: true,prefixImage: "assets/icons/Search.png",bordercolor: Colors.transparent,filled: true,fillcolor: AppColors.white)),
                    SizedBox(height: MySize.size20,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      height: MySize.size140,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppColors.themecolor,
                        borderRadius: BorderRadius.circular(8.42),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/discover1.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/icons/dot.png",height: MySize.size10,width: MySize.size10,),
                                  SizedBox(height: MySize.size7,),
                                  SizedBox(
                                    width: MySize.size120,
                                    child: customTextBold(title: "Join Test Solver To Learn New",fontWeight: FontWeight.w600,color: AppColors.white,fontSize: MySize.size16,),
                                  ),
                                  SizedBox(height: MySize.size12,),
                                  custombutton2(
                                    height: MySize.size28,
                                    width: MySize.scaleFactorWidth*79,
                                    borderRadius: 8.42,
                                    buttonColor: AppColors.white,
                                    text: "Join Now",
                                    fontSize: MySize.size12,
                                    fontWeight: FontWeight.w500,
                                    fontColor: AppColors.themecolor,
                                  )
                                ],
                              ),
                              Image.asset("assets/images/book.png",height: MySize.scaleFactorHeight*115,width:MySize.scaleFactorWidth*129 ,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  SizedBox(height: MySize.size20,),
                  Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: MySize.size24,),
                      customTextRegular(title: "Top Tutor",fontWeight: FontWeight.w600,color: AppColors.black,fontSize: MySize.size16,),
                      const Spacer(),
                      GestureDetector(
                          onTap: (){
                            Get.to(()=>const TopAuthorScreen());
                          },
                          child: customTextRegular(title: "See all",fontWeight: FontWeight.w500,color: AppColors.themecolor,fontSize: MySize.size12,)),
                      SizedBox(width: MySize.size24,),
                    ],
                  ),
                  SizedBox(height: MySize.size15,),
                  SizedBox(
                    height: MySize.size100,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: userController3.disList.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: MySize.size60,
                                  width: MySize.size60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(userController3.disList[index].image)
                                      )
                                  ),
                                ),
                                SizedBox(height: MySize.size5,),
                                customTextRegular(title: userController3.disList[index].name,fontWeight: FontWeight.w600,color: AppColors.themecolor,fontSize: MySize.size10,),

                              ],
                            ),
                          );
                        }),
                      ),
                  Row(
                    children: [
                      SizedBox(width: MySize.size24,),
                      customTextRegular(title: "New Quizzes",fontWeight: FontWeight.w600,color: AppColors.black,fontSize: MySize.size16,),
                      const Spacer(),
                      GestureDetector(
                          onTap: (){
                            Get.to(()=>NewQuizes(title: 'New Quizes'));
                          },
                          child: customTextRegular(title: "See all",fontWeight: FontWeight.w500,color: AppColors.themecolor,fontSize: MySize.size12,)),
                      SizedBox(width: MySize.size24,),
                    ],
                  ),
                  SizedBox(height: MySize.size20,),
                  SizedBox(
                    height: MySize.scaleFactorHeight*205,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return  GestureDetector(
                              onTap: (){
                            //    Get.to(()=>QuizDetail());
                              },
                              child: NewQuizesComponent(b: userController4.quizzList[index],fontSize: 13,tutorDetail: true,));
                        }),
                       ),
                  SizedBox(height: MySize.size20,),
                  Row(
                    children: [
                      SizedBox(width: MySize.size24,),
                      customTextRegular(title: "Top Quizzes",fontWeight: FontWeight.w600,color: AppColors.black,fontSize: MySize.size16,),
                      const Spacer(),
                      GestureDetector(
                          onTap: (){
                            Get.to(()=> MyQuizes());
                          },
                          child: customTextRegular(title: "See all",fontWeight: FontWeight.w500,color: AppColors.themecolor,fontSize: MySize.size12,)),
                      SizedBox(width: MySize.size24,),
                    ],
                  ),
                  ListView.builder(
                      itemCount: 2,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                    return TopQuizesComponent(b: userController5.topList[index],isTick: true,iscross: true,);
                  }),
                ],
              ),
              SizedBox(height: MySize.size50,),
            ],
          ),
        ),
      ),
    );
  }
}

class NewQuizesComponent extends StatefulWidget {
   NewQuizesComponent({Key? key,required this.b,required this.fontSize,required this.tutorDetail}) : super(key: key);
  final NewQuizesModel b;
  double fontSize;
  bool tutorDetail = false;

  @override
  State<NewQuizesComponent> createState() => _NewQuizesComponentState();
}

class _NewQuizesComponentState extends State<NewQuizesComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        // height: MySize.scaleFactorHeight*190,
        width: MySize.scaleFactorWidth*183,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(widget.b.images,height: MySize.scaleFactorHeight*115,width: Get.width,)),
            Container(
              padding: const EdgeInsets.only(left: 10,right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MySize.size7,),
                  customTextBold(title: widget.b.title,fontWeight: FontWeight.w600,color: AppColors.black42,fontSize: widget.fontSize),
                  SizedBox(height: MySize.size2,),
                  customTextBold(title: widget.b.subject,fontWeight: FontWeight.w500,color: AppColors.greyAb,fontSize: MySize.scaleFactorHeight*11,),
                  SizedBox(height: MySize.scaleFactorHeight*9,),
                  Row(
                    children: [
                      Container(
                        height: MySize.scaleFactorHeight*20,
                        width: MySize.scaleFactorHeight*20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(widget.b.avatarimg),
                              fit: BoxFit.fill,

                            )
                        ),
                      ),
                      SizedBox(width: MySize.scaleFactorWidth*5.6,),
                      customTextBold(title: widget.b.name,fontWeight: FontWeight.w600,color: AppColors.themecolor,fontSize: MySize.scaleFactorHeight*10,),
                      const Spacer(),

                    widget.tutorDetail?  Row(
                        children: [
                          customTextBold(title: "Questions (${widget.b.questions})",fontWeight: FontWeight.w600,color: AppColors.greybb,fontSize: MySize.scaleFactorHeight*9,),
                          SizedBox(width: MySize.size6,),
                        ],
                      ):

                      Row(
                        children: [
                          Image.asset("assets/icons/isdetail.png",height: MySize.scaleFactorHeight*11,width: MySize.scaleFactorWidth*11,),
                          SizedBox(width: MySize.size6,),
                          customTextBold(title: widget.b.questions.toString(),fontWeight: FontWeight.w500,color: AppColors.themecolor,fontSize: MySize.scaleFactorHeight*10,),
                          SizedBox(width: MySize.size6,),
                        ],
                      )

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MySize.scaleFactorHeight*13,),
          ],
        ),
      ),
    );
  }
}

class TopQuizesComponent extends StatelessWidget {

   TopQuizesComponent({Key? key,required this.b,required this.isTick,required this.iscross}) : super(key: key);

   final TopQuizesModel b;
   bool isTick = false;
   bool iscross = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5,left: 20,top: 20),
      child: Container(
       // height: MySize.scaleFactorHeight*84,
        padding: const EdgeInsets.only(right: 10),
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black33.withOpacity(0.020),
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: const Offset(0,5.13)
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  child: Image.asset(b.images,height: MySize.scaleFactorHeight*84,width: MySize.scaleFactorWidth*94,),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customTextRegular(title: b.title,fontWeight: FontWeight.w600,color: AppColors.black42,fontSize: MySize.size14,),
                          SizedBox(
                            width: MySize.scaleFactorWidth*230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customTextRegular(title: b.subtitle,fontWeight: FontWeight.w400,color: AppColors.black2f.withOpacity(0.65),fontSize: MySize.size12,),
                                isTick? customTextRegular(title: "Questions (${b.Questions})",fontWeight: FontWeight.w600,color: AppColors.greybb,fontSize: MySize.scaleFactorHeight*9,):
                                iscross?  Image.asset("assets/icons/tick.png",height: MySize.size18,width: MySize.size22,):
                                Image.asset("assets/icons/cross.png",height: MySize.size22,width: MySize.size22,),

                              ],
                            ),
                          ),
                          SizedBox(height: MySize.size14,),
                          Container(
                            width: MySize.size230,
                            child: Row(
                              children: [
                                Container(
                                  height: MySize.scaleFactorHeight*20,
                                  width: MySize.scaleFactorHeight*20,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(b.avatrimg),
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                                SizedBox(width: MySize.scaleFactorWidth*5.6,),
                                customTextBold(title:b.name,fontWeight: FontWeight.w600,color: AppColors.themecolor,fontSize: MySize.scaleFactorHeight*10,),
                               Spacer(),
                                 isTick? SizedBox():customTextRegular(title: "Questions (${b.Questions})",fontWeight: FontWeight.w600,color: AppColors.greybb,fontSize: MySize.scaleFactorHeight*9,),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SizedBox(width: MySize.size40,),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
