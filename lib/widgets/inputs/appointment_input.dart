import 'package:adoctor/language/language_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/basic_screen_imports.dart';

class InputFieldWidget extends StatefulWidget {
  final String hint;
  final String? icon;
  final String? labelText;
  final int maxLines;
  final bool isValidator;
  final TextInputType? keyboardTypeC;
  final bool readOnly;
  final EdgeInsetsGeometry? paddings;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final ValueChanged? onChanged;
  final bool? optional;

  const InputFieldWidget({
    Key? key,
    required this.controller,
    required this.hint,
    this.icon,
    this.isValidator = true,
    this.optional = false,
    this.maxLines = 1,
    this.paddings,
    this.labelText,
    this.keyboardTypeC,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  State<InputFieldWidget> createState() => _PrimaryInputWidgetState();
}

class _PrimaryInputWidgetState extends State<InputFieldWidget> {
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  final languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TitleHeading4Widget(
              text: languageController.getTranslation(widget.labelText ?? ""),
              fontSize: Dimensions.headingTextSize3 + 2,
              fontWeight: FontWeight.w500,
              color: CustomColor.primaryLightTextColor,
            ),
            horizontalSpace(Dimensions.heightSize * 0.4),
            Visibility(
              visible: widget.optional!,
              child: TitleHeading4Widget(
                text: (Strings.optional),
                fontSize: Dimensions.headingTextSize3 + 2,
                fontWeight: FontWeight.w500,
                color: CustomColor.optionalColor,
              ),
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 0.3),
        TextFormField(
          scrollPadding: EdgeInsets.only(
            bottom: Dimensions.appBarHeight,
          ),
          readOnly: widget.readOnly,
          validator: widget.isValidator == false
              ? null
              : (String? value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
          textInputAction: TextInputAction.next,
          controller: widget.controller,
          onTap: widget.onTap,
          onFieldSubmitted: (value) {
            setState(() {
              focusNode!.unfocus();
            });
          },
          onChanged: widget.onChanged,
          focusNode: focusNode,
          textAlign: TextAlign.left,
          style: Get.isDarkMode
              ? CustomStyle.darkHeading3TextStyle
              : GoogleFonts.inter(
                  fontSize: Dimensions.headingTextSize3 + 2,
                  fontWeight: FontWeight.w400,
                  color: CustomColor.primaryLightColor,
                ),
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardTypeC,
          decoration: InputDecoration(
            labelStyle: CustomStyle.darkHeading3TextStyle,
            hintText: languageController.getTranslation(widget.hint),
            hintStyle: Get.isDarkMode
                ? GoogleFonts.inter(
                    fontSize: Dimensions.headingTextSize3 + 2,
                    fontWeight: FontWeight.w400,
                    color: CustomColor.primaryBGDarkColor.withOpacity(0.2),
                  )
                : GoogleFonts.inter(
                    fontSize: Dimensions.headingTextSize3 + 2,
                    fontWeight: FontWeight.w400,
                    color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                  ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
              borderSide: BorderSide(
                width: 2,
                color: CustomColor.primaryLightTextColor.withOpacity(0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide: const BorderSide(
                  width: 2, color: CustomColor.primaryLightColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide:
                  const BorderSide(width: 1.5, color: CustomColor.redColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide:
                  const BorderSide(width: 1.5, color: CustomColor.redColor),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: Dimensions.heightSize * 1.7,
              vertical: Dimensions.heightSize,
            ),
          ),
        ),
      ],
    );
  }
}
