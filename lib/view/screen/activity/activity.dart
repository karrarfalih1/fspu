import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/activity_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/data/model/activitymodel.dart';
import 'package:fspu/view/widiget/activity/bost.dart';

class Activity extends StatelessWidget{
  const Activity({super.key});

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
  padding: const EdgeInsets.all(15),
  child:ListView.separated(
   
     separatorBuilder:(BuildContext context,int index){
      return const Center(
        child: Divider(
          endIndent: 50,
          indent: 50,
     
        ),
      );
     },
      itemCount: controller.data.length,
       itemBuilder:(context,int index){
        if(controller.isSelect[controller.data[index]["activity_id"]]==null){
        controller.isSelect[controller.data[index]["activity_id"]]=controller.data[index]['participate'];
        }
        return BostActivity(activityModel: ActivityModel.fromJson(controller.data[index]));
       },)),
)) ;
  }


}