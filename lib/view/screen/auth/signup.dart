
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fspu/controller/auth/sugnup_controller.dart';
import 'package:fspu/controller/university/university_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';

import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/functionsk/validinput.dart';
import 'package:fspu/view/widiget/auth/costomtestfeld.dart';
import 'package:fspu/view/widiget/auth/customsubtitleauth.dart';
import 'package:fspu/view/widiget/auth/logoauth.dart';
import 'package:fspu/view/widiget/auth/textSignUp.dart';

class SignUp extends StatelessWidget{
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    GetUniversityControllerImp controllerUniversty=Get.put(GetUniversityControllerImp());

//نحقن الكونترولر الخاص بها
 Get.lazyPut(()=>SignUp_ControllerImp());
    return   Container(
  child: GetBuilder<SignUp_ControllerImp>(builder: (controller)=>
HandlingDataView(statusRequest: controller.statusRequest!, widget: 
SizedBox(
  // color: Colors.white,
  //color: Colors.red,
 // padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: Form(
    key: controller.formstateSignUp,
    child: ListView(
      children:[
        const SizedBox(height: 10,),
      
       const Center(child: CustomLogoAuth()),
        const SizedBox(height: 10,),
        const CustomTextSubTitleAuth(subtitle: 'اهلا وسهلا بك في الاتحاد الطلابي  والشعبي ',),
        const SizedBox(height: 10,),
        TextSignUpAndSignIn(
    title2: "هل لديك حساب بالفعل؟",
    title: "تسجيل الدخول ",onTap: (){
    controller.goToSignIn();
    },)
       ,const SizedBox(height: 35,),
      
          Customtextfeld(
           valid: (val){
            return  validInput(val!, 6, 30, "username");
    
                
              },
          mycontroller: controller.username_controller,
          hintText: "مثل :كرار فالح فاخر",
         labeltext: 'الاسم الثلاثي',
          iconss:Icons.person_outline,
        //   mycontroller: ,
        ),
      
         Customtextfeld(
           valid: (val){
                return validInput(val!, 5, 100, "email");
              },
          mycontroller: controller.email_controller,
          hintText: "ادخل ايميل سوف تصلك رساله عليه",
         labeltext: 'الايميل',
          iconss:Icons.email_outlined,
        //   mycontroller: ,
        ),
             Customtextfeld(
              valid: (val){
    return validInput(val!, 11, 11, "");
              },
              keyboardType: TextInputType.phone,
              mycontroller: controller.phone_controller,
              hintText: "مثل:07xxxxxxxx",
         labeltext: 'الهاتف',
          iconss:Icons.phone_outlined,
        //   mycontroller: ,
        ),
          Customtextfeld(
             valid: (val){
                return validInput(val!, 6, 30, "password");
              },
              onTap: (){
                controller.hidandviewpassword();
              },
              obscureText: controller.typepaworrdtext==true?true:false,
            mycontroller: controller.password_controller,
            hintText: "اصنع كلمة مرور جديدة",
         labeltext: 'كلمة المرور',
          iconss:controller.typepaworrdtext==true? Icons.remove_red_eye_outlined:Icons.lock,
        //   mycontroller: ,
        ),
           Customtextfeld(
             valid: (val){
                return validInput(val!, 1, 2, "age");
              },
              onTap: (){
                controller.hidandviewpassword();
              },
               keyboardType: TextInputType.phone,
            mycontroller: controller.age_controller,
            hintText: "ادخل عمرك :السنة فقط مثل 25",
         labeltext: 'العمر ',
          iconss:Icons.event
        //   mycontroller: ,
        ),
         const SizedBox(height:10),
      
      //    SizedBox(height:30),
      DropdownSearch<String>(
  selectedItem: "اختر الجنس",
  items: (filter, infiniteScrollProps) => ["انثى", "ذكر"],
   decoratorProps: DropDownDecoratorProps(
    decoration: InputDecoration(
      label: Container(margin: const EdgeInsets.symmetric(horizontal: 20),
        child: const Text('الجنس'),),
    //  labelText: 'الجنس',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  onChanged: (selectedItem) {
    // قائمة القيم
    List<String> genderList = ["انثى", "ذكر"];
    // الحصول على الفهرس
    int index = genderList.indexOf(selectedItem!);


    controller.selectedGender= index.toString();
    print(controller.selectedGender);
  },
  popupProps: const PopupProps.menu(
    menuProps: MenuProps(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      backgroundColor: AppColor.fspucolor1,
    ),
    fit: FlexFit.loose,
    constraints: BoxConstraints(),
  ),
),

      const SizedBox(height: 30,),
    
    const SizedBox(height: 50,)
      ],
    
    ),
  ),))), )


    ;
    
  
  }

}
