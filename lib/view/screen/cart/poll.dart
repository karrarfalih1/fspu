import 'package:flutter/material.dart';
import 'package:fspu/controller/cart_controller/poll_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/view/widiget/boll/qustionAndAnser.dart';
import 'package:get/get.dart';

class Pollview extends StatelessWidget{
  const Pollview({super.key});
  @override
  Widget build(BuildContext context) {
   PollControllerImp controller=  Get.put(PollControllerImp());
 
    return Scaffold(
     bottomNavigationBar: Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
  height: 85,
  
      child: InkWell(
        onTap: (){
          controller.cheksnepoll();

        },
        child: const Card(
          color: AppColor.fspucolor,
          child: Center(child: Text("ارسال",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color:Colors.white),),),),
      ),
     ),
       appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
        backgroundColor: AppColor.fspucolortwo,
        title: Text(
          "الاستبيانات",
              style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ),
      body 
      : GetBuilder<PollControllerImp>(builder: (controller)=>  
      HandlingDataView(statusRequest: controller.statusRequest, widget:
          Container(
        margin:const EdgeInsets.all(15),
        child: 
        const Qustionandanser()
   
      ) )
  ,)
    
    );

  }

}