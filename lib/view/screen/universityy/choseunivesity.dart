

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/auth/sugnup_controller.dart';
import 'package:fspu/controller/university/university_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/view/widiget/auth/customsubtitleauth.dart';
import 'package:fspu/view/widiget/auth/customtexttitleaout.dart';
import 'package:fspu/view/widiget/auth/logoauth.dart';

class Choseunivesity extends StatelessWidget {
  const Choseunivesity({super.key});
  @override
  Widget build(BuildContext context) {
  String?  university;
GetUniversityControllerImp controller =Get.put(GetUniversityControllerImp());

SignUp_ControllerImp controllersignup =Get.put(SignUp_ControllerImp());
  return SizedBox(
  width: double.infinity,
  child: GetBuilder<GetUniversityControllerImp>(builder: (controller){ return SafeArea(
    
   child: ListView(children: [
      const SizedBox(height: 10,),
        
         const Center(child: CustomLogoAuth()),
          const SizedBox(height: 20,),
          const CustomTextTitleAuth(title:"اختر الجامعة",),
           const SizedBox(height: 20,),
          const CustomTextSubTitleAuth(
            subtitle:'ملاحضة:\n 1_اذا كنت قد تخرجت بالفعل اختر الجامعة التي درست فيها\n2_اذا لم تكمل  الجامعة اكتب  مدرسة او غير ذلك',)
         ,const SizedBox(height: 35,),
        Center(
    child: Container(
      
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.alldata.length,
      itemBuilder: (context,index){
       
          return
   RadioListTile.adaptive(
    activeColor: AppColor.fspucolor,
          title:Text(
            "${ controller.alldata[index]['university_name']}"
          ),
          
          value: "${controller.alldata[index]['university_id']}"  , groupValue: controller.select_un,
         onChanged:(val){
       controller.select_un=val;
       controllersignup.select_un=val;
       controller.up();
       print(val);
       
         });
        })))
        ,const SizedBox(height: 250,),
   ],)
   
   ,);
       
      }),
);

  
  }
}
