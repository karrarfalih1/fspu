import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fspu/controller/home/hall_controller.dart';
import 'package:fspu/controller/map_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/linkapi.dart';
import 'package:fspu/view/widiget/hall_widiget/description_hall_widget.dart';
import 'package:fspu/view/widiget/hall_widiget/gridview_hall_widget.dart';
import 'package:fspu/view/widiget/hall_widiget/prichat_widget.dart';
import 'package:fspu/view/widiget/titlerighit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(Object context) {
   HallControllerImp controller= Get.put(HallControllerImp());
    MapControllerImp controllermap=Get.put(MapControllerImp());
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: PageView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    child: Image.network(
                      "${Applink.imageslider}/hand.jpg",
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
          const Divider(),
          const PrichatWidget(),
          const Divider(
            endIndent: 150,
          ),
           InkWell(
            onTap: (){
                controllermap.titlelocation="بغداد / العامرية";
                controllermap.lang=controller.myhalldata.isNotEmpty?double.parse(controller.myhalldata[0]['hall_langtude']) :33.2;
                  controllermap.lat=controller.myhalldata.isNotEmpty?double.parse(controller.myhalldata[0]['hall_latitude']):33.2;       
                controllermap.showmap();
            },
             child: const Card(
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text("الموقع"),
                subtitle: Text("بغداد /الكرادة/قرب جامع الابرار"),
                trailing: Text(
                    "اظهر على الخريطة",
                    style: TextStyle(color: AppColor.fspucolor),
                  ),
                
              ),
                       ),
           ),
          const Titlerighit(title: "المواصفات"),
          GridviewHallWidget(),
          const Titlerighit(
            title: "الوصف ",
          ),
          const DescriptionHallWidget(),
          const Titlerighit(
            title: 'الاوقات المحجوزة',
          ),
          Card(
              child:  ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children:const [
               ListTile(
                title: Text("كرار فالح فاخر"),
                subtitle: Text("من 11:30 ص الى 200 م "),
                trailing: Text("2025/2/6"),
              ),
               ListTile(
                title: Text("كرار فالح فاخر"),
                subtitle: Text("من 11:30 ص الى 200 م "),
                trailing: Text("2025/2/6"),
              )
            ],
          )),
      
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

 