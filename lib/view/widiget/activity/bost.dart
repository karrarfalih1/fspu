import 'package:flutter/material.dart';
import 'package:fspu/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fspu/controller/activity_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/data/model/activitymodel.dart';

class BostActivity extends GetView<ActivityControllerImp> {
  ActivityModel activityModel;
  BostActivity({super.key,required this.activityModel});
  @override
  Widget build(BuildContext context) {
    DateTime parsedDate=DateTime.parse(activityModel.activityDate.toString());
    DateTime currentDate=DateTime.now();
    DateTime justdatyfuter=DateTime(parsedDate.year,parsedDate.month,parsedDate.day);
    
    DateTime justdatynow=DateTime(currentDate.year,currentDate.month,currentDate.day);
    int remainigDays=justdatyfuter.difference(justdatynow).inDays;

    String datek=DateFormat('yyyy-MM-dd').format(parsedDate);
   
    String timek=DateFormat('hh-mm a').format(parsedDate);
        return GetBuilder<ActivityControllerImp>(builder: (controller)=>
        Container(
    margin:const EdgeInsets.only(bottom: 15),
    
         
         width: double.infinity,
      height: 500,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
     //     mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 2,
              child: ListTile(
              title: Text("${activityModel.activityTitle}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColor.fspucolor,),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text("${activityModel.activityDisc}")),

            )),
            
              Expanded(
              flex: 3,
                child:Container(
              //    padding: EdgeInsets.all(15),
                  child: Column(children: [
                 
                        ListTile(
                      title: const Text("التاريخ",style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Row(children:[ Text(datek),Container(
                        width: 70,
                        height: 20,
                        
                        decoration: BoxDecoration(
                          color: AppColor.fspucolor1,
                          //color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)
                        ),
                        margin: const EdgeInsets.only(right: 5),
                      //  padding: EdgeInsets.symmetric(horizontal: 5)
                     
                      child: Center(child: Text(timek,style: const TextStyle(fontFamily: "snas",color: Colors.black),)),
                        )]),
                      leading: const Icon(Icons.date_range,
                      color: AppColor.fspucolor,
                      
                     ),
                     trailing: Container(
                      padding: const EdgeInsets.only(top: 9),
                    child: remainigDays==0?Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 148, 142),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text("نشط الان",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)):
                    Text("باقي $remainigDays يوم",style: const TextStyle(fontWeight: FontWeight.bold)),
                     ),),
                   ListTile(
                      title: const Text("الموقع",style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("${activityModel.activityLocation}"),
                      leading: const Icon(Icons.location_on,
                      color: AppColor.fspucolor,
                     ),),
                     SizedBox(
                      height: 50,
                    //  color: Colors.red,
                      width: double.infinity,
                       child: Row(children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                               margin: const EdgeInsets.symmetric(horizontal: 20),
                               
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              color: AppColor.fspucolor1,
                              borderRadius: BorderRadius.circular(10),
                             
                            ),
                            
                             child:const Center(child: Text("تفعيل الكود",style: TextStyle( color: Colors.black,fontWeight: FontWeight.bold),)))),
                         //    Spacer(),
                                 Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  height: 40,
                                  width: 100,
                                   child:TextField(
                                      
                                      keyboardType:TextInputType.phone,
                                           onChanged: (value) {
                                             (() {
                                              print(value);
                                              // تحديث النص عند التغيير
                                             });
                                           },//textAlign: TextAlign.end,
                                           
                                           decoration: InputDecoration(
                                            
                                                hintText: "كود النشاط",
                                          hintStyle: const TextStyle(fontSize: 14,),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(color: AppColor.fspucolor)
                                            ),
                                         //   enabledBorder:InputBorder,
                                             border: const OutlineInputBorder(borderSide:BorderSide(
                                              
                                              
                                              color: AppColor.fspucolor)),
                                             
                                           ),
                                         ),
                                  
                                 ),
                       ],),
                     ),
                     const Spacer(),
                     InkWell(
                      onTap: (){
                        if(controller.isSelect[activityModel.activityId]==0){
                          controller.setActivity(activityModel.activityId, 1);
                           controller.addactivity(activityModel.activityId.toString());
                        }else{
                          Get.defaultDialog(
                            title: "تنبيه",
                            titleStyle: TextStyle(color:  AppColor.fspucolortwo),
                            middleText: "هل انت متاكد من حذف اسمك من هذا النشاط؟",
                            actions: [
                              ElevatedButton(onPressed:(){
  controller.setActivity(activityModel.activityId, 0);
                    controller.deletactivity(activityModel.activityId.toString());
                 Get.back();
                              }, child:const Text("نعم",)),
                             SizedBox(width: 40,),
                                 ElevatedButton(onPressed:(){  Get.back();}, child:const Text("لا"))
                      
                            ]
                          );
                               };
                      },
                       child: Container(
                                           padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 70,
                        width: double.infinity,
                        child:  Card(color:controller.isSelect[activityModel.activityId]==0? AppColor.fspucolor:AppColor.fspucolortwo,
                        child:  Center(child: Text(controller.isSelect[activityModel.activityId]==0? "اضغط هنا لتسجيل  اسمك":"الغاء النشاط",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                       
                        ),),
                     ),const SizedBox(height: 10,)
                  ],),
                ) )
          ],)))
        );

      
  }
}

