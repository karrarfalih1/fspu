
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class GetwiningData{
  Crud crud;

  GetwiningData(this.crud);

  getdata()async{
    var response=await crud.postData(Applink.getwining, {});

  return response.fold((l)=>l,(r)=>r);
  }

}