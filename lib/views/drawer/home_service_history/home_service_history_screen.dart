import '../../../controller/drawer/home_service_history_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'home_service_history_mobile_layout.dart';

class HomeServiceHistoryScreen extends StatelessWidget {
  HomeServiceHistoryScreen({super.key});
  final controller = Get.put(HomeHistoryController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: HomeHistoryScreenMobileLayout(
        controller: controller,
      ),
    );
  }
}
