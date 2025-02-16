import 'package:flutter/material.dart';
import 'package:fspu/controller/publesh/suggestactivity_controller.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Datepublishactivity extends GetView<SuggestactivityControllerImp>{
  
  const Datepublishactivity({super.key});
  @override
  Widget build(BuildContext context) {
    return    GetBuilder<SuggestactivityControllerImp>(builder: (controller)=>   InkWell(
                onTap: () async {
                  controller.newdata = await showDatePicker(
                    context: context,
                    initialDate: controller.datatime,
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          // تغيير لون الدائرة المحددة
                          colorScheme: const ColorScheme.light(
                            primary: AppColor
                                .fspucolor, // لون العنصر المحدد (Selection color)
                            onPrimary:
                                Colors.white, // لون النص على العنصر المحدد
                            onSurface: Colors.black, // لون النص العام
                          ),
                          // تغيير لون الأزرار
                          buttonTheme: const ButtonThemeData(
                            colorScheme:
                                ColorScheme.light(primary: Colors.blue),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (controller.newdata == null) return;
                  controller.newtime = await showTimePicker(
                      // ignore: use_build_context_synchronously
                      context: context,
                      initialTime: TimeOfDay(
                          hour: controller.datatime.hour,
                          minute: controller.datatime.minute),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            // تغيير لون الدائرة المحددة
                            colorScheme: const ColorScheme.light(
                              primary: AppColor
                                  .fspucolor, // لون العنصر المحدد (Selection color)
                              onPrimary:
                                  Colors.white, // لون النص على العنصر المحدد
                              onSurface: Colors.black, // لون النص العام
                            ),
                            // تغيير لون الأزرار
                            buttonTheme: const ButtonThemeData(
                              colorScheme:
                                  ColorScheme.light(primary: Colors.blue),
                            ),
                          ),
                          child: child!,
                        );
                      });
                  if (controller.newtime == null) {
                    return;
                  } else {
                    controller.shosenewdata();
                  }
                },
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "التاريخ ",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(DateFormat('yyyy-MM-dd HH:mm')
                            .format(controller.datatime))
                      ],
                    ),
                  ),
                ),
              ));
           
  }

}