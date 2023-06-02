
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/views/auth/started_screen.dart';
import 'package:quiz_app/views/bottom_nav/bottom_nav.dart';
import 'controllers/controllers.dart';
import 'firebase_options.dart';

void main(){
  runApp(myApp());
}
class myApp extends StatelessWidget {

  final GenericController userController = Get.put(GenericController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       home:StartedScreen(),
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: StartedScreen(),
    );
  }
}
