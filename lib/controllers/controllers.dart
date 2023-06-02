import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/models/new_quizes_model.dart';
import 'package:quiz_app/models/onboarding_screen_model.dart';
import 'package:quiz_app/utils/app_colors.dart';
import '../models/create_quiz_model.dart';
import '../models/discover_model.dart';
import '../models/homescreen_model.dart';
import '../models/top_authormodel.dart';
import '../models/top_quiz_model.dart';
import '../models/true_false_model.dart';
import '../models/type_answer_model.dart';

class GenericController extends GetxController {

  RxList<OnboardingModel> users = <OnboardingModel>[].obs;
  RxList<HomeScreenModel> homeList= <HomeScreenModel>[].obs;
  RxList<DiscoverModel> disList = <DiscoverModel>[].obs;
  RxList<NewQuizesModel> quizzList= <NewQuizesModel>[].obs;
  RxList<TopQuizesModel> topList = <TopQuizesModel>[].obs;
  RxList<TopAuthorModel> authorList= <TopAuthorModel>[].obs;
  RxList<CreateQuizModel> createList = <CreateQuizModel>[].obs;
  RxList<TypeAnswerModel> typeList = <TypeAnswerModel>[].obs;
  RxList<StartTrueFalseModel> startList = <StartTrueFalseModel>[].obs;
  RxList fillList = [].obs;
  RxList addingList = [].obs;


  @override
  void onInit() {
    users.addAll([
      OnboardingModel("assets/images/onboarding1.png", "Join Quiz app to improve learning skills", "Make your self as an intelligent and sharp minded to use this platform easily ",),
      OnboardingModel("assets/images/onboarding2.png", "Prepare yourself and join test frequently ","Make your self as an intelligent and sharp minded to use this platform easily ",),
      OnboardingModel("assets/images/onboarding3.png", "Finish your test in specific time properly", "Make your self as an intelligent and sharp minded to use this platform easily ",),
    ]);

    fillList.assignAll(['Is', 'Were', 'Was','Are']);
    addingList.assignAll(['3+4 = 16', '3+4 = 10', '3+4 = 7','3+4 = 9']);

    startList.addAll([
      StartTrueFalseModel("True", "assets/icons/circleTick.png",AppColors.green),
      StartTrueFalseModel("False", "assets/icons/red.png", AppColors.red1b),
    ]);
    homeList.addAll([
      HomeScreenModel("UX/UI", "assets/images/home1.png"),
      HomeScreenModel("English", "assets/images/home2.png"),
      HomeScreenModel("Computer", "assets/images/home3.png"),
      HomeScreenModel("Chemistry", "assets/images/home4.png"),
      HomeScreenModel("Physics", "assets/images/home5.png"),
      HomeScreenModel("Biology", "assets/images/home6.png"),
      HomeScreenModel("Data Analysis", "assets/images/home7.png"),
      HomeScreenModel("Cyber Security", "assets/images/home8.png"),
      HomeScreenModel("Cloud Computing", "assets/images/home9.png"),
    ]);
    disList.addAll([
      DiscoverModel("assets/images/dis1.png","George Parl"),
      DiscoverModel("assets/images/dis2.png", "Demak Senar"),
      DiscoverModel("assets/images/dis3.png", "Hest Pezal"),
      DiscoverModel("assets/images/dis4.png", "Gorak jimp"),
      DiscoverModel("assets/images/dis2.png", "Demak Senar"),
    ]);
    quizzList.addAll([
      NewQuizesModel("James Torint", "Probability & Statics", "assets/images/quiz1.png", "assets/images/avat1.png", 23, "Maths"),
      NewQuizesModel("James Torint", "Communication Skills", "assets/images/q2.png", "assets/images/a1.png", 23, "Eglish"),
      NewQuizesModel("James Torint", "Organic System", "assets/images/q3.png", "assets/images/a2.png", 23, "Chemistry"),
      NewQuizesModel("Gerek Partis", "Security Managing", "assets/images/q4.png", "assets/images/a3.png", 23, "Cyber Security"),
      NewQuizesModel("Farmen Hest", "Newton’s Laws", "assets/images/q6.png", "assets/images/a4.png", 23, "Physics"),
      NewQuizesModel("Nomi Seles", "Description of Design Sprint", "assets/images/q7.png", "assets/images/a5.png", 23, "UX/UI"),
    ]);
    authorList.addAll([
      TopAuthorModel("Chemistry", "George Peken", "assets/images/dis1.png"),
      TopAuthorModel("Physics", "Kengar Naset", "assets/images/dis2.png"),
      TopAuthorModel("Maths", "Kengar Naset", "assets/images/dis3.png"),
      TopAuthorModel("Computer", "Kengar Naset", "assets/images/dis4.png"),
      TopAuthorModel("English ", "Helen Mask", "assets/images/dis5.png"),
      TopAuthorModel("Cyber Security", "Orban Dollar", "assets/images/dis6.png"),
      TopAuthorModel("Data Analysis", "Fost Porjee", "assets/images/dis7.png"),
      TopAuthorModel("Biology", "Refard Jekar", "assets/images/dis8.png"),
    ]);
    createList.addAll([
      CreateQuizModel("assets/images/createquiz.png", "True & False"),
      CreateQuizModel("assets/images/createquiz2.png", "Question & Answer"),
      CreateQuizModel("assets/images/createquiz3.png", "Checkbox"),
      CreateQuizModel("assets/images/createquiz4.png", "Fill the blanks"),
    ]);
    topList.addAll([
      TopQuizesModel("Nomi Hest", "Security Steps", "assets/images/topQ1.png", "Cyber Security", "assets/images/ava2.png", 18),
      TopQuizesModel("Dollar Parch", "Identification of Bacteria", "assets/images/top22.png", "Biology", "assets/images/ava2.png",18),
      TopQuizesModel("James Torint", "Probability & Statics", "assets/images/q1.png", "Mathematics", "assets/images/dis1.png", 24),
      TopQuizesModel("Dollar Parch", "Study Skills", "assets/images/q2.png", "English", "assets/images/dis2.png", 25),
      TopQuizesModel("Jhost Kernal", "Atoms & Molecules", "assets/images/q3.png", "Chemistry", "assets/images/dis3.png", 22),
      TopQuizesModel("Nomi Hest", "Security Steps", "assets/images/q4.png", "Cyber Security", "assets/images/dis4.png", 32),
      TopQuizesModel("Kimran Boost", "Service Model ", "assets/images/q6.png", "Cloud Computing", "assets/images/dis5.png", 23),
      TopQuizesModel("Dollar Parch", "Identification of Bacteria", "assets/images/q7.png", "Biology", "assets/images/dis6.png", 12),
    ]);
    typeList.addAll([
      TypeAnswerModel("True", "A"),
      TypeAnswerModel("False", "B"),
      TypeAnswerModel("False", "C"),
      TypeAnswerModel("False", "D"),
    ]);
    super.onInit();
  }
}

class ImagePickerController extends GetxController{
  var imagePath = ''.obs;
  RxString imagePath2 = ''.obs;
  RxString imagePath3 = ''.obs;
  RxString imagePath4 = ''.obs;
  Future getImage()async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage( source: ImageSource.gallery);
    if(image != null){
      imagePath.value = image.path.toString();
    }
  }
  Future getImage2()async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage( source: ImageSource.gallery);
    if(image != null){
      imagePath2.value = image.path.toString();
    }
  }
  Future getImage3()async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage( source: ImageSource.gallery);
    if(image != null){
      imagePath3.value = image.path.toString();
    }
  }
  Future getImage4()async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage( source: ImageSource.gallery);
    if(image != null){
      imagePath4.value = image.path.toString();
    }
  }
}

class MyController extends GetxController {

  final text1Controller = TextEditingController();
  final text2Controller = TextEditingController();
  final text3Controller = TextEditingController();
  final text4Controller = TextEditingController();
  final text5Controller = TextEditingController();
  final text6Controller = TextEditingController();
  final text7Controller = TextEditingController();
  final text8Controller = TextEditingController();

  final text11Controller = TextEditingController();
  final text22Controller = TextEditingController();
  final text33Controller = TextEditingController();
  final text44Controller = TextEditingController();
  final text55Controller = TextEditingController();

  final text111Controller = TextEditingController();
  final text222Controller = TextEditingController();
  final text333Controller = TextEditingController();
  final text444Controller = TextEditingController();
  final text555Controller = TextEditingController();

  void clearTextFields() {
    text1Controller.clear();
    text2Controller.clear();
    text3Controller.clear();
    text4Controller.clear();
    text5Controller.clear();
    text6Controller.clear();
    text7Controller.clear();
    text8Controller.clear();
  }
  void clearTextField(){
    text11Controller.clear();
    text22Controller.clear();
    text33Controller.clear();
    text44Controller.clear();
    text55Controller.clear();
  }
  void clearTextFieldBlank(){
    text111Controller.clear();
    text222Controller.clear();
    text333Controller.clear();
    text444Controller.clear();
    text555Controller.clear();
  }
}

class CheckBoxModel{
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  CheckBoxModel({required this.text1,required this.text2,required this.text3,required this.text4,required this.text5});
}
class FillBlankModel{
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  FillBlankModel({required this.text1,required this.text2,required this.text3,required this.text4,required this.text5});
}

class MyData {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  final String text8;
  MyData({required this.text1, required this.text2, required this.text3,required this.text4,required this.text5,required this.text6,required this.text7,required this.text8});
}
