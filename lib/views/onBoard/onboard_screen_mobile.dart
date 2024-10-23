import 'package:carousel_slider/carousel_slider.dart';

import '../../controller/settings/on_board_controller.dart';
import '../../utils/basic_screen_imports.dart';

class OnBoardScreenMobile extends StatelessWidget {
  OnBoardScreenMobile({super.key});

   final controller = Get.put(OnBoardScreenController());
  //  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: CarouselSlider.builder(
                itemCount:
                    controller.appSettingsController.onboardScreen.isEmpty
                        ? controller.selectedPageIndex.value
                        : controller.appSettingsController.onboardScreen.length,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  enlargeFactor: 0.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, _) {
                    controller.selectedPageIndex.value = index;
                  },
                ),
                itemBuilder: (context, index, i) {
                  var data =
                      controller.appSettingsController.onboardScreen[index];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          data.image!,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        verticalSpace(MediaQuery.of(context).size.height * .58),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: Dimensions.paddingSize),
                          child: Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                controller
                                    .appSettingsController.onboardScreen.length,
                                (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin: EdgeInsets.only(
                                      right:
                                          Dimensions.marginSizeHorizontal * .3),
                                  height: index ==
                                          controller.selectedPageIndex.value
                                      ? Dimensions.heightSize * .55
                                      : Dimensions.heightSize * .55,
                                  width: index ==
                                          controller.selectedPageIndex.value
                                      ? Dimensions.widthSize * 1.75
                                      : Dimensions.widthSize * .75,
                                  decoration: BoxDecoration(
                                    color: index ==
                                            controller.selectedPageIndex.value
                                        ? CustomColor.primaryLightColor
                                        : CustomColor.primaryLightColor
                                            .withOpacity(.3),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TitleHeading1Widget(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSize * 2.1),
                          text: data.title!,
                          textAlign: TextAlign.center,
                          fontSize: Dimensions.headingTextSize1,
                          fontWeight: FontWeight.w600,
                        ),
                        verticalSpace(Dimensions.heightSize * 1.1),
                        TitleHeading4Widget(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSize * 1.4),
                          text: data.subTitle!,
                          opacity: .30,
                          textAlign: TextAlign.center,
                          fontSize: Dimensions.headingTextSize5,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .70),
          child: Center(
              child: InkWell(
            onTap: () {
              controller.pageNavigate();
            },
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.primaryLightColor,
                borderRadius: BorderRadius.circular(Dimensions.radius * 5),
              ),
              height: Dimensions.heightSize * 3.4,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.widthSize * 2.5,
                  vertical: Dimensions.heightSize),
              child: TitleHeading3Widget(
                text: Strings.getStarted.tr,
                fontWeight: FontWeight.w500,
                color: CustomColor.whiteColor,
              ),
            ),
          )),
        ),
      ],
    );
  }
}
