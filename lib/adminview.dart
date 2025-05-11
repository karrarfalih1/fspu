import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Adminview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text("Admin"),),
          body: Container(
            padding: EdgeInsets.all(10),
            child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 3,),
            children: [
              Container(
              decoration: BoxDecoration(
         //     gradient:GradientRotation(radians)
              ),
                padding: EdgeInsets.all(5),
              child: Card(),
              ),
                 Container(
                padding: EdgeInsets.all(5),
              child: Card(),
              )
,


   Container(
                padding: EdgeInsets.all(5),
              child: Card(),
              )
,
   Container(
                padding: EdgeInsets.all(5),
              child: Card(),
              )
,
   Container(
                padding: EdgeInsets.all(5),
              child: Card(),
              ),
                 Container(
                padding: EdgeInsets.all(5),
              child: Card(),
              )



            ],),
          ),
    );
  }

}