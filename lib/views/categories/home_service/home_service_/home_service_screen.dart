import '../../../../controller/categories/home_service_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'home_service_mobile_layourt.dart';

class HomeServiceScreen extends StatelessWidget {
  HomeServiceScreen({super.key});
  final controller = Get.put(HomeServiceController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: HomeServiceMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
