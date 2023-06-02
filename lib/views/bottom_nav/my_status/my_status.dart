import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/views/bottom_nav/my_status/edit_profile.dart';
import 'package:quiz_app/widgets/appbar.dart';
import '../../../controllers/controllers.dart';
import '../../../utils/my_size.dart';
import '../../../widgets/custom_text.dart';

class MyStatusScreen extends StatefulWidget {
  const MyStatusScreen({Key? key}) : super(key: key);

  @override
  State<MyStatusScreen> createState() => _MyStatusScreenState();
}

class _MyStatusScreenState extends State<MyStatusScreen> {
  final GenericController userController4 = Get.find();
  String _selectedValue2 = 'Weekly';

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
                child: genericAppBar(text: "My Status",boxcolor: AppColors.white,isText: true,isanything: true,anything:
                GestureDetector(
                    onTap: (){
                      Get.to(()=> EditProfile());
                    },
                    child: Image.asset("assets/icons/edit.png",height: MySize.size17,width: MySize.size17,))),
              ),

              SizedBox(height: MySize.size80,),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.only(left: 20,right: 20,top: 22),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.themecolor,
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTextRegular(title: "Hey! John Jerry",fontWeight: FontWeight.w600,color: AppColors.white.withOpacity(0.62),fontSize: MySize.size12),
                          Image.asset("assets/icons/light.png",height: MySize.scaleFactorHeight*34,width: MySize.scaleFactorWidth*37,)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                          //    color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: MySize.size4,),
                                  customTextRegular(title: "Your Level",fontWeight: FontWeight.w700,color: AppColors.white,fontSize: MySize.size18),
                                  SizedBox(height: MySize.size6,),
                                  customTextRegular(title: "Congrats you are in intermediate",fontWeight: FontWeight.w400,color: AppColors.white,fontSize: MySize.size12),
                                  SizedBox(height: MySize.size14),
                                  LinearPercentIndicator(
                                    width: 149.0,
                                    padding: EdgeInsets.zero,
                                    lineHeight: 10.0,
                                    percent: 0.5,
                                    barRadius: Radius.circular(8),
                                    backgroundColor: Color(0xffD9D9D9),
                                    progressColor: AppColors.greenhalf,
                                  ),
                                  SizedBox(height: 40,),
                                ],
                              ),
                            ),
                            Expanded(child: Image.asset("assets/icons/books.png",height: MySize.scaleFactorHeight*121,width: MySize.scaleFactorWidth*127,))
                          ],
                        )

                      ],
                    ),

                  ),

                  Positioned(
                  top: -50,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MySize.size90,
                      width: MySize.size90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white,width: 2)
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/image1.png")
                          )
                        ),
                      ),
                    ),
                  ),
                  // FutureBuilder(
                  //   future: FireStoreDataBase().getData(),
                  //     builder: (context,snapshot){
                  //   if(snapshot.hasError){
                  //     return Text("Something Went Wrong");
                  //   }
                  //
                  //   if (snapshot.connectionState == ConnectionState){
                  //     return Image.network(snapshot.data.toString());
                  //   }
                  //   return Center(child: CircularPercentIndicator(radius: 20,),);
                  // }
                  // ),
                  // image == null? CircleAvatar():CircleAvatar(
                  //   backgroundImage: NetworkImage(image),
                  // ),

                  // Positioned(
                  //   top: -54,
                  //   left: 0,
                  //     right: 0,
                  //   child: Align(
                  //     child: GestureDetector(
                  //       onTap: (){
                  //         Get.to(()=> QuizDetail());
                  //       },
                  //       child: Container(
                  //         height: MySize.size90,
                  //         width: MySize.size90,
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           border: Border.all(color: AppColors.white,width: 3),
                  //           image: DecorationImage(
                  //             image: AssetImage("assets/images/avatar.png"),
                  //             fit: BoxFit.fill
                  //           ),
                  //         ),
                  //
                  //       ),
                  //     ),
                  //   ),
                  // ),

                ],
              ),
              SizedBox(
                height: MySize.size30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MySize.size90,
                          width: MySize.size90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,boxShadow: [
                            BoxShadow(
                                color: AppColors.greyb2.withOpacity(0.020),
                                spreadRadius: 0,
                                blurRadius: 40,
                                offset: Offset(0,6.79)
                            )
                          ],
                          ),
                          child: Image.asset("assets/images/t1.png",scale: 3.6,),
                        ),
                        Container(
                          height: MySize.size90,
                          width: MySize.size90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.greyb2.withOpacity(0.020),
                                  spreadRadius: 0,
                                  blurRadius: 40,
                                  offset: Offset(0,6.79)
                              )
                            ],
                          ),
                          child: Image.asset("assets/icons/t2.png",scale: 3.6,),
                        ),

                        Container(
                          height: MySize.size90,
                          width: MySize.size90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.greyb2.withOpacity(0.020),
                                  spreadRadius: 0,
                                  blurRadius: 40,
                                  offset: Offset(0,6.79)
                              )
                            ],
                          ),
                          child: Image.asset("assets/icons/t3.png",scale: 3.6,),
                        ),
                      ],
                    ),
                    SizedBox(height: MySize.size18,),
                    Padding(
                      padding: const EdgeInsets.only(right: 18,left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customTextRegular(title: "Total Quizzes",fontWeight: FontWeight.w600,color: AppColors.greyAb,fontSize: MySize.scaleFactorHeight*13,),
                          customTextRegular(title: "In Progress",fontWeight: FontWeight.w600,color: AppColors.greyAb,fontSize: MySize.scaleFactorHeight*13,),
                          customTextRegular(title: "Watched",fontWeight: FontWeight.w600,color: AppColors.greyAb,fontSize: MySize.scaleFactorHeight*13,),
                          // SizedBox(width: MySize.size0,),
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.scaleFactorHeight*12,),
                    Padding(
                      padding: const EdgeInsets.only(right: 27,left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customTextRegular(title: "45",fontWeight: FontWeight.w600,color: AppColors.themecolor,fontSize: MySize.scaleFactorHeight*24,),
                          customTextRegular(title: "34",fontWeight: FontWeight.w600,color: AppColors.themecolor,fontSize: MySize.scaleFactorHeight*24,),
                          customTextRegular(title: "98",fontWeight: FontWeight.w600,color: AppColors.themecolor,fontSize: MySize.scaleFactorHeight*24,),

                        ],
                      ),
                    ),
                    SizedBox(height: MySize.size20,),
                  ],
                ),
              ),
              Divider(color: Color(0xffD1D5DB),thickness: 0.3,),
              SizedBox(height: MySize.size20,),
              Row(
             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                   //   width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customTextBold(title: "Performance",fontWeight: FontWeight.w600,color: AppColors.black42,fontSize: MySize.scaleFactorHeight*16,),

                        ],
                      )),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        //  padding: const EdgeInsets.only(top: 10,left: 17,right: 23),
                        height: MySize.size24,
                        width: MySize.scaleFactorWidth*73,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: DropdownButton(
                          style: GoogleFonts.getFont('Urbanist',textStyle: TextStyle(fontSize: MySize.size10,color: AppColors.black,letterSpacing: 0.7,fontWeight: FontWeight.w400)),
                          value: _selectedValue2,
                          isExpanded: true,
                          isDense: true,
                          iconSize: 14,
                          icon: const Icon(Icons.keyboard_arrow_down,color: AppColors.grey99,),
                          underline: Container(),
                          onChanged: (newValue){
                            setState(() {
                              _selectedValue2='$newValue';
                            });
                          },
                          items: <String>['Monthly', 'Weekly', 'Daily']
                              .map((country) {
                            return DropdownMenuItem(child:  Text(country),
                              value: country,
                            ) ;
                          }
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                SizedBox(width: MySize.size24,),
                ],
              ),
              SizedBox(height: MySize.size30,),
              SizedBox(
                  height: MySize.scaleFactorHeight*320,
                  child: HomePage()),


            ],
          ),
        ),
      ),
    );
  }

}


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Generate dummy data to feed the chart
  final List<DataItem> _myData = List.generate(
      30,
          (index) => DataItem(
        x: index,
        y1: Random().nextInt(11) + Random().nextDouble(),
        y2: Random().nextInt(11) + Random().nextDouble(),
        y3: Random().nextInt(11) + Random().nextDouble(),
      ));

  @override
  Widget build(BuildContext context) {
    // BarChart(
    //   BarChartData(
    //     // look into the source code given below
    //   ),
    //   swapAnimationDuration: Duration(milliseconds: 150), // Optional
    //   swapAnimationCurve: Curves.linear, // Optional
    // );
    return Column(
      children: [
     //   SizedBox(height: 40,),
        Container(
        //  color: Colors.amber,
          margin: EdgeInsets.symmetric(horizontal: 20),
           height: MySize.scaleFactorHeight*300,
          child: BarChart(
              BarChartData(
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      top: BorderSide(color: AppColors.bagroundColor),
                      left: BorderSide(color: AppColors.greyAb),
                      right: BorderSide(color:AppColors.bagroundColor),
                      bottom: BorderSide(color: AppColors.greyAb),
                    ),
                      //border:Border.all(color: AppColors.black33)
                     //  border: Border(
                     //    top: BorderSide.none,
                     //    right: BorderSide.none,
                     //    // left: BorderSide.none,
                     //    // bottom: BorderSide.none,
                     //  )
                  ),
                  groupsSpace: 10,
                  barTouchData: BarTouchData(enabled: true,),
                  gridData: FlGridData(show: false,),
                  maxY: 10,
                  // minY: 3,
                  titlesData:FlTitlesData(show: true,rightTitles: AxisTitles(),topTitles: AxisTitles(),leftTitles: AxisTitles()) ,

                  barGroups: [
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(fromY: 0, toY: 5, width: 15, color: AppColors.blueE6),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(fromY: 0, toY: 8, width: 15, color: AppColors.blueE6),
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(fromY: 0, toY: 5, width: 15, color:  AppColors.blueE6),
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(fromY: 0, toY: 8, width: 15, color:  AppColors.blueE6),
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(fromY: 0, toY: 6, width: 15, color:  AppColors.blueE6),
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(fromY: 0, toY: 8, width: 15, color:  AppColors.blueE6),
                    ]),
                    BarChartGroupData(x: 7, barRods: [
                      BarChartRodData(fromY: 0, toY: 5, width: 15, color:  AppColors.blueE6,)
                    ]),

                  ])),
        ),
      ],
    );
  }
}
class DataItem {
  int x;
  double y1;
  double y2;
  double y3;
  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3});
}