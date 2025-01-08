
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class Resetpassword {
  Crud crud;

  Resetpassword(this.crud);

  postdata(String email,String password)async{
    var response=await crud.postData(Applink.resetpassword, {
        "email":email,
        "password":password,

    });

   return response.fold((l)=>l,(r)=>r);
  }
}
///////////////////////
///