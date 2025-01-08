
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class ActivityData{
  Crud crud;

  ActivityData(this.crud);

  getdata()async{
    var response=await crud.postData(Applink.activity, {});

  return response.fold((l)=>l,(r)=>r);
  }

}