

import '../../views/onBoard/onboard_screen_mobile.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ResponsiveLayout(
      mobileScaffold: OnBoardScreenMobile(),
    );
  }
}