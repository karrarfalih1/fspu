import 'package:flutter/material.dart';
import 'package:fspu/core/classk/statusRequest.dart';
import 'package:fspu/core/functionsk/handlingdatacontroller.dart';
import 'package:fspu/data/datasource/fspudata/poll.dart';
import 'package:get/get.dart';

class PollController extends GetxController {}

class PollControllerImp extends PollController {
  List myshose = ["0", "0", "0", "0"];
  int check = 0;
  Polldata polldata = Polldata(Get.find());

  List data = [];

  StatusRequest statusRequest = StatusRequest.none;

  StatusRequest statusRequestselct = StatusRequest.none;
  shoseone(i, vall) {
    myshose[i] = vall;

    update();
  }

  @override
  onInit() {
    super.onInit();
    getpollview();
  }

  getpollview() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await polldata.getdata();
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  cheksnepoll() {
    for (int x = 0; x < myshose.length; x++) {
      if (myshose[x] == "0") {
        Get.dialog( Dialog(
          child: Container(
            height: 200,
            margin:const EdgeInsets.all(10),
          child:const Center(child: Text("هناك حقول فارعة ",style: TextStyle(fontSize: 18),),),),
        ));
        return;
      }
    }

    sendselctpoll();
  }

  sendselctpoll() async {
    statusRequestselct = StatusRequest.loading;
    update();
    var response = await polldata.slectpoll(myshose[0].toString(),
        myshose[1].toString(), myshose[2].toString(), myshose[3].toString());
    statusRequestselct = handleingData(response);
    if (StatusRequest.success == statusRequestselct) {
      if (response['status'] == 'success') {
      } else {
        statusRequestselct = StatusRequest.failure;
      }
    }
    update();
  }
}
