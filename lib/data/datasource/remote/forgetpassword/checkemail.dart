
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class CheckEmail {
  Crud crud;

  CheckEmail(this.crud);

  postdata(String email)async{
    var response=await crud.postData(Applink.checkemail, {
        "email":email
    });

   return response.fold((l)=>l,(r)=>r);
  }
}