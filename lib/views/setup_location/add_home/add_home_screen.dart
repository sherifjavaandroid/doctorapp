import '../../../../views/setup_location/add_home/add_home_screen_mobile.dart';

import '../../../../../utils/basic_screen_imports.dart';
import '../../../../../utils/responsive_layout.dart';

class AddHomeScreen extends StatelessWidget {
  const AddHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   const ResponsiveLayout(
      mobileScaffold: AddHomeScreenMobile(),
    );
  }
}