 //في هذه الصفحة نحن نفحص الايميل فقط 
import 'package:get/get.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/constantk/routesname.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/data/datasource/remote/forgetpassword/vrfiycodeforget.dart';

abstract class VerifyCode_Controller extends  GetxController{
  checkCode();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  GoToResetPassword(String verfiycode);
}
class VerifyCode_ControllerImp extends VerifyCode_Controller{
  Vrfiycodeforget vrfiycodeforget =Vrfiycodeforget(Get.find());
 String? verfiycode;
 String? email;
StatusRequest  statusRequest=StatusRequest.none;
 

  @override
  checkCode() {
    
  }
  
  @override
  GoToResetPassword(verfiycode) async {
 
       
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
    update();

//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await vrfiycodeforget.postdata(
      email!,verfiycode
    
    );

    statusRequest=handleingData(response);

//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
 //  data.addAll(response['data']);
 Get.offNamed(Approute.resetpassword ,arguments: {"email":email});
  }else{
    Get.defaultDialog(
      title:"Warning",
      middleText: "الكود الذي ادخلته غير صحيح"
    );
    statusRequest=StatusRequest.failure;
  }
}
update();
  }
  @override
  void onInit() {
     email=Get.arguments['email'];
    // TODO: implement onInit
    super.onInit();
  }
}