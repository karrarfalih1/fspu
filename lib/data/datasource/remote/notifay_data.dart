
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class NotifayData {
  Crud crud;

  NotifayData(this.crud);

  getntefy(String usersid)async{
    var response=await crud.postData(Applink.activityAddNewActivity,{
      "usersid":usersid
    });

   return response.fold((l)=>l,(r)=>r);
  }
}