 //في هذه الصفحة نحن نفحص الايميل فقط 
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fspu/data/datasource/fspudata/points.dart';
import 'package:get/get.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/constantk/routesname.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/core/localizationk/changelocal.dart';
import 'package:fspu/core/servicesk/services.dart';
import 'package:fspu/data/datasource/fspudata/slider.dart';
MyServices myservices=Get.find();
abstract class HomeController extends  GetxController{

}

class HomeControllerImp extends HomeController{
  GlobalKey<ScaffoldState>scaffoldkey=GlobalKey();
  Points points =Points(Get.find());
  LocaleController controllerthem=Get.put(LocaleController());
StatusRequest statusRequest=StatusRequest.none;

StatusRequest statusRequestpoints=StatusRequest.none;
SliderData sliderData=SliderData(Get.find());
//////////points///////////
RxInt mypoints =0.obs;



List data=[];
 var Number_of_males=0;
 var Number_of_females=0;
 var total=0;
//////// drower//////////
    int value = 0;
  int? nullableValue;
  bool? positive ;
  bool loading = false;


ThemeData applight=
ThemeData(
   brightness: Brightness.light,
);

ThemeData appdart=
ThemeData(
   brightness: Brightness.dark,
);

positivef(b){
positive=b;
print(positive);
controllerthem.changeTheme(positive!);
update();

}

 PageController pageController=PageController();
 var currenPage=0.obs;
 @override


  @override
  void onInit() {
FirebaseMessaging fir=FirebaseMessaging.instance;
fir.subscribeToTopic("users");
 /*   FirebaseMessaging.instance.getToken().then((value){
      print("111111111111111111token00000000000000000token");
      print("${myservices.sharedPreferences.getString("karrar")}");
      print(value);
      String? token=value;
    }
    
    );*/
    if(myservices.sharedPreferences.getString("them")=="dark"){
      positive=true;
    }else{
      positive=false;
    }
    // TODO: implement onInit
    super.onInit();
    
     getSlider();
    print("========== GetCount==========");
      print(myservices.sharedPreferences.getString("id"));
       getPoints() ;
      
  }


  gotoactivity(){
    Get.toNamed(Approute.activity);
  }
  
/////////////////////////////////
  void startAutoSlide(){ 
    
    Timer.periodic(const Duration(seconds: 10), (timer){
      if(currenPage.value<2){
        currenPage.value++;
      }else{ 
        currenPage.value=0;
      }
      pageController.animateToPage(
        currenPage.value,

       duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);

    });
  }
  @override
  void onClose() async{
    super.onClose();
    
    pageController.dispose();

  }
///////////////////////////////////////
    getSlider() async{
    statusRequest=StatusRequest.loading;
      update();
    var response=await sliderData.getdata();
    statusRequest=handleingData(response);
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
   data.addAll(response['data']);
  
     startAutoSlide();
  }else{
    statusRequest=StatusRequest.failure; }
}
update();
  }

////////////////////الحصول على النقاط///////
    getPoints() async{
    statusRequestpoints=StatusRequest.loading;
      update();
    var response=await points.getPoints(myservices.sharedPreferences.getString("id").toString());
    statusRequestpoints=handleingData(response);
if(StatusRequest.success==statusRequestpoints){
  if(response['status']=='success'){
  
  mypoints.value= response['data']['users_points'];
     
  print("00000000000000pints");
   print(mypoints);
     print("00000000000000pints");
  }else{
    statusRequestpoints=StatusRequest.failure; }
}
update();
  }
}