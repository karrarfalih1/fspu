import 'package:flutter/material.dart';
import 'package:fspu/core/constantk/color.dart';

class Adrees extends StatelessWidget{
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
        bottom: TabBar(tabs: [
          Icon(Icons.man),
            Icon(Icons.female)
        ]),),
 
    
  ),
)
   ;
  }

}