import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/widgets/custom_text.dart';

Widget genericAppBar(
    {String? text, bool showText = true, bool isText = false,Widget ? anything,bool isanything = false,Color boxcolor = Colors.transparent }) {
  return Row(
    children: [
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          height: MySize.size48,
          width: MySize.size48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
          ),
          child: Center(
            child: Image.asset(
              "assets/icons/arrow_left [#335].png",
              height: MySize.scaleFactorHeight * 15,
              width: MySize.scaleFactorWidth * 12,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MySize.size30,
      ),
      showText
          ? Column(
              children: [
                customTextBold(
                  title: text!,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black87,
                  fontSize: MySize.size18,
                ),
              ],
            )
          : SizedBox(),
      Spacer(),
      isText? Container(
        height: MySize.size48,
        width: MySize.size48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:boxcolor,
        ),
        child: Center(
          child: isanything? anything : null,
        ),
      ):SizedBox(),
    ],
  );
}
