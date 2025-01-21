import 'package:fspu/core/constantk/imagesasset.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

abstract class WebviewController extends GetxController{

}
class WebViewControllerImp extends WebviewController{
  int? selet_webview;
  List webview_data=[
    {"title":"وزارة التعليم العالي والبحث العلمي",
    "image":AppImagesasset.osara1},
     {"title":"الجامعة المستنصرية",
    "image":AppImagesasset.mostanserea},
     {"title":"الجامعة التكنو لوجية",
    "image":AppImagesasset.tekno}
  ];
List<WebViewController> controller_webview=[];

  @override
  void onInit() {
     controller_webview=[WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
        ),
      )
..loadRequest(
Uri.parse('https://mohesr.gov.iq/ar')),
WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
        ),
      )
..loadRequest(
Uri.parse('https://www.uomustansiriyah.edu.iq/')),
WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
        ),
      )
..loadRequest(
Uri.parse('https://uotechnology.edu.iq/index.php/ar/')),  ];
    super.onInit();
  }
}