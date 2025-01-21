
import 'package:flutter/material.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/constantk/imagesasset.dart';
import 'package:fspu/core/constantk/routesname.dart';
import 'package:fspu/view/screen/webviewtest.dart';
import 'package:fspu/view/widiget/home/cart_home.dart';
import 'package:fspu/view/widiget/home/drower_costam.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/activity_controller.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:fspu/controller/university/university_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/core/servicesk/services.dart';
import 'package:fspu/view/widiget/appbar.dart';
import 'package:fspu/view/widiget/home/card_home.dart';
import 'package:fspu/view/widiget/home/mail_famel_costom.dart';
import 'package:fspu/view/widiget/home/silder_image_home.dart';
import 'package:fspu/view/widiget/home/unversity.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

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
                Container(height: 100,
                child:     GetBuilder<ActivityControllerImp>(builder:(controllerA)=>
                     HandlingDataView(statusRequest: controllerA.statusRequest, widget: CardHome(ontap: controller.gotoactivity, 
                      title: 'جدول الاعمال', subtitle: '${controllerA.fersttitle}', icons: Icons.date_range, trailtext: '${controllerA.datek}',),
                   )
                     ),),
                     InkWell( child: CardHome(title: 'حجز القاعات ', subtitle: 'تتوفر قاعات  كبيرة للحجز', icons: Icons.domain
                     , trailtext: 'متوفر',)),
                   Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    child: Text("المواقع الرسمية",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColor.fspucolor),)),
               Container(
             //   color: Colors.amber,
                height: 170,width: double.infinity,
                child: ListView(
                scrollDirection: Axis.horizontal,
                  children: [
                   Card(
                    child: InkWell(
                      onTap: (){
                        Get.to(Webviewtest());
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                                         //   color: Colors.red,
                        width: 120,
                        child: Column(children: [
                          Image.asset(AppImagesasset.osara1,height: 90,),
                           Text("وزارة التعليم العالي  والبحث العلمي",textAlign: TextAlign.center,) 
                        ],),
                      ),
                    ),
                  )   ,        Card(
                    child: Container(
                      padding: EdgeInsets.all(3),
                   //   color: Colors.red,
                      width: 120,
                      child: Column(children: [
                        Image.asset(AppImagesasset.osara1,height: 90,),
                         Text("وزارة التعليم العالي  والبحث العلمي",textAlign: TextAlign.center,) 
                      ],),
                    ),
                  )   ,        Card(
                    child: Container(
                      padding: EdgeInsets.all(3),
                   //   color: Colors.red,
                      width: 120,
                      child: Column(children: [
                        Image.asset(AppImagesasset.osara1,height: 90,),
                         Text("وزارة التعليم العالي  والبحث العلمي",textAlign: TextAlign.center,) 
                      ],),
                    ),
                  )   ,        Card(
                    child: Container(
                      padding: EdgeInsets.all(3),
                   //   color: Colors.red,
                      width: 120,
                      child: Column(children: [
                        Image.asset(AppImagesasset.osara1,height: 90,),
                         Text("وزارة التعليم العالي  والبحث العلمي",textAlign: TextAlign.center,) 
                      ],),
                    ),
                  )   ,        Card(
                    child: Container(
                      padding: EdgeInsets.all(3),
                   //   color: Colors.red,
                      width: 120,
                      child: Column(children: [
                        Image.asset(AppImagesasset.osara1,height: 90,),
                         Text("وزارة التعليم العالي  والبحث العلمي",textAlign: TextAlign.center,) 
                      ],),
                    ),
                  )          ],),
                ),
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
