

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/data/datasource/fspudata/activity.dart';

abstract class ActivityController extends GetxController{

getActivityData();
}

class ActivityControllerImp extends ActivityController{

  ActivityData activityData=ActivityData(Get.find());

  List data=[];
  String? lastdate;
   String? datek;
   String? fersttitle;
  StatusRequest statusRequest =StatusRequest.none;

  @override
  void onInit() {
      getActivityData();
    // TODO: implement onInit
    super.onInit();
  }
  


    @override
  getActivityData() async{
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
    update();
//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await activityData.getdata();

    statusRequest=handleingData(response);

//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
   data.addAll(response['data']);
   lastdate=response['data'][0]['activity_date'];
   fersttitle=response['data'][0]['activity_title'];


   DateTime lastdate2=DateTime.parse(lastdate.toString());
   
     datek=DateFormat('yyyy-MM-dd').format(lastdate2);
   print(datek);

  }else{
    statusRequest=StatusRequest.failure;
  }
 
}
update();
  }
}