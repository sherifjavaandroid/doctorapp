import '../../../../controller/find_doctor/doctor_profile_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'doctor_profile_mobile_layout.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorProfileScreen({super.key});
  final controller = Get.put(DoctorProfileController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: DoctorProfileMobileScreenLayout(
        controller: controller,
      ),
    );
  }
  
}
