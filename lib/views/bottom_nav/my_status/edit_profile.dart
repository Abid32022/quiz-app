import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/widgets/appbar.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool visible = true;

  final nameController = TextEditingController();
  final userAgeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      body: Container(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MySize.size40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: genericAppBar(
                  text: "Edit Profile",
                  isText: true,
                  isanything: false,
                  anything: Image.asset(
                    "assets/icons/edit.png",
                    height: MySize.size17,
                    width: MySize.size17,
                  )),
            ),
            SizedBox(
              height: MySize.size40,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red)),
                    padding: EdgeInsets.all(1),
                    child: Container(
                      height: MySize.size90,
                      width: MySize.size90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/avatar.png")
                        ),
                      ),

                    ),
                  ),

                  Positioned(
                    bottom: 5,
                    right: 4,
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        height: MySize.size22,
                        width: MySize.size22,
                        decoration: BoxDecoration(
                          color: AppColors.bluec7,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/cam.png",
                          scale: 3.4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MySize.size5,
            ),
            Center(
                child: customTextRegular(
                  title: "John Jerry",
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey68,
                  fontSize: MySize.scaleFactorHeight * 16,
                )),
            SizedBox(height: MySize.size30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextRegular(
                    title: "Full Name",
                    fontWeight: FontWeight.w500,
                    color: AppColors.black87,
                    fontSize: MySize.size14,
                  ),
                  SizedBox(
                    height: MySize.size5,
                  ),
                  Container(
                      height: MySize.size54,
                      child: textField(
                          hintText: "Enter your Full name",
                          fontSize: MySize.size16,
                          fontWeight: FontWeight.w400,
                          prefixIcon: false,
                          prefixImage: "assets/icons/msgs.png",
                          bordercolor: Colors.transparent,
                          filled: true,
                          fillcolor: AppColors.white,
                          controller: nameController
                      )),
                  SizedBox(
                    height: MySize.size15,
                  ),
                  customTextRegular(
                    title: "Email",
                    fontWeight: FontWeight.w500,
                    color: AppColors.black87,
                    fontSize: MySize.size14,
                  ),
                  SizedBox(
                    height: MySize.size5,
                  ),
                  SizedBox(
                    height: MySize.size54,
                    child: textField(
                      hintText: "Enter your email",
                      fontSize: MySize.size16,
                      fontWeight: FontWeight.w400,
                      prefixIcon: false,
                      prefixImage: "assets/icons/lock.png",
                      isObscure: visible,
                      bordercolor: Colors.transparent,
                      filled: true,
                      ontap: () {},
                      fillcolor: AppColors.white,
                      controller: userAgeController,
                    ),
                  ),
                  SizedBox(
                    height: MySize.size40,
                  ),
                  custombutton2(
                    text: "Update",
                    height: MySize.size50,
                    ontap: () {},
                    width: Get.width,
                    fontColor: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: MySize.size16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}





