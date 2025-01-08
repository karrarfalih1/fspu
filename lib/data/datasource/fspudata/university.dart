
import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class GetUniversity{
  Crud crud;

  GetUniversity(this.crud);

  getcount()async{
    var response=await crud.postData(Applink.university, {});

  return response.fold((l)=>l,(r)=>r);
  }
  
 plusuniversity( cat )async{
    var response=await crud.postData(Applink.universityplus ,{
      "universityid":cat
    });

  return response.fold((l)=>l,(r)=>r);
  }
}