import 'package:adoctor/language/language_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../backend/model/profile/profile_model.dart';
import '../../utils/basic_screen_imports.dart';

class CountryDropdownInputWidget extends StatelessWidget {
  final RxString selectMethod;
  final List<Country> itemsList;
  final void Function(Country?)? onChanged;
  final String hintText, labelText;
  final bool readOnly;
  final Widget? suffix;
  final IconData iconData;
  final double size;
  final EdgeInsetsGeometry padding;
  final languageController = Get.put(LanguageController());
   CountryDropdownInputWidget({
    Key? key,
    required this.itemsList,
    required this.selectMethod,
    required this.hintText,
    required this.labelText,
    this.readOnly = false,
    this.onChanged,
    this.suffix,
    required this.iconData,
    this.size = 24,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: InputDecorator(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize * 0.5,
              ),
              hintText: languageController.getTranslation(hintText),
              hintStyle: CustomStyle.darkHeading4TextStyle,
              labelText:languageController.getTranslation( labelText),
              labelStyle: CustomStyle.darkHeading4TextStyle,
              alignLabelWithHint: true,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    width: 1.5,
                    color: CustomColor.primaryLightTextColor.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                    width: 1.5, color: CustomColor.primaryLightColor),
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
              suffixIcon: suffix,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: padding,
                    child: Icon(
                      iconData,
                      size: size,
                      color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  hint: Padding(
                    padding: EdgeInsets.only(
                      right: Dimensions.paddingSize * 0.2,
                    ),
                    child: Text(
                      selectMethod.value,
                      style: GoogleFonts.inter(
                        fontSize: Dimensions.headingTextSize4,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.primaryLightColor,
                      ),
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: CustomColor.primaryLightColor,
                    ),
                  ),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  items: itemsList.map<DropdownMenuItem<Country>>((value) {
                    return DropdownMenuItem<Country>(
                      value: value,
                      child: Text(
                        value.name,
                        style: GoogleFonts.inter(
                          color: selectMethod.value == value.name
                              ? CustomColor.primaryLightColor
                              : CustomColor.primaryLightColor,
                          fontSize: Dimensions.headingTextSize4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
