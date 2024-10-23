import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import '../../../controller/profile/profile_update_controller.dart';
import 'profile_mobile_layout.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(ProfileUpdateController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: ProfileMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
