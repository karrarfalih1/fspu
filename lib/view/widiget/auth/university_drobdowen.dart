
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:fspu/controller/auth/sugnup_controller.dart';
import 'package:fspu/controller/university/university_controller.dart';
import 'package:fspu/core/constantk/color.dart';

void showCustomBottomSheet(BuildContext context) {
  // ignore: unused_local_variable
  SignUp_ControllerImp controllers =Get.put(SignUp_ControllerImp());
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, // لجعل الصفحة تأخذ مساحة أكبر عند الحاجة
      builder: (BuildContext context) {
        return GetBuilder<GetUniversityControllerImp>(builder:(controller)=>
         Container(
    
  child: ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
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
     controller.up();
     print(controller.select_un);
      Get.back();
       });
      }))) ;
      },
    );
  }
