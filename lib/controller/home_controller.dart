 //في هذه الصفحة نحن نفحص الايميل فقط 
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fspu/core/constantk/apptheme.dart';
import 'package:flutter/material.dart';
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
  LocaleController controllerthem=Get.put(LocaleController());
StatusRequest statusRequest=StatusRequest.none;
SliderData sliderData=SliderData(Get.find());
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

//////////////




 PageController pageController=PageController();
 var currenPage=0.obs;
 @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value){
      print("111111111111111111token00000000000000000token");
      print(value);
      String? token=value;
    });
    if(myservices.sharedPreferences.getString("them")=="dark"){
      positive=true;
    }else{
      positive=false;
    }
    // TODO: implement onInit
    super.onInit();
     startAutoSlide();
     getSlider();
     GetCount() ;
      print("========== GetCount==========");
  }



  gotoactivity(){
    Get.toNamed(Approute.activity);
  }
  void startAutoSlide(){
    Timer.periodic(Duration(seconds: 10), (timer){
      if(currenPage.value<2){
        currenPage.value++;
      }else{
        currenPage.value=0;
      }
      pageController.animateToPage(
        currenPage.value,

       duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

    });
  }
  @override
  void onClose() {
    pageController.dispose();
    // TODO: implement onClose
    super.onClose();
  }

    getSlider() async{
    statusRequest=StatusRequest.loading;
      update();
    var response=await sliderData.getdata();
    statusRequest=handleingData(response);
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
   data.addAll(response['data']);
   print("dataslier-----------------dataslier");
   print(data);
  }else{
    statusRequest=StatusRequest.failure; }
}
update();
  }
  GetCount() async{
    statusRequest=StatusRequest.loading;
    var response=await sliderData.getcount();
    statusRequest=handleingData(response);
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
Number_of_males=response['male_count'];
Number_of_females=response['female_count'];
total=Number_of_females+Number_of_males;
  }else{
    statusRequest=StatusRequest.failure;
     }
   
}
update();
  }


}