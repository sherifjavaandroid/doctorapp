import 'package:adoctor/language/language_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/find_doctor/appointment_form_controller.dart';
import '../../utils/basic_screen_imports.dart';

class AppointmentAgeDropdown extends StatefulWidget {
  final String hint, icon;
  final String? labelText;
  final int maxLines;
  final bool isValidator;
  final TextInputType? keyboardTypeC;
  final bool readOnly;
  final EdgeInsetsGeometry? paddings;
  final TextEditingController controller;
  final RxString currency;
  final List<SendMoneyModel> itemsList;
  final void Function(SendMoneyModel?)? onChanged;
  const AppointmentAgeDropdown({
    Key? key,
    required this.controller,
    required this.hint,
    this.icon = "",
    this.isValidator = true,
    this.maxLines = 1,
    this.paddings,
    this.labelText,
    this.keyboardTypeC,
    this.readOnly = false,
    required this.currency,
    required this.itemsList,
    this.onChanged,
  }) : super(key: key);

  @override
  State<AppointmentAgeDropdown> createState() => _PrimaryInputWidgetState();
}

class _PrimaryInputWidgetState extends State<AppointmentAgeDropdown> {
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
        TitleHeading4Widget(
          text: widget.labelText ?? "",
          fontSize: Dimensions.headingTextSize3 + 2,
          fontWeight: FontWeight.w500,
          color: CustomColor.primaryLightTextColor,
        ),
        verticalSpace(Dimensions.heightSize * 0.3),
        TextFormField(
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
          onTap: () {
            setState(() {
              focusNode!.requestFocus();
            });
          },
          onFieldSubmitted: (value) {
            setState(() {
              focusNode!.unfocus();
            });
          },
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
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),

            /// decimal with 2 value after point
            LengthLimitingTextInputFormatter(7),
          ],
          decoration: InputDecoration(
            labelStyle: CustomStyle.darkHeading3TextStyle,
            hintText: languageController.getTranslation( widget.hint),
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
              vertical: Dimensions.heightSize*0.8,
            ),
            suffixIcon: Container(
              
              padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize*0.2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(Dimensions.radius * 0.5),
                    topRight: Radius.circular(Dimensions.radius * 0.5),
                  ),
                  color: CustomColor.ageDropdownColor),
              width: 105.w,
              child: Obx(
                () => DropdownButton2(
                  isExpanded: true,
                  underline: Container(),
                  hint: Padding(
                    padding:  EdgeInsets.only(top: 8.0.h, left: 5.w),
                    child: TitleHeading4Widget(
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      text: widget.currency.value,
                      fontSize: Dimensions.headingTextSize3,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.primaryLightColor,
                    ),
                  ),
                  iconStyleData: IconStyleData(
                    icon: Padding(
                      padding:  EdgeInsets.only(right: 8.0.w, top: 8.h),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.3),
                      ),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 130.h,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius),
                      color: CustomColor.whiteColor,
                    ),
                    elevation: 0,
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: WidgetStateProperty.all<double>(6),
                      thumbVisibility: WidgetStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData:  MenuItemStyleData(
                    height: 40.h,
                    padding:  EdgeInsets.only(left: 14.w, right: 14.w),
                  ),
                  items: widget.itemsList
                      .map<DropdownMenuItem<SendMoneyModel>>((value) {
                    return DropdownMenuItem<SendMoneyModel>(
                      value: value,
                      child: TitleHeading3Widget(
                        padding: EdgeInsets.only(
                          left: Dimensions.paddingSize * 0.1,
                        ),
                        text: value.title,
                      ),
                    );
                  }).toList(),
                  onChanged: widget.onChanged,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
