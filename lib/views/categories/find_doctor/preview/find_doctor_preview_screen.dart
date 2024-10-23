import '../../../../controller/find_doctor/appointment_form_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'find_doctor_preview_mobile_layout.dart';

class FindDoctorPreviewScreen extends StatelessWidget {
  FindDoctorPreviewScreen({super.key});
  final controller = Get.put(AppointmentController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: FindDoctorPreviewMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
