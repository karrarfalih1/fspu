import 'package:flutter/cupertino.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/data/datasource/fspudata/activity.dart';

abstract class ActivityController extends GetxController {
  getActivityData();
}

class ActivityControllerImp extends ActivityController {
  ActivityData activityData = ActivityData(Get.find());

  Map isSelect = {};
  List data = [];
  String? lastdate;
  String? datek;
  String? fersttitle;
  StatusRequest statusRequest = StatusRequest.none;

  setActivity(id, val) {
    isSelect[id] = val;
    update();
  }

  @override
  void onInit() {
    getActivityData();
   
    super.onInit();
  }

  @override
  getActivityData() async {
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest = StatusRequest.loading;
    update();
//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response = await activityData
        .getdata(myservices.sharedPreferences.getString("id"));

    statusRequest = handleingData(response);

//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
        lastdate = response['data'][0]['activity_date'];
        fersttitle = response['data'][0]['activity_title'];

        DateTime lastdate2 = DateTime.parse(lastdate.toString());

        datek = DateFormat('yyyy-MM-dd').format(lastdate2);
        
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletactivity(activityId) async {
    var response = await activityData.activity_delet(
        activityId, myservices.sharedPreferences.getString("id"));
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColor.fspucolor,
            animationDuration: const Duration(seconds: 3),
            title: "نجاح",
            messageText: const Text("لقد تم حذف اسمك من النشاط بنجاح"));
     
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addactivity(activityId) async {
    var response = await activityData.activity_add(
        activityId, myservices.sharedPreferences.getString("id"));
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColor.fspucolor,
            animationDuration: const Duration(seconds: 3),
            title: "نجاح",
            messageText: const Text("لقد تم اضافة اسمك بنجاح"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
