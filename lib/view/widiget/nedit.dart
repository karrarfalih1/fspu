 
 /*
 
 
  DropdownSearch<String>(
       //   mode: Mode.custom,
                //  key: dropDownKey,
                  selectedItem: "اختر الجامعة",
                  items =(filter, infiniteScrollProps, dynamic controllerUniversty) => controllerUniversty.data,
                  decoratorProps: DropDownDecoratorProps(

                    decoration: InputDecoration(
                      
                      labelText: 'الجامعة',
                      border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onChanged: (selectedItem) {
                    // الحصول على الفهرس (index)
                    int index = controllerUniversty.data.indexOf(selectedItem!);
                    controller.universityname=selectedItem.toString();
   // يمكنك استخدام الفهرس في أي عملية تريدها هنا.
                  },
                  popupProps: PopupProps.menu(
                    menuProps: MenuProps(
                    
                      borderRadius:BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
                      backgroundColor: AppColor.fspucolor1
                    ),
                    fit: FlexFit.tight,
                    constraints: BoxConstraints(),
                  ),
                ),*/


                ////////////////////////////////singup
                ///
                ///
                 /**
                  * 
                  
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:store313/controller/auth/sugnup_controller.dart';
import 'package:store313/controller/university/university_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';

import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/functionsk/alertexitapp.dart';
import 'package:store313/core/functionsk/validinput.dart';
import 'package:store313/view/widiget/auth/costomtestfeld.dart';
import 'package:store313/view/widiget/auth/custombuttomauth.dart';
import 'package:store313/view/widiget/auth/customsubtitleauth.dart';
import 'package:store313/view/widiget/auth/logoauth.dart';
import 'package:store313/view/widiget/auth/textSignUp.dart';

class SignUp extends StatelessWidget{
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    GetUniversityControllerImp controllerUniversty=Get.put(GetUniversityControllerImp());

//نحقن الكونترولر الخاص بها
 Get.lazyPut(()=>SignUp_ControllerImp());
    return    Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: Colors.white,
        title: Text("Sign Up",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),
body: WillPopScope(
  onWillPop: alertExitApp
  ,
  child: GetBuilder<SignUp_ControllerImp>(builder: (controller)=>
HandlingDataView(statusRequest: controller.statusRequest!, widget: 
Container(
   color: Colors.white,
  //color: Colors.red,
  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: Form(
    key: controller.formstateSignUp,
    child: ListView(
      children:[
        const SizedBox(height: 30,),
      
       Center(child: CustomLogoAuth()),
        const SizedBox(height: 10,),
        const CustomTextSubTitleAuth(subtitle: 'اهلا وسهلا بك في الاتحاد الطلابي  والشعبي ',)
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
                return validInput(val!, 6, 30, "age");
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
         SizedBox(height:10),
        DropdownSearch<String>(
       //   mode: Mode.custom,
                //  key: dropDownKey,
                  selectedItem: "اختر الجامعة",
                  items:(filter, infiniteScrollProps) => controllerUniversty.data,
                  decoratorProps: DropDownDecoratorProps(

                    decoration: InputDecoration(
                      
                      labelText: 'الجامعة',
                      border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onChanged: (selectedItem) {
                    // الحصول على الفهرس (index)
                    int index = controllerUniversty.data.indexOf(selectedItem!);
                    controller.universityname=selectedItem.toString();
   // يمكنك استخدام الفهرس في أي عملية تريدها هنا.
                  },
                  popupProps: PopupProps.menu(
                    menuProps: MenuProps(
                    
                      borderRadius:BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
                      backgroundColor: AppColor.fspucolor1
                    ),
                    fit: FlexFit.tight,
                    constraints: BoxConstraints(),
                  ),
                ),
          SizedBox(height:30),
      DropdownSearch<String>(
  selectedItem: "اختر الجنس",
  items: (filter, infiniteScrollProps) => ["انثى", "ذكر"],
   decoratorProps: DropDownDecoratorProps(
    decoration: InputDecoration(
      labelText: 'الجنس',
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


    controller.selectedGender= selectedItem.toString();
  },
  popupProps: PopupProps.menu(
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


 SizedBox(height: 80,),
       CustomButtomAuth(textbuttom: "سجل حسابك",onPressed: (){
        if(controller.universityname=="none"){
          Get.defaultDialog(
            actions: [
            const  Text("اذا كنت قد تخرجت من الجامعة  اكتب اخر  جامعة درست فيها واذا كنت طالب مدرسة اختر المدرسة  واذا والا فاختر ّغير ذلكّ",
            )
            ],
            title: "عليك اختيار الجامعة",
        //    textCustom: "اذا كنت قد تخرجت من الجامعة  اكتب اخر  جامعة درست فيها واذا كنت طالب مدرسة اختر المدرسة  واذا والا فاختر ّغير ذلكّ",
            
            
          );
        }
        controller.signup();
        controller.chack();
     //   controller.signup();
       },),
      const SizedBox(height: 30,),
    TextSignUpAndSignIn(
    title2: "have account? ",
    title: "Sing In",onTap: (){
    controller.goToSignIn();
    },)
      ],
    
    ),
  ),))), )


    );
    
  
  }

}
  
  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, // لجعل الصفحة تأخذ مساحة أكبر عند الحاجة
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // لكي تأخذ الصفحة مساحة المحتوى فقط
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'اختر العنصر المناسب',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('عنصر 1'),
                onTap: () {
                  Navigator.pop(context); // إغلاق الصفحة عند الضغط
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text('عنصر 2'),
                onTap: () {
                  Navigator.pop(context); // إغلاق الصفحة عند الضغط
                },
              ),
              ListTile(
                leading: Icon(Icons.add_circle_outline),
                title: Text('عنصر 3'),
                onTap: () {
                  Navigator.pop(context); // إغلاق الصفحة عند الضغط
              },
              ),
            ],
          ),
        );
      },
    );
  }

                  */