import '../../../views/setup_location/setup_location_screen/setup_location_screen_mobile.dart';
import '../../../../../utils/basic_screen_imports.dart';
import '../../../../../utils/responsive_layout.dart';

class SetupLocationScreen extends StatefulWidget {
  const SetupLocationScreen({Key? key}) : super(key: key);

  @override
  State<SetupLocationScreen> createState() => _SetupLocationScreenState();
}

class _SetupLocationScreenState extends State<SetupLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return   const ResponsiveLayout(
      mobileScaffold: SetupLocationScreenMobile(),
    );
  }
}