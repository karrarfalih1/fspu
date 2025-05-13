
import 'package:flutter/material.dart';
import 'package:fspu/core/constantk/imagesasset.dart';
import 'package:fspu/view/screen/cart/about_as.dart';
import 'package:fspu/view/screen/cart/boist.dart';
import 'package:fspu/view/screen/cart/poll.dart';
import 'package:fspu/view/screen/cart/suggestactivityview.dart';
import 'package:fspu/view/screen/cart/support.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

abstract class CartContrller extends GetxController{
chosecart(index);
}
class CartContrllerImp extends CartContrller{
List<Widget> page=[
   const AboutAs(),
   const Boistview(),
   const Pollview(),
   
   const Suggestactivityview(),
   const Supportview(),
     
 
];
List datacart=[
  {"icon":AppImagesasset.users,
  "title":"من نحن "},
  
  {"icon":AppImagesasset.point,
  "title":"نقاطي"},
  
  {"icon":AppImagesasset.ast,
  "title":"استبيانات"},
     {"icon":AppImagesasset.ak,
  "title":"اقترح نشاط"},
  {"icon":AppImagesasset.hand,
  "title":"ادعمنا",},


];
@override
  chosecart(index){
Get.to( ()=> page[index]);
update();
}
}