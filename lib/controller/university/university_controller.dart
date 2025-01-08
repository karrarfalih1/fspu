 
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/constantk/routesname.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/core/servicesk/services.dart';
import 'package:fspu/data/datasource/fspudata/university.dart';
import 'package:fspu/data/datasource/remote/auth/login.dart';

abstract class GetUniversityController extends  GetxController{
  login();

}
class GetUniversityControllerImp extends GetUniversityController{
  
  GetUniversity getUniversity= GetUniversity(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  String? select_un;
  List alldata=[];
  List<String> data=[];
  @override
  void onInit() {
    select_un="non";
    login();
    // TODO: implement onInit
    super.onInit();
  }
 up(){
  update();
 }
  login() async{ 
    statusRequest=StatusRequest.loading;
    update();
    var response=await getUniversity.getcount();
    statusRequest=handleingData(response);
    if(StatusRequest.success==statusRequest){

    alldata.addAll(response['data']);
    data=(response['data'] as List).map((item)=>item['university_name']as String).toList();
    update();
    }else{
      statusRequest=StatusRequest.failure;
      update();
    }
    }




  }
  
