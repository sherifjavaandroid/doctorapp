import 'package:flutter/material.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import 'custom_title_heading_widget.dart';
import 'title_heading1_widget.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.crossAxisAlignment = CrossAxisAlignment.start})
      : super(key: key);
  final String title, subtitle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        TitleHeading1Widget(
          text: title,
          padding: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.3),
        ),
        CustomTitleHeadingWidget(
          text: subtitle,
          textAlign: TextAlign.center,
          style: CustomStyle.darkHeading4TextStyle.copyWith(
            fontSize: Dimensions.headingTextSize4,
            fontWeight: FontWeight.w500,
            color: CustomColor.primaryLightTextColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
