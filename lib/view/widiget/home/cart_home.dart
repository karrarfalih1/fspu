import 'package:flutter/material.dart';
import 'package:fspu/controller/home/cart_contrller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:get/get.dart';

class CartHome extends GetView<CartContrllerImp>{
  const CartHome({super.key});

  @override
  Widget build(BuildContext context) {
    CartContrllerImp controller =Get.put(CartContrllerImp());
    return       SizedBox(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.datacart.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.fspucolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 10),
                                    height: 120,
                                    width: 80,
                                    child: InkWell(
                                      onTap: (){
                                        if(index>1){
                                          Get.defaultDialog(
                                            title: "تنبيه ",
                                            middleText: "لم يكتمل"
                                          );
                                        }else{
                                           controller.chosecart(index);
                                        }
                                  
                                        
                                      },
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                           Icon(controller.datacart[index]['icon'],color: AppColor.fspucolortwo,),
                                           Text("${controller.datacart[index]['title']}",style: TextStyle(color:  AppColor.fspucolortwo,fontWeight: FontWeight.bold,fontSize: 13),)
                                        ],),
                                      ),
                                    ));
                              }),
                        );
  }

}