// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:iconsax/iconsax.dart';

import '../../backend/backend_utils/custom_loading_api.dart';
import '../../backend/local_storage/local_storage.dart';
import '../../controller/auth/sign_out/sign_out_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/custom_container.dart';
import '../others/custom_image_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.34,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            Dimensions.radius * 2,
          ),
        )),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        child: ListView(
          children: [
            _iconImage(context),
            LocalStorage.getIsGuest() ? Container() : _userImgWidget(context),
            LocalStorage.getIsGuest() ? Container() : _userTextWidget(context),
            _drawerWidget(context),
          ],
        ),
      ),
    );
  }

  _iconImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.4),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Iconsax.arrow_left),
            ),
          ),
          Image.network(
            LocalStorage.getAppLogo()!,
            height: Dimensions.heightSize * 4,
            width: Dimensions.widthSize * 15,
          ),
        ],
      ),
    );
  }

  _userImgWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSizeVertical),
      width: MediaQuery.of(context).size.width * 0.37,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).primaryColor, width: 3),
      ),
      child: Center(
        child: CircleAvatar(
          radius: Dimensions.radius * 5.8,
          backgroundColor: Colors.transparent,
          child: CircleAvatar(
            backgroundColor: CustomColor.secondaryLightColor.withOpacity(0.3),
            radius: Dimensions.radius * 5.5,
            child: ClipOval(
              child: FadeInImage(
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(LocalStorage.getImage()!),
                placeholder: AssetImage(Assets.clipart.sampleProfile.path),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    Assets.clipart.sampleProfile.path,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  _userTextWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: LocalStorage.getUsername()!,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
          TitleHeading4Widget(
            text: LocalStorage.getEmail()!,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
          verticalSpace(Dimensions.heightSize * 2)
        ],
      ),
    );
  }

  _drawerWidget(BuildContext context) {
    final logOutController = Get.put(LogOutController());
    return Column(
      crossAxisAlignment: crossStart,
      mainAxisAlignment: mainCenter,
      children: [
        LocalStorage.getIsGuest()
            ? Container()
            : _drawerTileWidget(
                Assets.icon.historyDrawer,
                Strings.history,
                onTap: () {
                  Get.toNamed(Routes.historyScreen);
                },
              ),
        LocalStorage.getIsGuest()
            ? Container()
            : _drawerTileWidget(
                Assets.icon.home3,
                Strings.homeServiceHistory,
                onTap: () {
                  Get.toNamed(Routes.homeServiceHistory);
                },
              ),
        LocalStorage.getIsGuest()
            ? Container()
            : _drawerTileWidget(
                Assets.icon.settings,
                Strings.setting,
                onTap: () {
                  Get.toNamed(Routes.settingScreen);
                },
              ),
        _drawerTileWidget(
          Assets.icon.helpCenter,
          Strings.helpCenter,
          onTap: () {
            Get.toNamed(Routes.helpCenter);
          },
        ),
        _drawerTileWidget(
          Assets.icon.privacyPolicy,
          Strings.privacyPolicy,
          onTap: () {
            Get.toNamed(Routes.privacyPolicy);
          },
        ),
        _drawerTileWidget(
          Assets.icon.aboutUs,
          Strings.aboutUs,
          onTap: () {
            Get.toNamed(Routes.aboutUs);
          },
        ),
        LocalStorage.getIsGuest()
            ? _buttonWidget(context)
            : _drawerTileWidget(
                Assets.icon.signOut,
                Strings.signOut,
                onTap: () {
                  signOutDialog(context, logOutController);
                },
              ),
      ],
    );
  }

  _drawerTileWidget(icon, title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize,
          vertical: Dimensions.paddingSize * 0.2,
        ),
        child: Row(
          crossAxisAlignment: crossStart,
          mainAxisAlignment: mainStart,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: Dimensions.heightSize * 2.5,
                width: Dimensions.widthSize * 3.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
                  color: CustomColor.whiteColor.withOpacity(0.2),
                ),
                child: Container(
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius * 0.7,
                    ),
                    color: CustomColor.primaryLightColor,
                  ),
                  child: CustomImageWidget(
                    path: icon,
                    height: 21,
                    width: 21,
                  ),
                ),
              ),
            ),
            horizontalSpace(Dimensions.widthSize),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.32),
                child: TitleHeading3Widget(
                  text: title,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: PrimaryButton(
          title: Strings.signIn.tr,
          fontWeight: FontWeight.w500,
          buttonTextColor: Get.isDarkMode
              ? CustomColor.primaryBGDarkColor
              : CustomColor.primaryBGLightColor,
          fontSize: Dimensions.headingTextSize3,
          onPressed: () {
            Get.offAllNamed(Routes.signInScreen);
          },
          borderColor: Get.isDarkMode
              ? CustomColor.primaryDarkColor
              : CustomColor.primaryLightColor,
          buttonColor: Get.isDarkMode
              ? CustomColor.primaryDarkColor
              : CustomColor.primaryLightColor,
        ));
  }

  signOutDialog(BuildContext context, LogOutController logOutController) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Dialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
            ),
            child: Padding( 
              padding: EdgeInsets.all(Dimensions.paddingSize),
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisSize: mainMin,
                children: [
                  TitleHeading2Widget(
                    text: Strings.signOutAlert,
                    textAlign: TextAlign.start,
                  ),
                  verticalSpace(Dimensions.heightSize),
                  const TitleHeading4Widget(
                    text: Strings.doyousignout,
                    textAlign: TextAlign.start,
                    opacity: 0.80,
                  ),
                  verticalSpace(Dimensions.heightSize),

                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: CustomContainer(
                            height: Dimensions.buttonHeight * 0.7,
                            borderRadius: Dimensions.radius * 0.8,
                            color: Get.isDarkMode
                                ? CustomColor.primaryBGLightColor
                                    .withOpacity(0.15)
                                : CustomColor.primaryBGDarkColor
                                    .withOpacity(0.15),
                            child:  const TitleHeading4Widget(
                              text: Strings.no,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(Dimensions.widthSize),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            logOutController.logOutProcess();
                          },
                          child: Obx(
                            () => logOutController.isLoading
                                ? const CustomLoadingAPI()
                                : CustomContainer(
                                    height: Dimensions.buttonHeight * 0.7,
                                    borderRadius: Dimensions.radius * 0.8,
                                    color: CustomColor.primaryLightColor,
                                    child: const TitleHeading4Widget(
                                      text: Strings.yes,
                                      color: CustomColor.whiteColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ).paddingAll(Dimensions.paddingSize * 0.5),
             

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
