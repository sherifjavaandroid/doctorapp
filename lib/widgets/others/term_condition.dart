import '../../utils/basic_widget_imports.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({Key? key, required this.isChecked, this.onChecked})
      : super(key: key);
  final RxBool isChecked;
  final void Function(bool)? onChecked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Dimensions.radius * .4),
      onTap: () {
        isChecked.value = !isChecked.value;
        onChecked!(isChecked.value);
      },
      child:  Obx(
        () => Row(
          children: [
            Container(
              height: Dimensions.heightSize * 1.2,
              width: Dimensions.widthSize * 1.56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * .3),
                color: isChecked.value
                    ? CustomColor.whiteColor
                    : CustomColor.primaryLightColor,
                border: Border.all(
                  width: 1.5,
                  color: CustomColor.primaryLightTextColor.withOpacity(0.2),
                ),
              ),
              child: Icon(
                Icons.check,
                size: Dimensions.heightSize,
                color: isChecked.value ? CustomColor.whiteColor : Colors.white,
              ),
            ),
            horizontalSpace(Dimensions.widthSize*0.4),
            CustomTitleHeadingWidget(
              text: Strings.agreeWith.tr,
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading5TextStyle.copyWith(
                      fontSize: Dimensions.headingTextSize4,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.primaryDarkTextColor.withOpacity(.30),
                      letterSpacing: .01,
                      wordSpacing: .01)
                  : CustomStyle.lightHeading5TextStyle.copyWith(
                      fontSize: Dimensions.headingTextSize4,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.primaryLightTextColor.withOpacity(.30),
                      letterSpacing: .01,
                      wordSpacing: .01),
            ),
          ],
        ),
      ),
    );
  }
}
