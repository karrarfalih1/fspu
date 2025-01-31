
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

}