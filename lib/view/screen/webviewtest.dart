import 'package:flutter/material.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:fspu/controller/webview_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/constantk/imagesasset.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewtest extends StatelessWidget{
  
  WebViewControllerImp controller =Get.put(WebViewControllerImp());

  Webviewtest({super.key});
  @override
  Widget build(BuildContext context) {
    
   return SafeArea(child: Scaffold(
    appBar: AppBar(
   //   backgroundColor: AppColor.fspucolortwo,
    
      title: SizedBox(height: 55, child: Image.asset(AppImagesasset.fspulogo1))
    ,centerTitle: true,),

    body: Container(child:   WebViewWidget(
      controller:controller.controller_webview[controller.selet_webview!],
    ),)
   ));
  }

}