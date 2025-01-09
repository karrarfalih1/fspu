
import 'package:flutter/material.dart';
import 'package:fspu/controller/home_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/constantk/imagesasset.dart';
import 'package:fspu/core/servicesk/services.dart';
import 'package:fspu/view/widiget/dart_ligh_mode.dart';
import 'package:get/get.dart';

class DrowerCostam extends GetView<HomeControllerImp>{
  get userid => null;

  @override
  Widget build(BuildContext context) {
    MyServices  myServices=Get.find();
           return Column(
              children: [
               
           SizedBox(
         //   width: 200,
            height: 150,
              child: GetBuilder<HomeControllerImp>(builder:(controller)=>
             
             Stack(
             alignment: Alignment.center,
               clipBehavior: Clip.none,
               children: [
               
                 Container(
                  decoration: BoxDecoration(
                  
                      color:controller.positive==true? AppColor.fspucolor:AppColor.fspucolor1,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                 
                 //  height: Get.width/2.2,
                 ),
             
                  Positioned(
             top: 0,
             right: 0,


               child: 
                Container(
                  padding: const EdgeInsets.only(right: 7,top: 7),

                // margin: EdgeInsets.only(bottom: 50),
                 //    color: Colors.amber,
                     height: 100,
                   //  width: 340,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      SizedBox(
                        height: 85,
                        child: CircleAvatar(
                         
                          radius: 38,
                          backgroundColor:Colors.white,
                          backgroundImage: AssetImage(
                            userid=="0"?
                            
                            AppImagesasset.wimanuser:AppImagesasset.manuser
                            ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("${myservices.sharedPreferences.getString("username")}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                        const SizedBox(height: 6,),
                       
                       
                        Text("${myServices.sharedPreferences.getString("email")}",style: const TextStyle(fontSize: 13,),),

                      ],)
                     ],),
                   ),)
              
             
               ],
             ))
           ),
const SizedBox(height: 20,),
  Row(children: [
    SizedBox(width: 10,),
    Text("الوضع :",style: TextStyle(fontSize: 20),),
  SizedBox(width: 10,),
  DartLighMode()],)     

              ],
            );
           
            }}