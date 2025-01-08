
import 'package:get/get.dart';
import 'package:fspu/core/constantk/routesname.dart';

abstract class CuccessSignUp_Controller extends  GetxController{

  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  GoToSignIn();
}
class CuccessSignUp_ControllerImp extends CuccessSignUp_Controller{


  @override
  GoToSignIn() {
   Get.offAllNamed(Approute.login);
  }

}