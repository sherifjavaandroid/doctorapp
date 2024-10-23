import '../custom_assets/assets.gen.dart';
import '../routes/routes.dart';
import '../utils/basic_screen_imports.dart';
import '../widgets/others/services_widget.dart';

List<ServicesWidget> serviceData = [
  ServicesWidget(
    serviceText: Strings.findDoctor,
    iconPath: Assets.icon.findDoctorIcon,
    onTap: () {
      Get.toNamed(
        Routes.findDoctorScreen,
        arguments: [Strings.findDoctor],
      );
    },
  ),
  ServicesWidget(
    serviceText: Strings.doctorList,
    iconPath: Assets.icon.doctorList,
    onTap: () {
      Get.toNamed(
        Routes.findDoctorScreen,
        arguments: [Strings.doctorList],
      );
    },
  ),
  ServicesWidget(
    serviceText: Strings.investigation,
    iconPath: Assets.icon.investigationIcon,
    onTap: () {
      Get.toNamed(Routes.investigationScreen);
    },
  ),
  ServicesWidget(
    serviceText: Strings.homeService,
    iconPath: Assets.icon.homeServiceIcon,
    onTap: () {
      Get.toNamed(Routes.homeServiceScreen);
    },
  ),
  ServicesWidget(
    serviceText: Strings.healthPackage,
    iconPath: Assets.icon.healthPackageIcon,
    onTap: () {
      Get.toNamed(Routes.healthPackageScreen);
    },
  ),
  ServicesWidget(
    serviceText: Strings.branches,
    iconPath: Assets.icon.branchesIcon,
    onTap: () {
      Get.toNamed(Routes.branchScreen);
    },
  )
];
