
import '../../../../controller/find_doctor/appointment_form_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'appointment_mobile_layout.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});
  final controller = Get.put(AppointmentController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: AppointmentScreenMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
