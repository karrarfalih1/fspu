import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/bindings/initbinding.dart';
import 'package:fspu/core/localizationk/translation.dart';
import 'package:fspu/core/servicesk/services.dart';
import 'package:fspu/routes.dart';
import 'core/localizationk/changelocal.dart';

void main()async {

WidgetsFlutterBinding.ensureInitialized();
//استدعيناها من  السسرفزس  
await initialServices();


  runApp(const MyApp());
  Get.put(LocaleController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   LocaleController controllerlang= Get.put(LocaleController());
    return 
    
    GetBuilder<LocaleController>(builder: (controller)=>
    
    GetMaterialApp(
      
      
//من اجل تعدد اللغات
      translations: MyTranslation(),
      //لاخفاء الشريط الاحمر
debugShowCheckedModeBanner: false,
      locale: controllerlang.mylang,
      theme: controllerlang.appTheme,
      title: 'fspu',   
      initialBinding: Initbindings(),  
   
    
     getPages: routes
      //من اجل اليزي بوت حتى لا اضطر لاستدعائها في كل صفحة 
     // initialBinding: MyBinding(),
    ));
  }
}
