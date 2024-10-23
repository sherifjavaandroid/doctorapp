import '../../../controller/drawer/history_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'history_screen_mobile.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final controller = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: HistoryScreenMobileLayout(
        controller: controller,
      ),
    );
  }
}
