
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class SignUpData{
  Crud crud;

  SignUpData(this.crud);

  postdata(String username,String email,String phone,String password, gender,String age, cat)async{
    var response=await crud.postData(Applink.signUp, {
   "username":username,
   "email":email,
    "phone":phone,
    "password":password,
    "gender":gender,
    "age":age,
    "cat":cat


    });

   return response.fold((l)=>l,(r)=>r);
  }

   plusuniversity( cat )async{
    var response=await crud.postData(Applink.universityplus ,{
      "universityid":cat
    });

  return response.fold((l)=>l,(r)=>r);
  }
 
}