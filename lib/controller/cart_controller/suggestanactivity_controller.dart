
import 'package:flutter/widgets.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/core/servicesk/services.dart';
import 'package:fspu/data/datasource/fspudata/suggestanactivity_data.dart';
import 'package:get/get.dart';

abstract class SuggestanactivityController1 extends GetxController {
   addsuggestactivity();
}

class SuggestanactivityController1Imp extends SuggestanactivityController1{
Suggestanactivitydata1 suggestanactivitydata =Suggestanactivitydata1(Get.find());
MyServices myServices =Get.find();
StatusRequest statusRequest=StatusRequest.none;

GlobalKey<FormState> formstatesaggest=GlobalKey<FormState>();


late TextEditingController activity_title;

late TextEditingController activity_disc;


@override
  void onInit() {
    activity_disc=TextEditingController();
    activity_title=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    activity_disc.clear();
    activity_title.clear();
    // TODO: implement onClose
    super.onClose();
  }
    @override
      addsuggestactivity() async {
      var response = await suggestanactivitydata.getdata(
      myservices.sharedPreferences.getString("id"),
      activity_title.text,
      activity_disc.text
      );
      statusRequest = handleingData(response);
      if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
    
      Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColor.fspucolor,
            animationDuration: const Duration(seconds: 3),
            title: "نجاح",
            messageText: const Text("تمت اضافة النشاط بنجاح"));
      } else {
     statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
