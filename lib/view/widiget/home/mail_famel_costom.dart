import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/home_controller.dart';

class MailFamelCostom extends GetView<HomeControllerImp> {
 
  const MailFamelCostom({super.key, });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder: (controller)=>
    
     Container(
                                  height: 82,
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: 25,
                                                width: 25,
                                                color: Colors.blue,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              const Text(
                                                "الذكور",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Cairo"),
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                "${controller.Number_of_males}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Cairo"),
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: 25,
                                                width: 25,
                                                color: Colors.pink,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              const Text(
                                                " الاناث",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Cairo"),
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                "${controller.Number_of_females}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Cairo"),
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 80,
                                        width: 80,
                                        child: PieChart(PieChartData(sections: [
                                          PieChartSectionData(
                                              radius: 10,
                                              value: controller
                                                  .Number_of_females.toDouble(),
                                              color: Colors.pink),
                                          PieChartSectionData(
                                              radius: 10,
                                              value: controller.Number_of_males
                                                  .toDouble(),
                                              color: Colors.blue)
                                        ])),
                                      ),
                                    ],
                                  ),
                                ));
  }
}
