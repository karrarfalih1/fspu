 

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/constantk/routesname.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/data/datasource/remote/auth/signup.dart';

abstract class SignUp_Controller extends  GetxController{
  signup();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSignIn();
  goToCheckEmail();
  hidandviewpassword();
}
class SignUp_ControllerImp extends SignUp_Controller{
GlobalKey<FormState> formstateSignUp=GlobalKey<FormState>();
 late TextEditingController email_controller;
 late TextEditingController password_controller;
 late TextEditingController username_controller;
  late TextEditingController phone_controller;
  
  late TextEditingController age_controller;
   String? selectedGender;
   StatusRequest?  statusRequest=StatusRequest.none;
 bool typepaworrdtext=true;

 // ignore: prefer_typing_uninitialized_variables
 SignUpData signUpData= SignUpData(Get.find());
 List data=[];
 String? select_un;
 int stateform=2;
 int stateform2=10;


 checkformstat(){
     if(formstateSignUp.currentState!.validate()){
     stateform=1;}else{
      stateform=0;
     }
  }
  @override
  signup() async{
    if(formstateSignUp.currentState!.validate()){
     stateform=1;
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
    update();

//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await signUpData.postdata(
      username_controller.text,
      email_controller.text,
      phone_controller.text,
      password_controller.text,
      selectedGender,age_controller.text,select_un,
    );
statusRequest=handleingData(response);
//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  
  if(response['status']=='success'){
    stateform2=5;
   // Get.toNamed(Approute.homepage);
 //  data.addAll(response['data']);
   //  Get.offNamed(Approute.verifyCodeSignUp,arguments: {
   //   "email":email_controller.text
   //  });
  }else{
     stateform2=3;
     update();
    //  await Future.delayed(Duration(seconds: 10));
    Get.defaultDialog(
      title: "Warning",middleText: "الايميل او الرقم موجود بالفعل");
   // statusRequest=StatusRequest.failure;
  }
 
}
else{
    Get.defaultDialog(title: "Warning",middleText: "الايميل او الرقم موجود y");
    statusRequest=StatusRequest.failure;
  }
update();
    }
     stateform=0;
  }


  @override
  goToSignIn() {
    
   Get.offNamed(Approute.login);
  }
@override
  void onInit() {
   
   email_controller =TextEditingController();
   password_controller=TextEditingController();
   username_controller=TextEditingController();
   phone_controller=TextEditingController();
   
   age_controller=TextEditingController();
 selectedGender="51";
    super.onInit();
  }
   up(){
  update();
 }

  @override
  void dispose() {
   email_controller.dispose();
   password_controller.dispose();
    username_controller.dispose();

    super.dispose();
  }
  
  @override
  goToCheckEmail() {

    
   var formdatasignup=formstateSignUp.currentState;
   if(formdatasignup!.validate()){
    print("vlidet-----------------------signUp");
     Get.offNamed(Approute.verifyCodeSignUp);
     Get.delete<SignUp_ControllerImp>();
   }else{
     print("note vlidet-----------------------signUp");
   }
   
  }
   @override
  hidandviewpassword(){
   typepaworrdtext=typepaworrdtext==true? false:true;
   update();
  }

  plus() async{ 
    var response=await signUpData.plusuniversity( 
      select_un
    ); update();
    }
  
}