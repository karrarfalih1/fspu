
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fspu/view/widiget/home/drower_costam.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/activity_controller.dart';
import 'package:fspu/controller/home_controller.dart';
import 'package:fspu/controller/university/university_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/servicesk/services.dart';
import 'package:fspu/view/widiget/appbar.dart';
import 'package:fspu/view/widiget/home/card_home.dart';
import 'package:fspu/view/widiget/home/mail_famel_costom.dart';
import 'package:fspu/view/widiget/home/silder_image_home.dart';
import 'package:fspu/view/widiget/home/unversity.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
  

    MyServices myServices=Get.find();
     String userid=myServices.sharedPreferences.getString("gender").toString();
     ActivityControllerImp controllerActivity=Get.put(ActivityControllerImp());
     Get.put(HomeControllerImp());
    GetUniversityControllerImp controlleruniversity=Get.put(GetUniversityControllerImp());
    return SafeArea(
      child: Scaffold(
          appBar:customAppBar(),
          drawer: Drawer(

            child:DrowerCostam()
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
                     const CardHome(title: 'التبليغات', subtitle: 'على الاعضاء التوجه  للمقر الرئيسي', icons: Icons.message, trailtext: '2025-1-2',),
                     GetBuilder<ActivityControllerImp>(builder:(controllerA)=>
                     HandlingDataView(statusRequest: controllerA.statusRequest, widget: CardHome(ontap: controller.gotoactivity, 
                      title: 'جدول الاعمال', subtitle: '${controllerA.fersttitle}', icons: Icons.message, trailtext: '${controllerA.datek}',),
                   )
                     ),
               //   
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
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
                           
                          ),
                          child:  const Card(
                            child: Column(
                              children: [
                             
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
