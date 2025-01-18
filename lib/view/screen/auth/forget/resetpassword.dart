
//هذه الصفحة  لنتاكد ان  الايميل  موجود فعلا في قاعدة البيانات   ثم ننقله للتحقق  من البريد الالكتروني  
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/view/widiget/auth/costomtestfeld.dart';
import 'package:fspu/view/widiget/auth/custombuttomauth.dart';
import 'package:fspu/view/widiget/auth/customsubtitleauth.dart';
import 'package:fspu/view/widiget/auth/customtexttitleaout.dart';

class ResetPassword extends StatelessWidget{
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {

//نحقن الكونترولر الخاص بها
 ResetPassword_ControllerImp controller=
  Get.put(ResetPassword_ControllerImp());
    return SafeArea(child:   Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: Colors.white,
        title: Text(" ",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),
body: GetBuilder<ResetPassword_ControllerImp>(builder: (controller)=>
HandlingDataView(statusRequest: controller.statusRequest, widget:
Container(
   color: Colors.white,
  //color: Colors.red,
  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: ListView(
    children:[
      const SizedBox(height: 15,),
      const SizedBox(height: 15,),
      const CustomTextTitleAuth(title:"تغيير كلمة المرور",),
      const SizedBox(height: 10,),
      const CustomTextSubTitleAuth(subtitle: ' الرجاء ادخال  كلمة المرور الجديدة',)
     ,const SizedBox(height: 35,),
    
      Customtextfeld(
         valid: (val){
           return null;
         
              
            },
        mycontroller: controller.newpassword_controller,
        hintText: "اكتب كلمة السر الجديدة",
       labeltext: 'New Password',
        iconss:Icons.person_outline,
      //   mycontroller: ,
      ),
      
      Customtextfeld(
         valid: (val){
           return null;
         
              
            },
        mycontroller: controller.Renewpassword_controller,
        hintText: "اعد كتابة كلمة السر",
       labeltext: 'New Password',
        iconss:Icons.person_outline,
      //   mycontroller: ,
      ),
    
     CustomButtomAuth(textbuttom: "حفظ",onPressed: (){
      controller.goToSuccessResetPassword();
     },),
    const SizedBox(height: 30,),

    ],

  ),) )
)
    ));
    
  
  }

}
  