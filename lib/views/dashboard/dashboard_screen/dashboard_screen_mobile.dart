// ignore_for_file: deprecated_member_use
import 'package:adoctor/language/language_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../backend/backend_utils/custom_loading_api.dart';
import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/services/api_endpoint.dart';
import '../../../controller/dashboard/dashboard_controller.dart';
import '../../../controller/find_doctor/find_doctor_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../data/service_data.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/drawer/drawer_widget.dart';
import '../../../widgets/find_doctor/doctor_details_widget.dart';
import '../../../widgets/others/custom_image_widget.dart';
import '../../../widgets/others/search_box_widget.dart';
import '../../../widgets/others/services_widget.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';

class DashboardScreenMobile extends StatelessWidget {
  DashboardScreenMobile({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final controller = Get.put(DashboardController());
  final findDoctorController = Get.put(FindDoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      key: scaffoldKey,
      appBar: appbarWidget(context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  appbarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Get.isDarkMode
          ? CustomColor.primaryDarkScaffoldBackgroundColor
          : CustomColor.primaryLightScaffoldBackgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          scaffoldKey.currentState!.openDrawer();
        },
        child: Padding(
            padding: EdgeInsets.only(
                left: Dimensions.paddingSize * 0.4,
                right: Dimensions.paddingSize * 0.2),
            child: const Icon(
              Iconsax.element_4,
              color: CustomColor.primaryLightTextColor,
            )),
      ),
      title: Image.network(
        LocalStorage.getAppLogo()!,
        height: Dimensions.heightSize * 2.2,
        width: Dimensions.widthSize * 14,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
              right: Dimensions.paddingSize * 0.5,
              left: Dimensions.paddingSize * 0.5),
          child: InkWell(
            onTap: () {
              LocalStorage.getIsGuest()
                  ? Get.offAllNamed(Routes.signInScreen)
                  : Get.toNamed(Routes.profileScreen);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.paddingSize * .5,
              ),
              child: CustomImageWidget(
                path: Assets.icon.profilecircle,
                height: Dimensions.heightSize * 2,
                width: Dimensions.widthSize * 2.4,
              ),
            ),
          ),
        )
      ],
    );
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
      color: CustomColor.whiteColor,
      backgroundColor: CustomColor.primaryLightColor,
      strokeWidth: 2.5,
      onRefresh: () async {
        controller.getDashboard();
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      child: ListView(
        children: [
          _searchBoxWidget(context),
          Visibility(
            visible: controller.searchTextController.text.isNotEmpty &&
                controller.foundDoctor.value.isNotEmpty,
            child: Column(
              children: [
                _doctorList(context),
              ],
            ),
          ),
          Visibility(
            visible: controller.searchTextController.text.isEmpty ||
                controller.foundDoctor.value.isEmpty,
            child: Column(
              children: [
                _servicesWidget(context),
                _webJournalTextWidget(context),
                _webJournalWidget(context),
                _testimonialsTextWidget(context),
                _testimonialsWidget(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // search box
  _searchBoxWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.8),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.paddingSize * 0.3,
              bottom: Dimensions.paddingSize * 0.3,
              left: Dimensions.paddingSize * 0.15,
            ),
            child: SearchBoxWidget(
                controller: controller.searchTextController,
                buttonOnPressed: () {
                  LocalStorage.saveBranchId(id: controller.branchId.value);
                  LocalStorage.saveDepartmentId(
                      id: controller.departmentId.value);
                  findDoctorController.getDoctorList(
                      LocalStorage.getBranchId(), LocalStorage.getDepartment());
                  Get.toNamed(
                    Routes.findDoctorScreen,
                    arguments: [Strings.findDoctor],
                  );
                },
                onTap: () {
                  controller.searchTextController.clear();

                  controller.filterDoctors('');
                },
                onChanged: (value) {
                  controller.isShowDoctor.value =
                      controller.searchTextController.text.isEmpty;

                  controller.filterDoctors(value);
                },
                resetOnTap: () {},
                hintText: Strings.searchHere.tr),
          ),
        ],
      ),
    );
  }

//service widget
  _servicesWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.marginSizeHorizontal * 0.7,
        right: Dimensions.marginSizeHorizontal * 0.5,
        top: Dimensions.marginSizeHorizontal * 0.5,
      ),
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 90.w,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 7,
          mainAxisSpacing: 2,
        ),
        itemCount: serviceData.length,
        itemBuilder: (context, index) {
          return ServicesWidget(
            onTap: serviceData[index].onTap,
            serviceText: serviceData[index].serviceText,
            iconPath: serviceData[index].iconPath,
          );
        },
      ),
    );
  }

  //popular expert text widget
  _webJournalTextWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize,
          right: Dimensions.paddingSize,
          top: Dimensions.paddingSize * .1,
          bottom: Dimensions.paddingSize * .3),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          TitleHeading4Widget(
            text: Strings.webJournal.tr,
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.headingTextSize3,
          ),
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(
                  controller.dashboardModel.data.webLinks.first.link));
            },
            child: TitleHeading5Widget(
              text: Strings.viewMore.tr,
              fontSize: Dimensions.headingTextSize6,
              color: CustomColor.primaryLightColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  _webJournalWidget(BuildContext context) {
    var data = controller.dashboardModel.data.journal;
    var imagePath = controller.dashboardModel.data.imagePaths.pathLocation;
    return data.isNotEmpty
        ? Container(
            margin: EdgeInsets.only(
                left: Dimensions.marginSizeHorizontal * 0.6,
                top: Dimensions.marginSizeVertical * 0.3),
            height: MediaQuery.of(context).size.height * .23,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize * .25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .53,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: Dimensions.paddingSize,
                              left: Dimensions.paddingSize),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .24,
                            decoration: BoxDecoration(
                              color: CustomColor.customBlueAccent,
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSize * .5),
                              child: Column(
                                crossAxisAlignment: crossStart,
                                mainAxisAlignment: mainEnd,
                                children: [
                                  TitleHeading4Widget(
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                    padding: EdgeInsets.only(
                                        bottom: Dimensions.paddingSize * .1),
                                    text: Get.find<LanguageController>()
                                        .getTranslation(data[index].title),
                                    fontSize: Dimensions.headingTextSize4,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  RichText(
                                    maxLines: 3,
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "${Get.find<LanguageController>().getTranslation(removeHtmlTags(data[index].description.substring(0, 70)))}...",
                                          style: CustomStyle
                                              .darkHeading5TextStyle
                                              .copyWith(
                                            fontSize:
                                                Dimensions.headingTextSize6 - 1,
                                            color: CustomColor
                                                .primaryLightTextColor
                                                .withOpacity(0.4),
                                          ),
                                        ),
                                        TextSpan(
                                          text: Get.find<LanguageController>()
                                              .getTranslation(Strings.viewMore),
                                          style: CustomStyle
                                              .darkHeading5TextStyle
                                              .copyWith(
                                            fontSize:
                                                Dimensions.headingTextSize6,
                                            color:
                                                CustomColor.primaryLightColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.toNamed(Routes.webJournalScreen);
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: Dimensions.paddingSize * .2),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: Dimensions.paddingSize,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .133,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "${ApiEndpoint.mainDomain}/$imagePath/${data[index].image}"),
                                fit: BoxFit.cover,
                              ),
                              color: CustomColor
                                  .primaryLightScaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Column(
            mainAxisAlignment: mainCenter,
            children: [
              verticalSpace(Dimensions.heightSize * 4),
              const TitleHeading3Widget(text: Strings.noDataFound),
              verticalSpace(Dimensions.heightSize * 4),
            ],
          );
  }

  _testimonialsTextWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize,
          right: Dimensions.paddingSize,
          top: Dimensions.paddingSize * .3,
          bottom: Dimensions.paddingSize * .7),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          TitleHeading4Widget(
            text: Strings.testimonials.tr,
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.headingTextSize3,
          ),
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(ApiEndpoint.mainDomain));
            },
            child: TitleHeading5Widget(
              text: Strings.viewMore.tr,
              fontSize: Dimensions.headingTextSize6,
              color: CustomColor.primaryLightColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _testimonialsWidget(BuildContext context) {
    var data = controller.dashboardModel.data.testimonial;
    var imagePath = controller.dashboardModel.data.imagePaths.pathLocation;
    return data.isNotEmpty
        ? SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              // Set the item count to 10
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * .55,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Dimensions.paddingSize * .15,
                        left: Dimensions.paddingSize),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .15,
                      decoration: BoxDecoration(
                        color: CustomColor.customBlueAccent,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSize * .5,
                            vertical: Dimensions.paddingSize * .3),
                        child: Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CircleAvatar(
                                    radius: Dimensions.radius * 2,
                                    backgroundImage: NetworkImage(
                                        "${ApiEndpoint.mainDomain}/$imagePath/${data[index].image}"),
                                  ),
                                ),
                                horizontalSpace(Dimensions.widthSize * .5),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: mainStart,
                                    crossAxisAlignment: crossStart,
                                    children: [
                                      TitleHeading3Widget(
                                        text: Get.find<LanguageController>()
                                            .getTranslation(data[index].name),
                                        fontWeight: FontWeight.w700,
                                        fontSize: Dimensions.headingTextSize5,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                      TitleHeading5Widget(
                                        text: DateFormat("yyyy-MM-dd")
                                            .format(data[index].createdAt)
                                            .toString(),
                                        fontSize:
                                            Dimensions.headingTextSize6 - 3,
                                        color: CustomColor.primaryLightTextColor
                                            .withOpacity(0.5),
                                      ),
                                      TitleHeading5Widget(
                                        text: Get.find<LanguageController>()
                                            .getTranslation(
                                                data[index].designation),
                                        fontSize:
                                            Dimensions.headingTextSize6 - 2,
                                        color: CustomColor.primaryLightColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            TitleHeading5Widget(
                              maxLines: 6,
                              textOverflow: TextOverflow.ellipsis,
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.paddingSize * .2),
                              text: data[index].comment,
                              fontSize: Dimensions.headingTextSize6 - 1,
                              color: CustomColor.primaryLightTextColor
                                  .withOpacity(0.5),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : Column(
            mainAxisAlignment: mainCenter,
            children: [
              verticalSpace(Dimensions.heightSize * 4),
              const TitleHeading3Widget(text: Strings.noDataFound),
              verticalSpace(Dimensions.heightSize * 3),
            ],
          );
  }

  _doctorList(BuildContext context) {
    var data = controller.foundDoctor.value;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return DoctorDetailsWidget(
              onTap: () {
                findDoctorController.slug.value = data[index].slug;
                findDoctorController.name.value = data[index].name;
                findDoctorController.doctorTitle.value =
                    data[index].doctorTitle!;
                Get.toNamed(Routes.doctorProfileScreen);
              },
              image:
                  "${ApiEndpoint.mainDomain}/${controller.dashboardModel.data.doctorImagePaths.pathLocation}/${data[index].image}",
              name: data[index].name,
              designation: data[index].doctorTitle!,
              qualification: data[index].qualification,
              categories: data[index].designation,
              amount: data[index].fees,
              speciality: data[index].speciality,
            );
          }),
    );
  }
}
