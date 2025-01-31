




import 'package:fspu/core/classk/crud.dart';
import 'package:fspu/linkapi.dart';

class Halldata {
  Crud crud;
  Halldata(this.crud);

  halldata()async{
    var response=await crud.postData(Applink.hallview, {});
    return response.fold((l)=>l, (r)=>r);
  }
}

