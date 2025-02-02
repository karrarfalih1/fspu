
import 'package:flutter/material.dart';
import 'package:fspu/view/screen/cart/about_as.dart';
import 'package:fspu/view/screen/cart/boist.dart';
import 'package:get/get.dart';

abstract class CartContrller extends GetxController{
chosecart(index);
}
class CartContrllerImp extends CartContrller{
List<Widget> page=[
  const AboutAs(),
  const Boistview(),
   const Boistview(),
    const Boistview(),
     const Boistview(),
 
];
List datacart=[
  {"icon":Icons.group,
  "title":"من نحن "},
  
  {"icon":Icons.monetization_on,
  "title":"نقاطي"},
  
  {"icon":Icons.poll,
  "title":"استبيانات"},
  
  {"icon":Icons.volunteer_activism,
  "title":"ادعمنا",},
   {"icon":Icons.lightbulb,
  "title":"اقترح نشاط"},

];
@override
  chosecart(index){
Get.to( ()=> page[index]);
update();
}
}