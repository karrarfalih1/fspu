import 'package:flutter/material.dart';
import 'package:fspu/controller/publesh/suggestactivity_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapscren extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SuggestactivityControllerImp controller =Get.put(SuggestactivityControllerImp());
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: (){
        controller.shoseloactionmap();
        },
        child: Card(
         
          child: Container( margin:const EdgeInsets.all(15),
          height: 40,
          width: double.infinity,
          child:const Center(child: Text("اضافة الموقع",style: TextStyle(fontSize: 24,color: AppColor.fspucolor,fontWeight: FontWeight.bold),),),),
        ),
      ) ,
      body:
      GetBuilder<SuggestactivityControllerImp>(builder: (controller)=>
             GoogleMap(
                  onTap: (LatLng latlang){
                  
      
                   controller.ontapp(latlang.latitude, latlang.longitude);

                  },
                  markers:   controller.marker.toSet(),
                  mapType: MapType.normal,
                  initialCameraPosition:   controller.kGooglePlex,
                  onMapCreated: (GoogleMapController mapcontroller) async {
                      controller.controllerr =  mapcontroller;
                      controller.controllerr!.animateCamera(
                        CameraUpdate.newLatLng(LatLng(controller.lang!,controller.lat!)));
                         // _controller.complete(controller);
                  },
                  
                ), 
      )

    );
  }

}