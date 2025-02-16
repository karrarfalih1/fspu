import 'package:flutter/material.dart';
import 'package:fspu/controller/activity_controller.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/data/datasource/fspudata/activity.dart';
import 'package:fspu/view/screen/activity/mapscren.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class SuggestactivityController extends GetxController{

}

class SuggestactivityControllerImp extends SuggestactivityController{
  ActivityControllerImp controller =Get.find();
  
GlobalKey<FormState> formstateactivity=GlobalKey<FormState>();
  ////////////////////map
  bool? shoosmaplocation;
    double? lang=33.22;
  double? lat=44.407071;
  List<Marker> marker = [];
  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(33.22, 44.407071),
    zoom: 12.4746,
  );
  GoogleMapController? controllerr;
  ontapp(lat,lang){
   
    marker.add(Marker(markerId:const MarkerId('1'), position: LatLng(lat!,lang!)));
    update();
  }
  ///////////////end map
  bool publec=true;
   ActivityData activityData = ActivityData(Get.find());

  StatusRequest statusRequest=StatusRequest.none;
DateTime datatime =DateTime.now();
DateTime date =DateTime.now();
DateTime? newdata;
TimeOfDay? newtime;


late TextEditingController activity_title;

late TextEditingController activity_disc;
late TextEditingController activity_location;
late String activity_activ;
late TextEditingController activity_grob;



@override
void onChangedpublic(){
  if(publec){
activity_activ="1";
  }else{
    
activity_activ="0";
  }
  update();
}
void shosenewdata(){
  datatime=DateTime(
    newdata!.year,
    newdata!.month,
    newdata!.day,
    newtime!.hour,
    newtime!.minute

  );
  update();
}

gotomapscrenn(){
  Get.to(Mapscren());
}
shoseloactionmap(){
  shoosmaplocation=true;
  Get.back();
  update();
}
  @override
  void onInit() {
    shoosmaplocation=false;
   activity_title=TextEditingController();
   activity_disc=TextEditingController();
   activity_grob=TextEditingController();
   activity_location=TextEditingController();
   


    super.onInit();
  }

    addnewactivity() async {
    var response = await activityData.activityAddNewActivity(
       myservices.sharedPreferences.getString("id"),
 activity_title.text,
 activity_disc.text,
datatime.toString(),
activity_location.text,
    activity_activ,
     lang.toString(),
  lat.toString()
,
activity_grob.text     );
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        controller.getActivityData();
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