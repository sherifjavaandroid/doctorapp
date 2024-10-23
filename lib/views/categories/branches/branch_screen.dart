
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import '../../../controller/categories/branch_controller.dart';
import 'branch_mobile_layout.dart';

class BranchScreen extends StatelessWidget {
  BranchScreen({super.key});
  final controller = Get.put(BranchController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: BranchMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
