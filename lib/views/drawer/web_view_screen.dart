import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../utils/custom_color.dart';
import '../../widgets/appbar/back_button.dart';
import '../../widgets/text_labels/title_heading2_widget.dart';

class WebPaymentScreen extends StatelessWidget {
  const WebPaymentScreen(
      {super.key, required this.title, required this.url});

  final String title, url;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.close(1);
        return false;
      },
      child: Scaffold(
        backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            leading: BackButtonWidget(
              onTap: () {
                Get.back();
              },
            ),
            elevation: 0,
            centerTitle: true,
            
           title:  TitleHeading2Widget(text: title),
            actions: [
              IconButton(
                  onPressed: () {
                     Get.close(1);
                  },
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode
                        ? CustomColor.blackColor
                        : CustomColor.blackColor,
                  ))
            ],
          ),
        ),
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    String paymentUrl = url;

    return WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {},
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith(paymentUrl)) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(paymentUrl)),
    );
  }
}
