
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fspu/controller/auth/login_controller.dart';
import 'package:fspu/core/classk/handlingdataview.dart';
import 'package:fspu/core/constantk/color.dart';
import 'package:fspu/core/functionsk/alertexitapp.dart';
import 'package:fspu/core/functionsk/validinput.dart';
import 'package:fspu/view/widiget/auth/costomtestfeld.dart';
import 'package:fspu/view/widiget/auth/custombuttomauth.dart';
import 'package:fspu/view/widiget/auth/customsubtitleauth.dart';
import 'package:fspu/view/widiget/auth/customtexttitleaout.dart';
import 'package:fspu/view/widiget/auth/logoauth.dart';
import 'package:fspu/view/widiget/auth/textsignup.dart';

class Login extends StatelessWidget{

  const Login({super.key});
  @override
  Widget build(BuildContext context) {

//نحقن الكونترولر الخاص بها
LoginControllerImp controllerLogin =Get.put(LoginControllerImp());
    return SafeArea(child:   Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: Colors.white,
        title: Text(" تسجيل الدخول",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),
body: WillPopScope(
  //حتى  لا يخرج من التطبيق مباشرتا
  onWillPop: alertExitApp,
  child:GetBuilder<LoginControllerImp>(builder: (controller)=>
  HandlingDataView(statusRequest : controller.statusRequest!, widget:   Container(
   color: Colors.white,
  //color: Colors.red,
  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: Form(
    key:controllerLogin.formstatesignin ,
    child: ListView(
      children:[
         const SizedBox(height: 15,),
         const Center(child: CustomLogoAuth()),
      const SizedBox(height: 15,),
      const CustomTextTitleAuth(title:"اهلا بعودتك",),
       const SizedBox(height: 10,),
       const CustomTextSubTitleAuth(subtitle: 'قم بادخال بريدك الاكتروني وكلمة السر للاستمرار في استخدام التطبيق',)
       ,const SizedBox(height: 35,),
      
        Customtextfeld(
           valid: (val){
                return validInput(val!, 5, 100,"email" );
              },
        mycontroller: controllerLogin.email_controller,
          hintText: "ادخل بريدك الالكتروني",
         labeltext: 'البريد',
          iconss:Icons.email_outlined,
        //   mycontroller: ,
        ),
       GetBuilder<LoginControllerImp>(
        builder:(controllerLogin) {
          return    Customtextfeld(
             valid: (val){
                return validInput(val!, 6, 30, "password");
              },
              onTap: (){
                controllerLogin.hidandviewpassword();
              },
              obscureText: controllerLogin.typepaworrdtext==true?true:false,
            mycontroller: controllerLogin.password_controller,
            hintText: "ادخل كلمة المرور ",
         labeltext: 'كلمة المرور',
          iconss:controllerLogin.typepaworrdtext==true? Icons.remove_red_eye_outlined:Icons.lock,
        //   mycontroller: ,
        );
        }),
       InkWell(
        onTap: (){controllerLogin.goToforget();},
        child: const Text("هل نسيت كلمة السرك ؟", textAlign: TextAlign.end,)),
       CustomButtomAuth(textbuttom: "تسجيل الدخول",onPressed: (){
        controllerLogin.login();
       },),
      const SizedBox(height: 30,),
    TextSignUpAndSignIn(
    title2: "اليس لك حساب بالفعل؟ ",
    title: "انشاء حساب جديد",onTap: (){
      print("to ---------------------- sign up");
      controllerLogin.goToSignUp();
     // Get.toNamed()
    },)
    
      ],
    
    ),
  ),),)

)
))
    );
    
  
  }

}