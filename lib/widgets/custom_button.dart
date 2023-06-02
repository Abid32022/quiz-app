import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/widgets/custom_text.dart';

Widget customButton({
  bool showText= true,
  String ? text,
  Color color = Colors.blue,
  FontWeight fontWeight = FontWeight.normal ,
  double fontSize = 12,
  Function? ontap,
  Color fontColor =Colors.grey,
  // String? image,
  double height = 13,
  double width =13,
  // bool withbetweensize = true,
  double betweenwidth = 10,
  double borderRadius =8,

  Widget ? widget
})
{
  return Container(
    height: height,
    width: width,
    child: MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      minWidth: Get.width,
      onPressed:(){
        ontap!();
      },
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //   if(image!=null)  Image.asset(image!,height: MySize.scaleFactorHeight*height,width: MySize.scaleFactorWidth*width,),
          //   withbetweensize? SizedBox ( width: MySize.scaleFactorWidth*betweenwidth,):Container(),
          showText? Text(text!,style: TextStyle(fontWeight: fontWeight,fontSize: fontSize,color: fontColor),):Container(child: widget,),

        ],
      ),
    ),
  );
}
Widget textButton({String ?text,double fontSize = 14,FontWeight fontWeight = FontWeight.w400,Color color = Colors.blue,Function ?onTap}){
  return TextButton(
      onPressed: (){
        onTap!();
      },
      child: Text(text!,style: TextStyle(fontSize:  MySize.scaleFactorHeight*fontSize,fontWeight:fontWeight,color: color),)
  );

}

Widget custombutton2({
  bool ? isimage = false,
  String? text,
  double fontSize = 12,
  Color buttonColor = AppColors.themecolor,
  Function? ontap,
  Color fontColor = Colors.grey,
  double height = 50,
  double width = 200,
  double borderRadius = 8,
  FontWeight fontWeight = FontWeight.normal,
  Color bordercolor = Colors.transparent
})
{
  return  GestureDetector(
    onTap: (){
      ontap!();
    },
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: bordercolor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isimage!? Image.asset( "assets/icons/logour.png",height: MySize.size14,width: MySize.size14,):SizedBox(),
          isimage!? SizedBox(width: MySize.size10,):SizedBox(),
          Center(child: Text( text!,style:  TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: fontColor,fontFamily: "Montserrat-Bold"),)),
        ],
      ),
    ),
  );
}
Widget custombuttonArrow({String? text,double height =50,double width = 200,double borderRadius =8,Function? ontap}){
  return  GestureDetector(
    onTap: (){
      ontap!();
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 19,vertical: 12),
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: AppColors.themecolor
      ),
      child:Row(
        children: [
          customTextBold(title: text!,fontSize: MySize.size16,fontWeight: FontWeight.w700,color: Colors.white),
          SizedBox(width: MySize.size15,),
          VerticalDivider(color: AppColors.white,),
          Spacer(),
          Container(
            height: MySize.size32,
            width: MySize.size32,
            decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.88),
                shape: BoxShape.circle
            ),
            child: Center(child: Image.asset("assets/icons/arrowfar.png",height: MySize.size12,width: MySize.scaleFactorWidth*15,)),
          ),


        ],
      ),
    ),
  );
}