//فيها جميع روابط الباك ايند

class Applink {
  static const String server = "https://karar.io/fspuphp";

  static const String test = "$server/test.php";
//====================AUTH=====================//
  static const signUp = "$server/auth/signup.php";
  static const verfiycodesignup = "$server/auth/verfiycode.php";
  static const logIn = "$server/auth/login.php";
//====================forgetpassword=====================//
  static const checkemail = "$server/forgetpassword/checkemail.php";
  static const resetpassword = "$server/forgetpassword/resetpassword.php";
  static const verfiycodeforget = "$server/forgetpassword/verfiycodeforget.php";
//====================home=====================//
  static const home = "$server/home.php";
/////////////////////////images//////////////////////
  static const String imagestatic = "https://karar.io/ecommerce1/upload";
  static const String imagescatigores = "$imagestatic/categories";
  static const String imagesitems = "$imagestatic/items";
///////////////////fspu////////////

///////////home////////////
  static const slider = "$server/slider.php";
  static const getcount = "$server/getAllCount.php";
////////image//////////////
  static const imageslider = "$server/upload";
//////university/////////

  static const university = "$server/university/getun.php";

  static const universityplus = "$server/university/plusun.php";
////////////////activity/////////////
  static const activity_view = "$server/activity/view.php";

  static const activity_delet = "$server/activity/delet.php";

  static const activity_add = "$server/activity/add.php";
 
    static const activityAddNewActivity = "$server/activity/addnewactivity.php";
////////////////points/////////////
  static const pluspoints = "$server/plus_points.php";

  static const getpoints = "$server/home/getpoints.php";

  static const getwining = "$server/gewining.php";
//hall

  static const hallview = "$server/hall/viewhall.php";
  static const hallimage = "$server/hall/image.php";
  static const hallresrvation = "$server/hall/listdata.php";
}
