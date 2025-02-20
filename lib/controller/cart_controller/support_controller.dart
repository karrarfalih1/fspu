import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/data/datasource/fspudata/supportdata.dart';
import 'package:get/get.dart';

class MySupportController extends GetxController{

}
class SupportControllerImp extends MySupportController{
  
  Supportdata supportdata=Supportdata(Get.find());
  
List data=[];


StatusRequest statusRequest=StatusRequest.none;
 @override
  onInit(){
    super.onInit();
  getsupportdata();
 }
   getsupportdata() async{
    statusRequest=StatusRequest.loading;
      update();
    var response=await supportdata.getdata();
    statusRequest=handleingData(response);
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
  
data.addAll(response['data']);
print(data);
  }else{
    statusRequest=StatusRequest.failure; }
}
update();
  }
  
}