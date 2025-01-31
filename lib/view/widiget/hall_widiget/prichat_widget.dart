import 'package:flutter/material.dart';
import 'package:fspu/controller/home/hall_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:get/get.dart';

class PrichatWidget extends GetView<HallControllerImp>{
  const PrichatWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 40,
            child:  Row(
              children: [
              const  Text(
                  "السعر :",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
               const SizedBox(
                  width: 20,
                ),
                GetBuilder<HallControllerImp>(builder: (controller)=>  Text(
                  controller.myhalldata.isNotEmpty ?
                  "${controller.myhalldata[0]['hall_price']} IQD":"IQD",
                  style: const TextStyle(
                      fontSize: 18,
                      color: AppColor.fspucolor,
                      fontWeight: FontWeight.bold),
                ),),
              
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "للساعة",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
  }
  
}