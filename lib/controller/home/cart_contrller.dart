
import 'package:flutter/material.dart';
import 'package:fspu/view/screen/activity/activity.dart';
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
  const Activity()

];
List datacart=[
  {"icon":Icons.group,
  "title":"من نحن "},
  
  {"icon":Icons.monetization_on,
  "title":"نقاطي"},
  
  {"icon":Icons.article,
  "title":"رسالتنا"},
  
  {"icon":Icons.person,
  "title":"من نحن"},

];
@override
  chosecart(index){
Get.to( ()=> page[index]);
update();
}
}