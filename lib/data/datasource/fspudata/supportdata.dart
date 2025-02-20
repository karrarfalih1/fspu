
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class Supportdata{
  Crud crud;

  Supportdata(this.crud);

  getdata()async{
    var response=await crud.postData(Applink.support, {});
  return response.fold((l)=>l,(r)=>r);
  }

}