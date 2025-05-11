import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/screen_singup_controller.dart';
import 'package:fspu/core/constantk/color.dart';

class SingupScreen extends StatelessWidget{
  const SingupScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
   ScreenSingupControllerImp controller= Get.put(ScreenSingupControllerImp());

  return Scaffold(
    appBar: AppBar(backgroundColor: Colors.grey,
      toolbarHeight:1),
  bottomNavigationBar:  Container(
      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
             Expanded(child:InkWell(
              onTap: (){
                controller.stepCancel();
              },
               child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                   color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
               
                width: double.infinity,
                child: const Center(child: Text("رجوع",style: TextStyle(fontSize: 20,color: Colors.white),),),
                 
               ),
             )),
          
         Expanded(child:InkWell(
              onTap: (){
                controller.stepContinue();
              },
               child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
               
                   color: AppColor.fspucolor,
                  borderRadius: BorderRadius.circular(10)
                ),
               
                width: double.infinity,
                child: const Center(child: Text("تقدم",style: TextStyle(fontSize: 20,color: Colors.white),),),
                 
               ),
             )),
       
        ],
      ),
    ),
   // backgroundColor: Colors.red,

body: Container(child: GetBuilder<ScreenSingupControllerImp>(builder: (controller)=>
Theme(
  
  data: Theme.of(context).copyWith(
   visualDensity: VisualDensity.compact,
   
    colorScheme:const ColorScheme.light(primary: AppColor.fspucolor),
  ),
  child: Stepper(
    
    type: StepperType.horizontal,
    steps: controller.Stepsk,
    currentStep: controller.currentStep,
   
    onStepCancel: (){
      controller.stepCancel();
    },
     controlsBuilder: (BuildContext context, ControlsDetails details) {
        // إرجاع ويدجيت فارغ لإزالة الأزرار
        return const SizedBox.shrink();
      },
    ),
),),)
  
  );
 
  }

}