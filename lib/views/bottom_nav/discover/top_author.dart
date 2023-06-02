import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/top_authormodel.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/views/bottom_nav/discover/tutor_detail.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';
import 'package:quiz_app/widgets/data.dart';
import '../../../controllers/controllers.dart';
import '../../../utils/my_size.dart';
import '../../../widgets/appbar.dart';
class TopAuthorScreen extends StatefulWidget {
  const TopAuthorScreen({Key? key}) : super(key: key);

  @override
  State<TopAuthorScreen> createState() => _TopAuthorScreenState();
}

class _TopAuthorScreenState extends State<TopAuthorScreen> {

  final GenericController usercontroller7 = Get.find();
  bool isFolow = true;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: AppColors.bagroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MySize.size40,),
              genericAppBar(text: "Top Tutor"),
              SizedBox(height: MySize.size30,),
              SizedBox(
                  height: MySize.size54,
                  child: textField(hintText: "Search here...",
                      fontSize: MySize.size16,fontWeight: FontWeight.w400,prefixIcon: true,prefixImage: "assets/icons/Search.png",bordercolor: Colors.transparent,filled: true,fillcolor: AppColors.white)),

              SizedBox(height: MySize.size30,),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: usercontroller7.authorList.length,
                  itemBuilder: (context,index){
                return  GestureDetector(
                  onTap: (){
                    Get.to(()=> TutorDetail());
                  },
                    child: TopAuthorPart(b: usercontroller7.authorList[index],));
              })


            ],
          ),
        ),
      ),
    );
  }
}
class TopAuthorPart extends StatefulWidget {
 const  TopAuthorPart({Key? key,required this.b}) : super(key: key);
  final TopAuthorModel b;
  @override
  State<TopAuthorPart> createState() => _TopAuthorPartState();
}

class _TopAuthorPartState extends State<TopAuthorPart> {
  bool isFolow = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
          padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          child:ListTile(
            tileColor: Colors.amber,
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(widget.b.image)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextRegular(title: widget.b.title,fontWeight: FontWeight.w600,color: AppColors.black,fontSize: MySize.size14,),
                SizedBox(height: MySize.size2,),
                customTextRegular(title:widget.b.subtitle,fontWeight: FontWeight.w400,color: AppColors.black2f.withOpacity(0.65),fontSize: MySize.size12,),
                SizedBox(height: MySize.size5,)
              ],
            ),
            trailing: GestureDetector(
                onTap: (){
                  setState(() {
                    isFolow =! isFolow;
                  });
                },
                child: customTextRegular(title:isFolow? "Follow": "Following",fontWeight: FontWeight.w600,color: isFolow?AppColors.themecolor:AppColors.greycd,fontSize: MySize.size12,)),

          ),

        ),
    );
  }
}
