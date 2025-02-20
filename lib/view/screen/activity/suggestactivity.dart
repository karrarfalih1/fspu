
import 'package:flutter/material.dart';
import 'package:fspu/controller/publesh/suggestactivity_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/view/widiget/activity/datepublishactivity.dart';
import 'package:fspu/view/widiget/activity/publishactivity.dart';
import 'package:get/get.dart';

class Suggestactivity extends StatelessWidget {
  const Suggestactivity({super.key});
  @override
  Widget build(BuildContext context) {
    SuggestactivityControllerImp controller =
        Get.put(SuggestactivityControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.fspucolor,
        title: Text(
          "اقترح نشاط",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Form(
        key:  controller.formstateactivity,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
           Publishactivity(
            title: "عنوان النشاط",
            mycontroller:controller.activity_title, ),
           Publishactivity(title: "نبذة عن النشاط", mycontroller:  controller.activity_disc),

 const Datepublishactivity(),


            Publishactivity(title: "الموقع ", mycontroller: controller.activity_location,),
            GetBuilder<SuggestactivityControllerImp>(builder: (controller)=>
                  InkWell(
                onTap: () {
                  controller.gotomapscrenn();
                },
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 100,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "الموقع على الخريطة ",
                          style:  TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        controller.shoosmaplocation!?const Text("تم تحديد الموقع بنجاح",style: TextStyle(color: AppColor.fspucolor),):
                       const Text("عليك تحديد الموقع على الخريطة",style: TextStyle(color: Colors.red),)
                      ],
                    ),
                  ),
                ),
              ),
            )
        ,
              GetBuilder<SuggestactivityControllerImp>(builder: (controller)=>
                 Card(
                child: SwitchListTile(
                  subtitle: Text(controller.publec?"عام":"خاص"),
                  activeColor: AppColor.fspucolor,
                  onChanged: (myval) {
                    controller.onChangedpublic();
                    
              controller.publec=myval;},
                  title:const Text("حالة المنشور"), value: controller.publec,
                  ),
              ),
              )
           ,
         Publishactivity(title: "الجهة المنفذة", mycontroller: controller.activity_grob,),
              InkWell(
                onTap: () {
                  if(controller.formstateactivity.currentState!.validate() && controller.shoosmaplocation!){
                   Get.back();
                  controller.addnewactivity();
                  }
                
                },
                child: const Card(
                  child: SizedBox(

                    width:  50,
                    height: 50,
                    child: Center(child: Text("نشر النشاط",style: TextStyle(fontSize: 20,color: AppColor.fspucolor,fontWeight: FontWeight.bold),),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
