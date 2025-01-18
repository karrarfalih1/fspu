
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/auth/sugnup_controller.dart';
import 'package:fspu/controller/auth/veerifycodesignup_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/view/widiget/auth/customsubtitleauth.dart';
import 'package:fspu/view/widiget/auth/customtexttitleaout.dart';
import 'package:fspu/view/widiget/auth/logoauth.dart';

class VerifyCodeSignUp extends StatelessWidget{
  const VerifyCodeSignUp({super.key});
  @override
  Widget build(BuildContext context) {

//نحقن الكونترولر الخاص بها
 //VerifyCodeSignUp_ControllerImp controller= Get.put(VerifyCodeSignUp_ControllerImp());
    Get.lazyPut(()=>VerifyCodeSignUp_ControllerImp());
  SignUp_ControllerImp controllerSignup=Get.put(SignUp_ControllerImp()) ;
    return Container(
  child: GetBuilder<VerifyCodeSignUp_ControllerImp>(builder:(controller)=>
  
  HandlingDataView(statusRequest: controller.statusRequest, widget: 
  SizedBox(
     //color: Colors.white,
    //color: Colors.red,
   // padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
    width: double.infinity,
    child: ListView(
      children:[     const SizedBox(height: 40,),
      
       const Center(child: CustomLogoAuth()),
        const SizedBox(height: 10,),
      
      const CustomTextTitleAuth(title:"توثيق الحساب",),
       const SizedBox(height: 10,),
       const CustomTextSubTitleAuth(subtitle: "سوف يصلك رقم سري  على بريدك \n",),
     //  Center(child: Text(controllerSignup.email_controller.text))
      const SizedBox(height: 35,),
      
    Directionality(
      
      textDirection: TextDirection.ltr,
      child: OtpTextField(
      focusedBorderColor: AppColor.maincolor,
        borderWidth: 2.5,
      fieldWidth: 45,
            numberOfFields: 5,
            borderColor: const Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true, 
            //runs when a code is typed in
            onCodeChanged: (String code) {
                //handle validation or checks here           
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
              print("11111111111");
              print(verificationCode);
                print("11111111111");
          controller.goToSuccessSingUp(verificationCode);
           
            }, // end onSubmit
        ),
    ),
  
      ],
  
    ),))
  ),
)
   ;
    
  
  }

}
  