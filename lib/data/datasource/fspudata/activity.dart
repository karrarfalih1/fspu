
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class ActivityData{
  Crud crud;

  ActivityData(this.crud);

  getdata(useerid)async{
    var response=await crud.postData(Applink.activity_view, {
      "userid":useerid
    });

  return response.fold((l)=>l,(r)=>r);
  }
  activity_delet(participateActivityId,userid)async{
    var response=await crud.postData(Applink.activity_delet, {
     "participate_activity_id":participateActivityId,
     "participate_users_id":userid
    });

  return response.fold((l)=>l,(r)=>r);
  }
   activity_add(participateActivityId,userid)async{
    var response=await crud.postData(Applink.activity_add, {
     "participate_activity_id":participateActivityId,
     "participate_users_id":userid
    });

  return response.fold((l)=>l,(r)=>r);
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
   activityAddNewActivity(userid,activity_title,activity_disc,activity_date,activity_location,activity_activ,activity_langtude,activity_latitude,activity_grob)async{
    var response=await crud.postData(Applink.activityAddNewActivity, {
    "usersid":userid,
    "activity_title":activity_title,
    "activity_d":activity_disc,
    "activity_date":activity_date,
    "activity_location":activity_location,
    "activity_activ":activity_activ,
    "activity_langtude":activity_langtude,
    "activity_latitude":activity_latitude,
    "activity_grob":activity_grob
    });

  return response.fold((l)=>l,(r)=>r);
  }

}