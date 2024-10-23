import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/custom_image_widget.dart';

class BranchesWidget extends StatelessWidget {
  const BranchesWidget({
    super.key,
    required this.title,
    required this.email,
    required this.web,
    required this.details,
  });
  final String title, email, web, details;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.2),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.4,
        vertical: Dimensions.paddingSize * 0.4,
      ),
      decoration: ShapeDecoration(
        color: CustomColor.customBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: crossStart,
              mainAxisAlignment: mainStart,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: Dimensions.paddingSize * 1.4),
                  child: CircleAvatar(
                    radius: Dimensions.radius * 3,
                    backgroundColor: CustomColor.primaryLightColor,
                    child: CustomImageWidget(
                      path: Assets.icon.branchesIcon,
                      height: Dimensions.heightSize * 1.8,
                      width: Dimensions.heightSize * 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                TitleHeading3Widget(
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  text: title,
                  fontWeight: FontWeight.w700,
                  fontSize: Dimensions.headingTextSize2,
                ),
                verticalSpace(Dimensions.heightSize * 0.3),
                TitleHeading4Widget(
                  maxLines: 4,
                  textOverflow: TextOverflow.ellipsis,
                  text: details,
                  fontSize: Dimensions.headingTextSize5,
                  color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                  fontWeight: FontWeight.w500,
                ),
                verticalSpace(Dimensions.heightSize * 0.2),
                Row(
                  mainAxisAlignment: mainStart,
                  children: [
                    TitleHeading3Widget(
                      textAlign: TextAlign.center,
                      text: Strings.emails,
                      fontSize: Dimensions.headingTextSize5,
                      color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                    ),
                    horizontalSpace(Dimensions.widthSize * 0.3),
                    TitleHeading3Widget(
                      textAlign: TextAlign.center,
                      text: email,
                      fontSize: Dimensions.headingTextSize5,
                      color: CustomColor.primaryLightColor,
                    ),
                  ],
                ),
                verticalSpace(Dimensions.heightSize * 0.2),
                Row(
                  mainAxisAlignment: mainStart,
                  children: [
                    TitleHeading3Widget(
                      textAlign: TextAlign.center,
                      text: Strings.web,
                      fontSize: Dimensions.headingTextSize5,
                      color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                    ),
                    horizontalSpace(Dimensions.widthSize * 0.3),
                    TitleHeading3Widget(
                      textAlign: TextAlign.center,
                      text: web,
                      fontSize: Dimensions.headingTextSize5,
                      color: CustomColor.primaryLightColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
