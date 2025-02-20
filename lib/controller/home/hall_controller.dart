import 'package:flutter/material.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/data/datasource/fspudata/halldata.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class HallController extends GetxController {}

class HallControllerImp extends HallController {
  StatusRequest statusRequest = StatusRequest.none;
    StatusRequest statusRequestimage = StatusRequest.none;
     StatusRequest statusRequestresrvation = StatusRequest.none;
  Halldata halldata = Halldata(Get.find());
  List myhalldata = [];
List hallimagelist=[];

List hallreservationlist=[];
  List detels = [
    {"title": "المساحة", "icon": Icons.straighten, "namehall": "hall_size"},
    {"title": "المقاعد", "icon": Icons.chair, "namehall": "hall_chair"},
    {"title": "الطاولات", "icon": Icons.deck, "namehall": "hall_taple"},
    {"title": "مايك", "icon": Icons.mic, "namehall": "hall_mic"},
    {"title": "مكبرات", "icon": Icons.speaker, "namehall": "hall_spekers"},
    {"title": "WC", "icon": Icons.wc, "namehall": "hall_wc"},
    {"title": "مطبخ", "icon": Icons.restaurant, "namehall": "hall_ktichin"},
    {"title": "مكتب", "icon": Icons.desk, "namehall": "hall_desk"},
    {"title": "ستوديو", "icon": Icons.videocam, "namehall": "hall_studio"}
  ];

  @override
  void onInit() {
    if (myhalldata.isEmpty) {
       gethalldetelsimage() ;
      gethalldetels();
          gethallreservation();
    } else {
      statusRequest = StatusRequest.success;
    }

    super.onInit();
  }
Future<void> makePhoneCall(String phoneNumber) async {
  final Uri url = Uri.parse('tel:$phoneNumber');

  try {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } catch (e) {
    print('❌ خطأ أثناء محاولة فتح تطبيق الاتصال: $e');
  }
}
  gethalldetels() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await halldata.halldata();
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        myhalldata.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  gethalldetelsimage() async {
    statusRequestimage = StatusRequest.loading;
    update();
    var response = await halldata.halldataimage();
    statusRequestimage = handleingData(response);
    if (StatusRequest.success == statusRequestimage) {
      if (response['status'] == 'success') {
        hallimagelist.addAll(response['data']);
      } else {
        statusRequestimage = StatusRequest.failure;
      }
    }
    update();
  }
    gethallreservation() async {
    statusRequestresrvation = StatusRequest.loading;
    update();
    var response = await halldata.halldataresrvation();
    statusRequestresrvation = handleingData(response);
    if (StatusRequest.success == statusRequestresrvation) {
      if (response['status'] == 'success') {
        hallreservationlist.addAll(response['data']);
      } else {
        statusRequestresrvation = StatusRequest.failure;
      }
    }
    update();
  }
}
