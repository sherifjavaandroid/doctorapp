import 'package:adoctor/language/language_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/basic_widget_imports.dart';

class CustomDialog {
  static show(
      {required String title,
      required String subtitle,
      required VoidCallback cancelOnTap,
      required VoidCallback confirmOnTap}) {
    final languageController = Get.put(LanguageController());
    return Get.defaultDialog(
        title:languageController.getTranslation( title),
        titleStyle: GoogleFonts.inter(
          fontSize: Dimensions.headingTextSize2,
          fontWeight: FontWeight.bold,
          color: CustomColor.primaryLightTextColor.withOpacity(0.6),
        ),
        content: CustomTitleHeadingWidget(
          text: subtitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: Dimensions.headingTextSize3 * 1.06,
            fontWeight: FontWeight.w500,
            color: CustomColor.primaryLightTextColor.withOpacity(0.6),
          ),
        ),
        confirm: TextButton(
            onPressed: confirmOnTap,
            child: Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
              decoration: BoxDecoration(
                  color: CustomColor.redColor,
                  borderRadius: BorderRadius.circular(5)),
              child: CustomTitleHeadingWidget(
                text: Strings.yes,
                style: GoogleFonts.inter(
                  fontSize: Dimensions.headingTextSize3 * 1.06,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whiteColor,
                ),
              ),
            )),
        cancel: TextButton(
            onPressed: cancelOnTap,
            child: Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
              decoration: BoxDecoration(
                  color: CustomColor.greenColor,
                  borderRadius: BorderRadius.circular(5)),
              child: CustomTitleHeadingWidget(
                text: Strings.no,
                style: GoogleFonts.inter(
                  fontSize: Dimensions.headingTextSize3 * 1.06,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whiteColor,
                ),
              ),
            )),
        radius: 10.0.r);
  }
}
