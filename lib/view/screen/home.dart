
import 'package:flutter/material.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/constantk/routesname.dart';
import 'package:fspu/view/widiget/home/cart_home.dart';
import 'package:fspu/view/widiget/home/drower_costam.dart';
import 'package:fspu/view/widiget/home/webviewlist.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/activity_controller.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:fspu/controller/university/university_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/view/widiget/home/card_home.dart';
import 'package:fspu/view/widiget/home/mail_famel_costom.dart';
import 'package:fspu/view/widiget/home/silder_image_home.dart';
import 'package:fspu/view/widiget/home/unversity.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
  

   
  
  Get.put(ActivityControllerImp());
    HomeControllerImp controllerhome= Get.put(HomeControllerImp());
Get.put(GetUniversityControllerImp());
    return SafeArea(
      child: Scaffold(
        key:controllerhome.scaffoldkey ,
        //  appBar:customAppBar(),
          drawer: const Drawer(

            child:DrowerCostam()
               ),
          body: GetBuilder<HomeControllerImp>(
              builder: (controller) =>
                  //  HandlingDataView(statusRequest:controller.statusRequest, widget:

                  Container(
                    //  padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [
                       
                        const SilderImageHome(),
                  const CartHome(),
                SizedBox(height: 100,
                child:     GetBuilder<ActivityControllerImp>(builder:(controllerA)=>
                     HandlingDataView(statusRequest: controllerA.statusRequest, widget: CardHome(ontap: controller.gotoactivity, 
                      title: 'جدول الاعمال', subtitle: '${controllerA.fersttitle}', icons: Icons.date_range, trailtext: '${controllerA.datek}',),
                   )
                     ),),
                      InkWell(
                      onTap: (){
Get.toNamed(Approute.roomView);
                      },
                       child:const CardHome(title: 'حجز القاعات ', subtitle: 'تتوفر قاعات  كبيرة للحجز', icons: Icons.domain
                     , trailtext: 'متوفر',)),
                   Container(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    child: const Text("المواقع الرسمية",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColor.fspucolor),)),
         Webviewlist(),
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
                                  child: UnversityCostom()
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
