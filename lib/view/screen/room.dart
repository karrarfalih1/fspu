
import 'package:flutter/material.dart';
import 'package:fspu/controller/home/hall_controller.dart';
import 'package:fspu/controller/map_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/view/widiget/hall_widiget/description_hall_widget.dart';
import 'package:fspu/view/widiget/hall_widiget/gridview_hall_widget.dart';
import 'package:fspu/view/widiget/hall_widiget/image_hall_widget.dart';
import 'package:fspu/view/widiget/hall_widiget/listdate_hall_widget.dart';
import 'package:fspu/view/widiget/hall_widiget/prichat_widget.dart';
import 'package:fspu/view/widiget/titlerighit.dart';
import 'package:get/get.dart';

class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(Object context) {
Get.put(HallControllerImp());
    MapControllerImp controllermap = Get.put(MapControllerImp());
    return SafeArea(child: Scaffold(
       

      body: GetBuilder<HallControllerImp>(builder:(controller)=>
    HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(
        children: [
          const  ImageHallWidget(),
          const Divider(),
          const PrichatWidget(),
          const Divider(
            endIndent: 150,
          ),
          InkWell(
            onTap: () {
             // controllermap.titlelocation =controller.myhalldata.isNotEmpty?controller.myhalldata[0]['hall_location']:" ";
            ////  controllermap.lang = controller.myhalldata.isNotEmpty
            //      ? double.parse(controller.myhalldata[0]['hall_langtude'])
           //       : 33.2;
           ////   controllermap.lat = controller.myhalldata.isNotEmpty
               //   ? double.parse(controller.myhalldata[0]['hall_latitude'])
            //      : 33.2;
              controllermap.showmap( double.parse(controller.myhalldata[0]['hall_latitude']), double.parse(controller.myhalldata[0]['hall_langtude'])
          ,   controller.myhalldata[0]['hall_location'] );
            },
            child:  Card(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text("الموقع"),
                subtitle: Text("${controller.myhalldata.isNotEmpty?controller.myhalldata[0]['hall_location']:""}"),
                trailing: const Text(
                  "اظهر على الخريطة",
                  style:  TextStyle(color: AppColor.fspucolor),
                ),
              ),
            ),
          ),
          const Titlerighit(title: "المواصفات"),
          const GridviewHallWidget(),
          const Titlerighit(
            title: "الوصف ",
          ),
          const DescriptionHallWidget(),
          const Titlerighit(
            title: 'الاوقات المحجوزة',
          ),
   
     ListdateHallWidget()
    ,const SizedBox(height: 10,)
        ],
      ),))
    ));
  }
}
