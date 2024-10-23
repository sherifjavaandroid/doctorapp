import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import '../../../controller/categories/investigation/investigation_controller.dart';
import 'investigation_mobile_layout.dart';

class InvestigationScreen extends StatelessWidget {
  InvestigationScreen({super.key});
  final controller = Get.put(InvestigationController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: InvestigationMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
