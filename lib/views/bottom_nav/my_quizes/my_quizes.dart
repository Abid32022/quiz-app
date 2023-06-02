import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/utils/my_size.dart';
import 'package:quiz_app/views/bottom_nav/discover/discover_screen.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import '../../../controllers/controllers.dart';
import '../../../widgets/data.dart';

class MyQuizes extends StatefulWidget {
  const MyQuizes({Key? key}) : super(key: key);

  @override
  State<MyQuizes> createState() => _MyQuizesState();
}

class _MyQuizesState extends State<MyQuizes>with TickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;
  final GenericController userController5 = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
   }
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: AppColors.bagroundColor,
      body: Container(
        color: AppColors.bagroundColor,
        child: Column(
          children: [
            SizedBox(height: MySize.size30,),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10,top: 10),
                  height: MySize.size48,
                  width: MySize.size48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                  ),
                  child: Center(child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Image.asset("assets/icons/arrow_left [#335].png",height: MySize.scaleFactorHeight*15,width: MySize.scaleFactorWidth*12,)),),
                ),
                SizedBox(width: MySize.size30,),
                Column(
                  children: [
                    SizedBox(height: MySize.size8,),
                    customTextBold(title: "My Quizzes",fontWeight: FontWeight.w600,color: AppColors.black87,fontSize: MySize.size18,),
                  ],
                ),
              ],
            ),
            SizedBox(height: MySize.size10,),
            TabBar(
              padding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              indicatorColor: AppColors.themecolor,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              onTap: (a){
                setState(() {
                });
              },
              isScrollable: true,
              controller:tabController,
              unselectedLabelColor: Colors.green,
              indicatorPadding:EdgeInsets.symmetric(vertical: 7,horizontal: 16),
              labelPadding: const EdgeInsets.symmetric(horizontal: 22,vertical: 0),
              indicatorWeight: 1,
              tabs: [

                Tab(child: Text("Passed",style: TextStyle(fontSize: MySize.size16,fontWeight: FontWeight.w600,color: tabController.index == 0? AppColors.themecolor: Colors.grey),), ),
                Tab(child: Text("Failed",style: TextStyle(fontSize: MySize.size16,fontWeight: FontWeight.w600,color:tabController.index == 1? AppColors.themecolor: Colors.grey),), ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  Container(
                    //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child:  ListView.builder(
                        itemCount: userController5.topList.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return TopQuizesComponent(b: userController5.topList[index],isTick: false,iscross: true,);
                        }),
                  ),
                  Container(
                    child:  ListView.builder(
                        itemCount: userController5.topList.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return TopQuizesComponent(b: userController5.topList[index],isTick: false,iscross: false,);
                        }),
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
