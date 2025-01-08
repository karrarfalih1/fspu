import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:fspu/controller/onboarding_controller.dart';
import 'package:fspu/core/localizationk/changelocal.dart';
import 'package:fspu/view/widiget/onboarding/custombutton.dart';
import 'package:fspu/view/widiget/onboarding/customslider.dart';
import 'package:fspu/view/widiget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
Get.put(LocaleController());
    //عملنا حقن  حتى نكدر نوصل للمتحكم 
    Get.put(OnboardingControllerImp());
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 3,
          // height: 700,
          child: CustomSliderOnBoarding()
        ),
        Expanded(
          flex: 1,
          child: Column( 
            children: [
               DotcontrollerOnBoarding(),
              Spacer( flex: 2,),
                CustombuttonOnBoarding(),
             
            ],
          ),
        )
      ],
    )));
  }
}
