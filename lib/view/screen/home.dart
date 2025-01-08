
import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/activity_controller.dart';
import 'package:fspu/controller/home_controller.dart';
import 'package:fspu/controller/university/university_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/constantk/imagesasset.dart';
import 'package:fspu/core/localizationk/changelocal.dart';
import 'package:fspu/core/servicesk/services.dart';
import 'package:fspu/view/widiget/appbar.dart';
import 'package:fspu/view/widiget/dart_ligh_mode.dart';
import 'package:fspu/view/widiget/home/card_home.dart';
import 'package:fspu/view/widiget/home/mail_famel_costom.dart';
import 'package:fspu/view/widiget/home/silder_image_home.dart';
import 'package:fspu/view/widiget/home/unversity.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
  
   Color colorBuilder(int value) => switch (value) {
        0 => Colors.blueAccent,
        1 => Colors.green,
        2 => Colors.orangeAccent,
        _ => Colors.red,
      };

    MyServices myServices=Get.find();
     String userid=myServices.sharedPreferences.getString("gender").toString();
     ActivityControllerImp controllerActivity=Get.put(ActivityControllerImp());
     Get.put(HomeControllerImp());
    GetUniversityControllerImp controlleruniversity=Get.put(GetUniversityControllerImp());
    return SafeArea(
      child: Scaffold(
          appBar:customAppBar(),
          drawer: Drawer(

            child: Column(
              children: [
               
           SizedBox(
         //   width: 200,
            height: 150,
              child: GetBuilder<HomeControllerImp>(builder:(controller)=>
             
             Stack(
             alignment: Alignment.center,
               clipBehavior: Clip.none,
               children: [
               
                 Container(
                  decoration: BoxDecoration(
                  
                      color:controller.positive==true? AppColor.fspucolor:AppColor.fspucolor1,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                 
                 //  height: Get.width/2.2,
                 ),
             
                  Positioned(
             top: 0,
             right: 0,


               child: 
                Container(
                  padding: const EdgeInsets.only(right: 7,top: 7),

                // margin: EdgeInsets.only(bottom: 50),
                 //    color: Colors.amber,
                     height: 100,
                   //  width: 340,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Container(
                        height: 85,
                        child: CircleAvatar(
                         
                          radius: 38,
                          backgroundColor:Colors.white,
                          backgroundImage: AssetImage(
                            userid=="0"?
                            
                            AppImagesasset.wimanuser:AppImagesasset.manuser
                            ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("${myservices.sharedPreferences.getString("username")}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                        const SizedBox(height: 6,),
                       
                       
                        Text("${myServices.sharedPreferences.getString("email")}",style: const TextStyle(fontSize: 13,),),

                      ],)
                     ],),
                   ),)
              
             
               ],
             ))
           ),
const SizedBox(height: 20,),
  Row(children: [
    SizedBox(width: 10,),
    Text("الوضع :",style: TextStyle(fontSize: 20),),
  SizedBox(width: 10,),
  DartLighMode()],)     

              ],
            ),
          ),
          body: GetBuilder<HomeControllerImp>(
              builder: (controller) =>
                  //  HandlingDataView(statusRequest:controller.statusRequest, widget:

                  Container(
                    //  padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const SilderImageHome(),
                  
                        Container(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.fspucolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 10),
                                    height: 120,
                                    width: 80,
                                    child: const Icon(Icons.handshake));
                              }),
                        ),
                     const CardHome(title: 'التبليغات', subtitle: 'عليكم السلام', icons: Icons.message, trailtext: 'باقي يومان',),
                     GetBuilder<ActivityControllerImp>(builder:(controllerA)=>
                     HandlingDataView(statusRequest: controllerA.statusRequest, widget: CardHome(ontap: controller.gotoactivity, 
                      title: 'جدول الاعمال', subtitle: '${controllerA.fersttitle}', icons: Icons.message, trailtext: '${controllerA.datek}',),
                   )
                     ),
               //   
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text("الاحصائيات",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: "Cairo"),
                              textDirection: TextDirection.rtl),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // border: Border.all(color:AppColor.fspucolor)
                          ),
                          child:  const Card(
                            child: Column(
                              children: [
                                // const Divider(),
                                Expanded(
                                  flex: 3,
                                  child: UnversityCostom(title: '',)
                                ),
                                Expanded(
                                    child: MailFamelCostom())
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))),
    );
    //);
  }
}
