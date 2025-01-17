
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/auth/sugnup_controller.dart';
import 'package:fspu/controller/university/university_controller.dart';
import 'package:fspu/view/screen/auth/signup.dart';
import 'package:fspu/view/screen/auth/verifycodesignup.dart';
import 'package:fspu/view/screen/universityy/choseunivesity.dart';

abstract class ScreenSingupController extends  GetxController{

  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
 
}
class ScreenSingupControllerImp extends ScreenSingupController{

SignUp_ControllerImp controllerSignup=Get.put(SignUp_ControllerImp());
GetUniversityControllerImp controllerrUniversity=Get.put(GetUniversityControllerImp());

int currentStep=0;
 List<Step> get Stepsk=>[
    Step(
      state: currentStep >0?StepState.complete:controllerSignup.stateform==0?StepState.error: StepState.indexed,
      isActive: currentStep >= 0,
      title: const Text("المعلومات",style: TextStyle(fontSize: 12),), content: const SizedBox(
       width: double.infinity,
       height: 550,
        child:SignUp() ,) ),
     Step(
       state: currentStep >1?StepState.complete:StepState.indexed,
       isActive: currentStep >= 1,
      title: const Text(
      
      "الجامعة",style: TextStyle(fontSize: 12)), content: const SizedBox(
    width: double.infinity,
    height: 600,
    child: Choseunivesity(),
      )),
      Step(
         state: currentStep >2?StepState.complete:StepState.indexed,
        
         isActive: currentStep >= 2,
        title: const Text("التوثيق",style: TextStyle(fontSize: 12)), content: const SizedBox(
           width: double.infinity,
    height: 600,
          child: VerifyCodeSignUp(),
        ))

  ];
stepContinue(){
  
  final isLastStep=currentStep==Stepsk.length-1;
 
   if(isLastStep){
    
    print("Cmpleted");
  }else{
   
       if(currentStep==0){
      print("here");
    controllerSignup.checkformstat();
     if(controllerSignup.stateform==1){
      if(controllerSignup.selectedGender=='51'){
         Get.defaultDialog(
      title:"خطا",
      middleText: "يجب ان تحدد الجنس"
    );
      }else{
 currentStep =currentStep+1;
      }}else{ 
 update();  
    }
    }else
     if(currentStep==1){
    if(controllerrUniversity.select_un=="non"){
           Get.defaultDialog(
      title:"خطا",
      middleText: "عليك تحديد احد الخيارات "
    );
    }else{
    controllerSignup.signup();
    controllerSignup.plus();
    
 currentStep =currentStep+1;
    }
   
  }else{
 currentStep =currentStep+1;
  }
  update();
  }
 
}
stepCancel(){
  currentStep==0?null:
 currentStep =currentStep-1;

  update();
}

@override
  void onInit() {
   // currentStep=0;
    // TODO: implement onInit
    super.onInit();
  }
  }

