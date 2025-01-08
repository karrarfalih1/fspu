import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardHome extends StatelessWidget {
  final String title;
    final String subtitle;
    final  IconData icons;
    final String trailtext;
  final void Function()? ontap;
  const CardHome({Key? key, required this.title, this.ontap, required this.subtitle, required this.icons, required this.trailtext});
  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap: ontap,
      child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            height: 100,
                            child:  Card(
                              child: ListTile(
      
                                trailing:Text("${trailtext}"),
                                subtitle: Text(
                                  "${subtitle}",
                                  style:const TextStyle(
                                      fontSize: 13,),
                                  textDirection: TextDirection.rtl,
                                ),
                                title: Text(
                                 "${title}",
                                  style:const TextStyle(
                                      fontSize: 20,),
                                  textDirection: TextDirection.rtl,
                                ),
                                focusColor: Colors.red,
                                leading:Icon(icons),
                              ),
                            ),
                          ),
    );
  }
}
