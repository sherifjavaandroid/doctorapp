import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import '../../../controller/categories/health_package_controller.dart';
import 'heath_package_mobile_layout.dart';


class HealthPackageScreen extends StatelessWidget {
  HealthPackageScreen({super.key});
  final controller = Get.put(HealthController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: HeathPackageMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
