
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class HomeData{
  Crud crud;

  HomeData(this.crud);

  postdata()async{
    var response=await crud.postData(Applink.home, {});

  return response.fold((l)=>l,(r)=>r);
  }
}