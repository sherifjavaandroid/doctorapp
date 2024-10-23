import 'package:iconsax/iconsax.dart';
import '../../../backend/backend_utils/custom_loading_api.dart';
import '../../../controller/profile/profile_update_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/inputs/country_picker_input_widget.dart';
import '../../../widgets/inputs/phone_number_with_contry_code_input.dart';
import '../../../widgets/others/custom_image_widget.dart';
import '../../../widgets/others/profile_image_picker.dart';

class ProfileMobileScreenLayout extends StatelessWidget {
  ProfileMobileScreenLayout({super.key, required this.controller});
  final ProfileUpdateController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.profile,
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _imageProfile(context),
        _titleSubTitle(context),
        _inputWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _imageProfile(BuildContext context) {
    return const ProfileViewWidget();
  }

  _titleSubTitle(BuildContext context) {
    var data = controller.profileModel.data.userInfo;
    return Column(
      children: [
        verticalSpace(
          Dimensions.heightSize * 1.5,
        ),
        TitleHeading2Widget(
            fontSize: Dimensions.headingTextSize2 + 1, text: data.username),
        verticalSpace(
          Dimensions.heightSize * 0.2,
        ),
        Row(
          mainAxisAlignment: mainCenter,
          children: [
            TitleHeading3Widget(
              text: data.email,
              color: CustomColor.primaryLightTextColor.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
            horizontalSpace(Dimensions.widthSize * 0.5),
            CustomImageWidget(
              path: Assets.clipart.confirmation,
              height: 13,
              width: 13,
            ),
          ],
        ),
        verticalSpace(
          Dimensions.heightSize * 1.5,
        ),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.7),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            verticalSpace(Dimensions.heightSize * 2),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextInputWidget(
                    keyboardType: TextInputType.text,
                    controller: controller.firstNameController,
                    hintText: Strings.enterFirstName.tr,
                    labelText: Strings.firstName.tr,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * .5,
                    ),
                    iconData: Iconsax.user,
                  ),
                ),
                horizontalSpace(Dimensions.widthSize),
                Expanded(
                  child: PrimaryTextInputWidget(
                    keyboardType: TextInputType.text,
                    controller: controller.lastNameController,
                    hintText: Strings.enterLastName.tr,
                    labelText: Strings.lastName.tr,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * .5,
                    ),
                    iconData: Iconsax.user,
                  ),
                ),
              ],
            ),
            verticalSpace(Dimensions.heightSize * 1.5),
            CountryDropdownInputWidget(
              selectMethod: controller.selectedCountry.isEmpty
                  ? controller.selectedCountry2
                  : controller.selectedCountry,
              itemsList: controller.profileModel.data.countries,
              hintText: Strings.selectCountry,
              labelText: Strings.country,
              iconData: Iconsax.global,
              size: Dimensions.heightSize * 2,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              onChanged: (value) {
                controller.selectedCountry.value = value!.name;
                controller.selectedCountryCode.value = value.mobileCode;
                printInfo(info: controller.selectedCountry.value);
              },
            ),
            verticalSpace(Dimensions.heightSize * 1.5),
            PhoneNumberInputWidget(
              mobileCode: controller.selectedCountryCode.value,
              keyboardType: TextInputType.number,
              controller: controller.phoneNumberController,
              hintText: "***",
              labelText: Strings.phoneNumber.tr,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .4,
              ),
              iconData: Iconsax.call,
            ),
            verticalSpace(Dimensions.heightSize * 1.5),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextInputWidget(
                    keyboardType: TextInputType.text,
                    controller: controller.addressController,
                    hintText:Strings.enterAddress .tr,
                    labelText: Strings.address.tr,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * .5,
                    ),
                    iconData: Iconsax.location,
                  ),
                ),
                horizontalSpace(Dimensions.widthSize),
                Expanded(
                  child: PrimaryTextInputWidget(
                    keyboardType: TextInputType.text,
                    controller: controller.cityController,
                    hintText:Strings.enterCity.tr,
                    labelText: Strings.city.tr,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * .5,
                    ),
                    iconData: Iconsax.building,
                  ),
                ),
              ],
            ),
            verticalSpace(Dimensions.heightSize * 1.5),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextInputWidget(
                    keyboardType: TextInputType.text,
                    controller: controller.stateController,
                    hintText: Strings.enterState.tr,
                    labelText: Strings.state.tr,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * .5,
                    ),
                    iconData: Iconsax.buildings,
                  ),
                ),
                horizontalSpace(Dimensions.widthSize),
                Expanded(
                  child: PrimaryTextInputWidget(
                    keyboardType: TextInputType.number,
                    controller: controller.zipCodeController,
                    hintText: Strings.enterZipCode.tr,
                    labelText: Strings.zipCode.tr,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * .5,
                    ),
                    iconData: Iconsax.discover,
                  ),
                ),
              ],
            ),
            verticalSpace(Dimensions.heightSize),
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.9,
          vertical: Dimensions.marginSizeVertical),
      child: Obx(
        () => controller.isUpdateLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.update,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (controller.imageController.isImagePathSet.value) {
                      controller.profileUpdateWithImageProcess();
                    } else {
                      controller.profileUpdateWithOutImageProcess();
                    }
                  }
                },
              ),
      ),
    );
  }
}
