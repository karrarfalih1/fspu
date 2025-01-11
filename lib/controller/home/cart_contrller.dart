
import 'package:flutter/material.dart';
import 'package:fspu/view/screen/activity/activity.dart';
import 'package:fspu/view/screen/cart/about_as.dart';
import 'package:get/get.dart';

abstract class CartContrller extends GetxController{
chosecart(index);
}
class CartContrllerImp extends CartContrller{
List<Widget> page=[
  AboutAs(),
  Activity()

];
List datacart=[
  {"icon":Icons.group,
  "title":"من نحن "},
  
  {"icon":Icons.safety_check,
  "title":"ادعمنا"},
  
  {"icon":Icons.article,
  "title":"رسالتنا"},
  
  {"icon":Icons.person,
  "title":"من نحن"},

];
chosecart(index){
Get.to(page[index]);
update();
}
}