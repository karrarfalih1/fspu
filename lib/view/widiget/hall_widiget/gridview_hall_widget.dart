
import 'package:flutter/material.dart';
import 'package:fspu/controller/home/hall_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:get/get.dart';

class GridviewHallWidget extends GetView<HallControllerImp>{
  const GridviewHallWidget({super.key});
  @override
  Widget build(BuildContext context) {
   return GridView.builder(
    itemCount: controller.detels.length,
      physics:const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3)
   , itemBuilder: (BuildContext context, int index) { 
    return Card(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const SizedBox(height: 10,),
    Text("${controller.detels[index]['title']}",style:const TextStyle(color: AppColor.fspucolor),),
   const SizedBox(height: 10,),
   Icon(controller.detels[index]['icon'],size: 30,),
     const Spacer(),
   SizedBox(
     
      width: double.infinity,
     // color: AppColor.fspucolortwo,
      height: 30,
      child: GetBuilder<HallControllerImp>(builder:(controller)=>
        HandlingDataView(statusRequest:controller.statusRequest,
         widget: controller.myhalldata.isNotEmpty?   Center(
          // ignore: prefer_const_constructors
          child:Text("${controller.myhalldata[0]['${controller.detels[index]['namehall']}']}",style: const TextStyle(fontWeight: FontWeight.bold,),)):Text("0")
         )
      )
      
    ),
   
     const SizedBox(height: 10,)
   
    ],),);
    },);}

}