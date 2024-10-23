import '../../../../controller/categories/home_service_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'home_service_preview_mobile_layout.dart';
class HomeServicePreviewScreen extends StatelessWidget {
  HomeServicePreviewScreen({super.key});
  final controller = Get.put(HomeServiceController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: HomeServicePreviewMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
