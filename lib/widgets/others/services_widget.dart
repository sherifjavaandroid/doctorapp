import 'package:adoctor/utils/basic_screen_imports.dart';

import '../../../../widgets/text_labels/title_heading5_widget.dart';
import '../../../../widgets/others/custom_image_widget.dart';
import '../../utils/basic_widget_imports.dart';

class ServicesWidget extends StatelessWidget {
  final String serviceText;
  final String iconPath;
  final VoidCallback? onTap;
  const ServicesWidget(
      {super.key,
      required this.serviceText,
      this.onTap,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: Dimensions.radius * 2,
            backgroundColor: CustomColor.primaryLightColor,
            child: CustomImageWidget(
              height: Dimensions.heightSize * 1.5,
              width: Dimensions.widthSize * 2.5,
              path: iconPath,
              color: CustomColor.whiteColor,
            ),
          ),
          FittedBox(
            child: TitleHeading5Widget(
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.paddingSize * .25),
              text: serviceText,
              fontSize: Dimensions.headingTextSize6,
              fontWeight: FontWeight.bold,
              color: CustomColor.primaryLightTextColor.withOpacity(0.4),
            ),
          )
        ],
      ),
    );
  }
}
