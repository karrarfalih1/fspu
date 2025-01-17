import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/constantk/imagesasset.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:fspu/linkapi.dart';

class SilderImageHome extends GetView<HomeControllerImp> {
 
  const SilderImageHome({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeControllerImp>(builder: (controller)=>
    Stack(
    children: [
     
      Container( 
      
        
         height: 260,
                          //  margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: HandlingDataView(statusRequest: controller.statusRequest, widget: 
                      PageView.builder(
                              controller: controller.pageController,
                              itemCount: controller.data.length,
                              onPageChanged: (index) {
                                controller.currenPage.value = index;
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return ClipRRect(
                                  borderRadius:const BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                     bottomLeft: Radius.circular(20)
                                  ),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      imageUrl:
                                          "${Applink.imageslider}/${controller.data[index]["slider_iamge"]}"),
                                );
                              },
                            ),      )
                          ),
                           Positioned(child: Container(
        width: Get.width,
        height: 50,
       // color: Colors.amber,
       child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           
          IconButton(onPressed:(){controller.scaffoldkey.currentState!.openDrawer();}, icon: const Icon(

            Icons.menu,size: 35,color:AppColor.fspucolor,)),
            const Spacer(),
          InkWell(
          onTap: (){

          },
          child: Image.asset(AppImagesasset.fspulogo1)),
       ],),
          
      )),
    ],
    ));
  }
}
