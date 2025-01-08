
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class SliderData{
  Crud crud;

  SliderData(this.crud);

  getdata()async{
    var response=await crud.postData(Applink.slider, {});

  return response.fold((l)=>l,(r)=>r);
  }
  getcount()async{
    var response=await crud.postData(Applink.getcount, {
    });

  return response.fold((l)=>l,(r)=>r);
  }
}