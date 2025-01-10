 
import 'package:fspu/data/datasource/fspudata/slider.dart';
import 'package:get/get.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/data/datasource/fspudata/university.dart';

abstract class GetUniversityController extends  GetxController{
  login();

}
class GetUniversityControllerImp extends GetUniversityController{
  //////////////getcount//////////
  ///
SliderData sliderData=SliderData(Get.find());
 
 var Number_of_males=0;
 var Number_of_females=0;
 var total=0;
  /////////////
  GetUniversity getUniversity= GetUniversity(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  
  StatusRequest statusRequest1=StatusRequest.none;
  String? select_un;
  List alldata=[];
  List<String> data=[];
  @override
  void onInit() {
    select_un="non";
    login();
    // TODO: implement onInit
    super.onInit();
     GetCount();
  }
 up(){
  update();
 }
  @override
  login() async{ 
    statusRequest=StatusRequest.loading;
    update();
    var response=await getUniversity.getcountun();
    statusRequest=handleingData(response);
    if(StatusRequest.success==statusRequest){

    alldata.addAll(response['data']);
    data=(response['data'] as List).map((item)=>item['university_name']as String).toList();
    update();
    }else{
      statusRequest=StatusRequest.failure;
      update();
    }
    }

  GetCount() async{
    statusRequest1=StatusRequest.loading;
    var response=await getUniversity.getcount();
    statusRequest1=handleingData(response);
if(StatusRequest.success==statusRequest1){
  if(response['status']=='success'){
Number_of_males=response['male_count'];
Number_of_females=response['female_count'];
total=Number_of_females+Number_of_males;
  }else{
    statusRequest1=StatusRequest.failure;
     }
   
}
update();
  }



  }
  
