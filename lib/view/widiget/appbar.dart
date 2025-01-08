import 'package:flutter/material.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/constantk/imagesasset.dart';

PreferredSizeWidget customAppBar( ) {
  return  AppBar(
            toolbarHeight: 60,
    
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
             SizedBox(width: 10,),
            ],
          );
}
