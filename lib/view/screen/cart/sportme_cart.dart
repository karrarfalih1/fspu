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
       backgroundColor: AppColor.fspucolor,
        title: Text("من نحن",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:Colors.white),),
        bottom: const TabBar(tabs: [
          Icon(Icons.man),
            Icon(Icons.female)
        ]),),
 
    
  ),
)
   ;
  }

}