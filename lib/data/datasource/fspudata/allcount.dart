
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class GetGenderCount{
  Crud crud;

  GetGenderCount(this.crud);

  getcount(gender)async{
    var response=await crud.postData(Applink.getcount, {
      'users_gender':gender
    });

  return response.fold((l)=>l,(r)=>r);
  }
}