import 'package:flutter/material.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/data/datasource/fspudata/halldata.dart';
import 'package:get/get.dart';

abstract class HallController extends GetxController {
  
}

class HallControllerImp extends HallController {
  StatusRequest statusRequest=StatusRequest.none;
  Halldata halldata =Halldata(Get.find());
  List myhalldata=[];
      
  List detels = [
    {"title": "المساحة", "icon": Icons.straighten,
    "namehall":"hall_size"
   },
    {"title": "المقاعد", "icon": Icons.chair,"namehall":"hall_chair"},
    {"title": "الطاولات", "icon": Icons.deck,  "namehall":"hall_taple"},
    {"title": "مايك", "icon": Icons.mic,  "namehall":"hall_mic"},
    {"title": "مكبرات", "icon": Icons.speaker,  "namehall":"hall_spekers"},
    {"title": "WC", "icon": Icons.wc,  "namehall":"hall_wc"},
    {"title": "مطبخ", "icon": Icons.restaurant,  "namehall":"hall_ktichin"},
    {"title": "مكتب", "icon": Icons.desk,  "namehall":"hall_desk"},
    {"title": "ستوديو", "icon": Icons.videocam,  "namehall":"hall_studio"}
  ];


  @override
  void onInit() {
    if(myhalldata.isEmpty){
    gethalldetels();
    }
    else{
      statusRequest=StatusRequest.success;
    }
   
    super.onInit();
  }
  

  gethalldetels()async{
    statusRequest=StatusRequest.loading;
    update();
    var response =await halldata.halldata();
    statusRequest=handleingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
     myhalldata.addAll(response['data']);
      }else{
          statusRequest=StatusRequest.failure;
      }
    }
    update();
  }
}
