import 'package:flutter/material.dart';
import 'package:fspu/core/constantk/color.dart';

class SportmeCart extends StatelessWidget{
  const SportmeCart({super.key});

  @override
  Widget build(BuildContext context) {
   
   return DefaultTabController(
  
  
  length: 2,
  child: Scaffold(
        appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
        backgroundColor: AppColor.fspucolortwo,
        title: Text(
          "ادعمنا",
              style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ),
     body: ListView(children:const [
      SizedBox(height: 10,),
    

     ],),
 
    
  ),
)
   ;
  }

}