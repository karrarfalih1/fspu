
import 'package:flutter/material.dart';
import 'package:fspu/controller/webview_controller.dart';
import 'package:fspu/core/constantk/imagesasset.dart';
import 'package:fspu/view/screen/webviewtest.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Webviewlist extends StatelessWidget{
  WebViewControllerImp controller =Get.put(WebViewControllerImp());

  Webviewlist({super.key});
  @override
  Widget build(BuildContext context) {
   return       SizedBox(
             //   color: Colors.amber,
                height: 170,width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:controller.webview_data.length ,
                  
                  itemBuilder:(context,index){
                    return   Card(
                    child: InkWell(
                      onTap: (){
                        controller.selet_webview=index;
                        Get.to(Webviewtest());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
               //   color: Colors.red,
                        width: 120,
                        child: Column(children: [
                          Image.asset(controller.webview_data[index]['image'],height: 90,),
                            Text("${controller.webview_data[index]['title']}",textAlign: TextAlign.center,) 
                        ],),
                      ),
                    ),
                  ) ;
                  }),
                );
  }

}