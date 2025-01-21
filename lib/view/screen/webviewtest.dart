import 'package:flutter/material.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewtest extends GetView<HomeControllerImp>{
  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
    appBar: AppBar(title: Text("FSPU"),centerTitle: true,),

    body: Container(child:   WebViewWidget(
      controller:controller.controller_webview,

    ),)
   );
  }

}