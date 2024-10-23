import 'dart:ui';
import '../../../controller/dashboard/dashboard_controller.dart';
import '../../../widgets/others/custom_image_widget.dart';
import '../../backend/model/dashbaord/dashboard_model.dart';
import '../../custom_assets/assets.gen.dart';
import '../../language/language_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../dropdown/custom_dropdown.dart';
import '../dropdown/department_dropdown.dart';

class SearchBoxWidget extends StatefulWidget {
  final String hintText;
  final bool readOnly;
  final void Function(String)? onChanged;
  final void Function()? onTap, resetOnTap;
  final void Function() buttonOnPressed;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController controller;

  const SearchBoxWidget({
    Key? key,
    required this.hintText,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
    required this.buttonOnPressed,
    this.resetOnTap,
    required this.controller,
  }) : super(key: key);

  @override
  State<SearchBoxWidget> createState() => _PrimaryInputFieldState();
}

class _PrimaryInputFieldState extends State<SearchBoxWidget> {
  final secondaryColor = Get.isDarkMode
      ? CustomColor.secondaryDarkColor
      : CustomColor.secondaryLightColor;

  final controller = Get.put(DashboardController());
  final languageController = Get.put(LanguageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.buttonHeight * .8,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: TextFormField(
              readOnly: widget.readOnly,
              controller: widget.controller,
              style: CustomStyle.lightHeading4TextStyle.copyWith(
                  fontSize: Dimensions.headingTextSize3,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.primaryLightColor),
              textAlign: TextAlign.left,
              onTap: () {},
              validator: (value) {
                if (value!.isEmpty) {
                  return Strings.pleaseFillOutTheField.tr;
                } else {
                  return null;
                }
              },
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onFieldSubmitted,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize*0.5),
                hintText:languageController.getTranslation( Strings.searchDoctor.tr),
                hintStyle: Get.isDarkMode
                    ? CustomStyle.darkHeading4TextStyle.copyWith(
                        color:
                            CustomColor.primaryDarkTextColor.withOpacity(0.3),
                        fontWeight: FontWeight.normal,
                        fontSize: Dimensions.heightSize,
                      )
                    : CustomStyle.lightHeading4TextStyle.copyWith(
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.3),
                        fontWeight: FontWeight.normal,
                        fontSize: Dimensions.heightSize * 1.2,
                      ),
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  fontSize: Dimensions.headingTextSize3,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 1.5,
                    color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    width: 1.5,
                    color: CustomColor.primaryLightColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                ),
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimensions.paddingSize*0.5,
                          horizontal: Dimensions.paddingSize * .7),
                      child: CustomImageWidget(
                        height: Dimensions.heightSize * 1.6,
                        width: Dimensions.widthSize * 1.6,
                        path: Assets.icon.search,
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          horizontalSpace(Dimensions.marginSizeHorizontal * .3),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.primaryLightColor,
                borderRadius: BorderRadius.circular(
                  Dimensions.radius * .7,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  _showForgotPasswordDialog(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize * .5,
                      vertical: Dimensions.paddingSize * .5),
                  child: CustomImageWidget(
                    height: Dimensions.heightSize * 3,
                    width: Dimensions.widthSize * 4.5,
                    path: Assets.icon.filterIcon,
                    color: CustomColor.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showForgotPasswordDialog(BuildContext context) {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Dialog(
          insetPadding: EdgeInsets.only(
            left: Dimensions.paddingSize * 1.4,
            right: Dimensions.paddingSize * 1.4,
            bottom: Dimensions.paddingSize * 5,
          ),
          surfaceTintColor: CustomColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize * 0.7,
              vertical: Dimensions.paddingSize * 0.4,
            ),
            child: Column(
              mainAxisSize: mainMin,
              crossAxisAlignment: crossStart,
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: CircleAvatar(
                            backgroundColor: CustomColor.cardLightTextColor,
                            radius: Dimensions.radius * 1.2,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.paddingSize * .25,right: Dimensions.paddingSize*0.2),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: CustomColor.primaryLightColor,
                                  size: Dimensions.iconSizeDefault,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TitleHeading3Widget(
                          text: Strings.filters.tr,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    // InkWell(
                    //   onTap: widget.resetOnTap,
                    //   child: TitleHeading3Widget(
                    //     text: Strings.reset,
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: Dimensions.headingTextSize4,
                    //     color:
                    //         CustomColor.primaryLightTextColor.withOpacity(0.3),
                    //   ),
                    // ),
                  ],
                ),
                Divider(
                  color: CustomColor.cardLightTextColor,
                  height: 2.h,
                ),
                verticalSpace(Dimensions.heightSize),
                CustomDropDown<Branch>(
                  
                  dropDownFieldColor: CustomColor.dropdownFillColor,
                  dropDownIconColor:
                      CustomColor.primaryLightTextColor,
                  titleTextColor:
                      CustomColor.primaryLightTextColor,
                  dropDownColor: CustomColor.whiteColor,
                  items: controller.dashboardModel.data.branch,
                  onChanged: (branch) {
                    controller.selectBranch.value = branch!.name;
                    controller.branchId.value = branch.id;
                    printInfo(info: controller.departmentId.value.toString());
                  },
                  hint:languageController.getTranslation( Strings.selectBranch),
                ),
                verticalSpace(Dimensions.heightSize),
                DepartmentDropDown(
                  itemsList: controller.dashboardModel.data.branchHasDepartment,
                  selectBranch: controller.branchId,
                  selectMethod: controller.selectDepartment,
                  title:"dsfds",
                  onChanged: (value) {
                    controller.selectDepartment.value =
                        value!.hospitalDepartmentName;
                    controller.departmentId.value = value.hospitalDepartmentId;
                    debugPrint('__________________');
                    debugPrint(controller.departmentId.value.toString());
                  },
                ),
                verticalSpace(Dimensions.heightSize),
                PrimaryButton(
                  height: Dimensions.buttonHeight * 0.7,
                  title: Strings.search.tr,
                  onPressed: widget.buttonOnPressed,
                  borderColor: CustomColor.primaryLightColor,
                  buttonColor: CustomColor.primaryLightColor,
                ),
                verticalSpace(Dimensions.heightSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
