import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:fspu/linkapi.dart';

class SilderImageHome extends GetView<HomeControllerImp> {
 
  const SilderImageHome({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeControllerImp>(builder: (controller)=>
    Container( 

      
       height: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: HandlingDataView(statusRequest: controller.statusRequest, widget: 
                    PageView.builder(
                            controller: controller.pageController,
                            itemCount: controller.data.length,
                            onPageChanged: (index) {
                              controller.currenPage.value = index;
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    imageUrl:
                                        "${Applink.imageslider}/${controller.data[index]["slider_iamge"]}"),
                              );
                            },
                          ),      )
                        ));
  }
}
