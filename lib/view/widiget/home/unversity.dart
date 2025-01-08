import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/home_controller.dart';
import 'package:fspu/controller/university/university_controller.dart';

class UnversityCostom extends GetView<GetUniversityControllerImp> {
  final String title;
  final void Function()? onPressedk;
  const UnversityCostom({super.key, required this.title, this.onPressedk});
  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerHome=Get.find();
    return GetBuilder<GetUniversityControllerImp>(builder: (controller)=>
    Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          "${controllerHome.total}",
                                          style: const TextStyle(
                                              fontSize: 26, fontFamily: "sans"),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          height: 300,
                                          width: 300,
                                          child:
                                              PieChart(PieChartData(sections:
                                             controller.alldata.map((data){
                                                return PieChartSectionData(
                                                  radius: 40,
                                                  title: data['university_name'],
                                                  value: data['university_count'].toDouble(),
                                                
                                                  color: Color(int.parse(data['university_color']))


                                                );
                                              }).toList()
                                             )),
                                        ),
                                      )
                                    ],
                                  ),
    );
  }
}
