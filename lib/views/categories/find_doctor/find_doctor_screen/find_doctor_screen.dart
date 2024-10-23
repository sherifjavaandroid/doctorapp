
import '../../../../controller/find_doctor/find_doctor_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'find_doctor_mobile_layout.dart';

class FindDoctorScreen extends StatelessWidget {
  FindDoctorScreen({super.key});
  final controller = Get.put(FindDoctorController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: FindDoctorMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
