import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../backend/backend_utils/custom_loading_api.dart';
import '../../controller/find_doctor/appointment_form_controller.dart';
import '../appbar/back_button.dart';
import '/routes/routes.dart';
import '/utils/basic_widget_imports.dart';

// ignore: must_be_immutable
class WebPaymentScreens extends StatefulWidget {
  const WebPaymentScreens({super.key});

  @override
  State<WebPaymentScreens> createState() => _WebPaymentScreenState();
}

class _WebPaymentScreenState extends State<WebPaymentScreens> {
  final pController = Get.put(AppointmentController());

  late InAppWebViewController webViewController;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.dashboardScreen);
        return false;
      },
      child: Scaffold(
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
            title: TitleHeading2Widget(text: pController.selectedGateway.value),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.dashboardScreen);
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
        body: Obx(
          () => pController.isAutomaticLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    final paymentUrl = pController.submitAutomaticGatewayModel.data.redirectUrl;

    return Stack(
      children: [
        InAppWebView(
          onProgressChanged: (controller, progress) {},
          initialUrlRequest: URLRequest(url: WebUri(paymentUrl)),
          onWebViewCreated: (controller) {
            webViewController = controller;
            controller.addJavaScriptHandler(
              handlerName: 'jsHandler',
              callback: (args) {},
            );

            debugPrint('object');
          },
          onLoadStart: (controller, url) {
            isLoading.value = true;
          },
          onLoadStop: (controller, url) {
            controller
                .evaluateJavascript(
                    source: 'document.querySelector("pre").innerText;')
                .then((result) {
              if (result != null) {}
            });
            if (url.toString().contains('stripe/payment/success') ||
                url.toString().contains('sslcommerz/success') ||
                url.toString().contains('success/response') ||
                url.toString().contains('/callback')) {
              Get.offAllNamed(Routes.commonSuccessScreen, arguments: [
                Strings.appointmentSuccess,
                Routes.dashboardScreen,
              ]);
            }
            isLoading.value = false;
          },
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (context, isLoading, _) {
            return isLoading
                ? const Center(child: CustomLoadingAPI())
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
