import 'package:flutter/material.dart';
import 'package:fspu/controller/cart_controller/poll_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:get/get.dart';

class Qustionandanser extends GetView<PollControllerImp> {
  const Qustionandanser({super.key});
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<PollControllerImp>(
        builder: (controller) => ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "${controller.data[index]['poll_name']}",
                          style: const TextStyle(
                              fontSize: 19,
                              color: AppColor.fspucolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    RadioListTile(
                        activeColor: AppColor.fspucolor,
                        title: Text("${controller.data[index]["poll_1"]}"),
                        value: "poll_1",
                        groupValue: "${controller.data[index]['poll_id']}",
                        onChanged: (valx) {
                          controller.data[index]['poll_id'] = valx;
                          controller.shoseone(index, valx);
                        }),
                    RadioListTile(
                        activeColor: AppColor.fspucolor,
                        title: Text("${controller.data[index]["poll_2"]}"),
                        value: "poll_2",
                        groupValue: "${controller.data[index]['poll_id']}",
                        onChanged: (valx) {
                          controller.data[index]['poll_id'] = valx;
                          controller.shoseone(index, valx);
                        }),
                    RadioListTile(
                        activeColor: AppColor.fspucolor,
                        title: Text("${controller.data[index]["poll_3"]}"),
                        value: "poll_3",
                        groupValue: "${controller.data[index]['poll_id']}",
                        onChanged: (valx) {
                          controller.data[index]['poll_id'] = valx;
                          controller.shoseone(index, valx);
                        }),
                    RadioListTile(
                        activeColor: AppColor.fspucolor,
                        title: Text("${controller.data[index]["poll_4"]}"),
                        value: "poll_4",
                        groupValue: "${controller.data[index]['poll_id']}",
                        onChanged: (valx) {
                          controller.data[index]['poll_id'] = valx;
                          controller.shoseone(index, valx);
                        })
                  ],
                ),
              );
            }));
  }
}
