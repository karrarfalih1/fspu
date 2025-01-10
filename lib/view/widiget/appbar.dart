import 'package:flutter/material.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/constantk/imagesasset.dart';
import 'package:get/get.dart';

PreferredSizeWidget customAppBar( ) {
  HomeControllerImp controller=Get.find();
  return  AppBar(
            toolbarHeight: 60,
    title: const Text("100",style: TextStyle(color: Colors.white),),
            backgroundColor: AppColor.fspucolor,
            actions: [
         const     SizedBox(width: 10,),
               const Text(
                "FSPU",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: "PlayfairDisplay"),
              ),
              Image.asset(
                AppImagesasset.fspulogo,
                fit: BoxFit.cover,
              //  height: 60,
              ),
             const SizedBox(width: 10,),
            ],
          );
}
