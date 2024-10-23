import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'settings_mobile_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: SettingMobileScreen(
        
      ),
    );
  }
}
