
import '../../../controller/drawer/change_password_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'change_password_mobile_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final controller = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: ChangePasswordMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
