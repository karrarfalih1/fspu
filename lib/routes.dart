
import 'package:fspu/view/screen/activity/suggestactivity.dart';
import 'package:fspu/view/screen/cart/sportme_cart.dart';
import 'package:fspu/view/screen/cart/support.dart';
import 'package:fspu/view/screen/logo_meaning.dart';
import 'package:fspu/view/screen/room.dart';
import 'package:get/get.dart';
import 'package:fspu/core/constantk/routesname.dart';
import 'package:fspu/core/middleware/mymiddleware.dart';
import 'package:fspu/view/screen/activity/activity.dart';
import 'package:fspu/view/screen/auth/forget/forgetpassword.dart';
import 'package:fspu/view/screen/auth/login.dart';
import 'package:fspu/view/screen/auth/forget/resetpassword.dart';
import 'package:fspu/view/screen/auth/signup.dart';
import 'package:fspu/view/screen/auth/forget/success_reset_password.dart';
import 'package:fspu/view/screen/auth/success_signup.dart';
import 'package:fspu/view/screen/auth/forget/verifycode.dart';
import 'package:fspu/view/screen/auth/verifycodesignup.dart';
import 'package:fspu/view/screen/home.dart';
import 'package:fspu/view/screen/onboarding.dart';
import 'package:fspu/view/screen/singup_screen.dart';


List<GetPage<dynamic>>? routes=[

  //test
  //GetPage(name: "/", page: ()=>const SignUp()),
  //Auth
      GetPage(name: "/", page: ()=>const SingupScreen(),middlewares: [ Mymiddleware() ]),
 // GetPage(name: "/", page: ()=> SingupScreen()),
 
 GetPage(name: Approute.login, page: ()=>const Login()),
 GetPage(name: Approute.signup, page: ()=>const SignUp()),
 GetPage(name: Approute.forgetpassword, page: ()=>const ForgetPassword()),
 GetPage(name: Approute.verfiycode, page: ()=>const VerfiyCode()),
 GetPage(name: Approute.resetpassword, page: ()=>const ResetPassword()),
 GetPage(name: Approute.successResetPassword, page: ()=>const Success_Reset_Password()),
 GetPage(name: Approute.successSignup, page: ()=>const Success_SignUp()),
 GetPage(name: Approute.verifyCodeSignUp, page: ()=>const VerifyCodeSignUp()),
 //onboarding
 GetPage(name: Approute.onboarding, page: ()=>const OnBoarding()),
 //home;
 GetPage(name: Approute.homepage, page: ()=>const homepage()),
 
 GetPage(name: Approute.screenSingup, page: ()=> const SingupScreen()),
 
 GetPage(name: Approute.activity, page: ()=> const Activity()),
GetPage(name: Approute.roomView, page:()=>const RoomView()),
GetPage(name: Approute.logoMeaning, page:()=>const LogoMeaning()),

GetPage(name: Approute.sportmeCart, page:()=>const Supportview()),
GetPage(name: Approute.suggestactivity, page:()=>const Suggestactivity())


];

