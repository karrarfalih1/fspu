
import 'package:get/get.dart';
import 'package:fspu/core/classk/crud.dart';

class Initbindings extends Bindings {
  @override
  void dependencies() {
    //حتى ما اضطر بكل صفحة امرر ال crud
   Get.put(Crud());
  }

}