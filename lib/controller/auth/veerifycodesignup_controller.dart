 //في هذه الصفحة نحن نفحص الايميل فقط 
import 'package:get/get.dart';
import 'package:fspu/controller/auth/sugnup_controller.dart';
import 'package:fspu/controller/home/home_controller.dart';
import 'package:fspu/core/constantk/routesname.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/core/servicesk/services.dart';

import '../../core/classk/statusRequest.dart';
import '../../data/datasource/remote/auth/verfiycodesignup.dart';

abstract class VerifyCodeSignUp_Controller extends  GetxController{
  checkCode();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSuccessSingUp(String verfiycode);
}
class VerifyCodeSignUp_ControllerImp extends VerifyCodeSignUp_Controller{
  MyServices myServices=Get.find();
  SignUp_ControllerImp controllersignup =Get.put(SignUp_ControllerImp()) ;
Verfiycodesignup verfiycodesignup =Verfiycodesignup(Get.find());
 String? verfiycode;
StatusRequest statusRequest=StatusRequest.none;
 String?email;

  @override
  checkCode() {
    
  }
  
  @override
  goToSuccessSingUp(verfiycode)async {
 
        email=controllersignup.email_controller.text;
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
    update();

//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await verfiycodesignup.postData(
     email!,verfiycode
    );

    statusRequest=handleingData(response);

//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
    
   //    myservices.sharedPreferences.setString("id", response['data']['users_id'].toString());
   //    myservices.sharedPreferences.setString("username", response['data']['users_name']);
    //   myservices.sharedPreferences.setString("email", response['data']['users_email']);
    //   myservices.sharedPreferences.setString("phone", response['data']['users_phone']);
 //  data.addAll(response['data']);
    myservices.sharedPreferences.setString("step","2");
 
 Get.offNamed(Approute.login);
  }else{
    Get.defaultDialog(
      title:"Warning",
      middleText: "الكود الذي ادخلته غير صحيح"
    );
   // statusRequest=StatusRequest.failure;
  }
 
}
update();
  }

@override
  void onInit() {
    
    // TODO: implement onInit
    super.onInit();
  }
}