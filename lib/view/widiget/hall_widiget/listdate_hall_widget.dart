import 'package:flutter/material.dart';
import 'package:fspu/controller/home/hall_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:get/get.dart';

class ListdateHallWidget extends GetView<HallControllerImp>{
  @override
  Widget build(BuildContext context) {
  return   GetBuilder<HallControllerImp>(builder: (controller)=>
  controller.hallreservationlist.length==0? Text("لا توجد حجوزات حاليا"):
    Card(
              child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.hallreservationlist.length,
         itemBuilder: (BuildContext context, int index) { 
          return ListTile(
            leading: Text("${index+1}",style:const TextStyle(fontSize: 18),),
            trailing: Text("${controller.hallreservationlist[index]["hallreservation_data"]}",style:const TextStyle(fontSize: 13),),
            title: Text("${controller.hallreservationlist[index]['hallreservation_name']}"),
            subtitle:Container(
              child:Row(
                children: [
               const   Text("من "),
            const  SizedBox(width: 2,),
               Text("${controller.hallreservationlist[index]['hallreservation_form']}",style:const TextStyle(color: AppColor.fspucolortwo,))
  , const  SizedBox(width: 2,)
 ,const  
  Text("الى "),
  const  SizedBox(width: 2,),
            Text("${controller.hallreservationlist[index]['hallreservation_to']}",style:const TextStyle(color: AppColor.fspucolortwo,))
                ],
              )
            )
          
          );
          },
          ))
  );
     
  }

}