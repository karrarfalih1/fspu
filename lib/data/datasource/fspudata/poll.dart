
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class Polldata{
  Crud crud;

  Polldata(this.crud);

  getdata()async{
    var response=await crud.postData(Applink.pollview, {});
  return response.fold((l)=>l,(r)=>r);
  }

 slectpoll(polldataview_1,polldataview_2,polldataview_3,polldataview_4)async{
    var response=await crud.postData(Applink.slectpoll, {
    "polldataview_1":polldataview_1,
    "polldataview_2":polldataview_2,
    "polldataview_3":polldataview_3,
    "polldataview_4":polldataview_4,

    });
  return response.fold((l)=>l,(r)=>r);
  }
}