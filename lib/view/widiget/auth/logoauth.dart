
import 'package:flutter/material.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/constantk/imagesasset.dart';

class CustomLogoAuth extends StatelessWidget {
  
  const CustomLogoAuth({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      width: 100,
      height: 100,
      decoration: BoxDecoration(

        color: AppColor.fspucolor,
        borderRadius: BorderRadius.circular(100)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        
        child: Image.asset(AppImagesasset.fspulogo,width: 80,height: 80,)),
    );
  
  }
}