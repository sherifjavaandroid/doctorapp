import 'package:adoctor/language/language_controller.dart';

import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/custom_image_widget.dart';

class SearchWidget extends StatefulWidget {
  final String hintText;
  final bool readOnly;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  const SearchWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.onChanged, this.onTap,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _PrimaryInputFieldState();
}

class _PrimaryInputFieldState extends State<SearchWidget> {
  final secondaryColor = Get.isDarkMode
      ? CustomColor.secondaryDarkColor
      : CustomColor.secondaryLightColor;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.buttonHeight * .8,
      child: TextFormField(
      
        readOnly: widget.readOnly,
        controller: widget.controller,
        style: CustomStyle.lightHeading4TextStyle.copyWith(
            fontSize: Dimensions.headingTextSize3,
            fontWeight: FontWeight.w500,
            color: CustomColor.primaryLightColor),
        textAlign: TextAlign.left,
        onTap:widget.onTap,
        validator: (value) {
          if (value!.isEmpty) {
            return Strings.pleaseFillOutTheField.tr;
          } else {
            return null;
          }
        },
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(

          hintText:Get.find<LanguageController>().getTranslation( Strings.searchHere.tr),

          hintStyle: Get.isDarkMode
              ? CustomStyle.darkHeading4TextStyle.copyWith(
                  color: CustomColor.primaryDarkTextColor.withOpacity(0.3),
                  fontWeight: FontWeight.normal,
                  fontSize: Dimensions.heightSize*0.9,
                )
              : CustomStyle.lightHeading4TextStyle.copyWith(
                  color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                  fontWeight: FontWeight.normal,
                  fontSize: Dimensions.heightSize * 1.2,
                ),
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            fontSize: Dimensions.headingTextSize3,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
            borderSide: BorderSide(
              width: 1.5,
              color: CustomColor.primaryLightTextColor.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
            borderSide: const BorderSide(
              width: 1.5,
              color: CustomColor.primaryLightColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize*0.4,
        
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSize * .75,
                    ),
                child: CustomImageWidget(
                  height: Dimensions.heightSize * 1.5,
                  width: Dimensions.widthSize * 1.5,
                  path: Assets.icon.search,
                  color: CustomColor.primaryLightTextColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
