import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/activity_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/data/model/activitymodel.dart';
import 'package:fspu/view/widiget/activity/bost.dart';

class Activity extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ActivityControllerImp controller=Get.put(ActivityControllerImp());
return SafeArea(child: Scaffold(
  
  appBar : AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: AppColor.fspucolor,
        title: Text("جدول النشاطات",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:Colors.white),),),

body: Container(
  padding: EdgeInsets.all(15),
  child:ListView.separated(
   
     separatorBuilder:(BuildContext context,int index){
      return const Center(
        child: const Divider(
          endIndent: 50,
          indent: 50,
        //  color: AppColor.fspucolor,
        ),
      );
     },
      itemCount: controller.data.length,
       itemBuilder:(context,int index){
        return BostActivity(activityModel: ActivityModel.fromJson(controller.data[index]));
       },)),
)) ;
  }


}