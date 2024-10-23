import 'package:iconsax/iconsax.dart';

import '../../language/language_controller.dart';
import '../../utils/basic_widget_imports.dart';

class PasswordInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText, labelText;
  final bool readOnly;
  final Function? onTap;
  final int maxLine;
  final Widget? suffix;
  //final Color? suffixColor;
  final IconData iconData;
  final double size;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final ValueChanged? onChanged;
  final TextInputType? keyboardType;

  const PasswordInputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.suffix,
    required this.iconData,
    this.size = 24,
    required this.padding,
    this.maxLine = 1,
    this.keyboardType,
    // this.suffixColor ,

    this.color = Colors.white,
  }) : super(key: key);

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  FocusNode? focusNode;
  bool isVisibility = true;

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
    final iconData = widget.iconData;
    final size = widget.size;

    return Column(
      children: [
        SizedBox(
          child: Obx(
            ()=> TextFormField(
              style: CustomStyle.darkHeading4TextStyle
                  .copyWith(color: CustomColor.primaryLightColor),
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              readOnly: widget.readOnly,
              maxLines: widget.maxLine,
              onChanged: widget.onChanged,
              onTap: widget.readOnly
                  ? () {
                      widget.onTap!();
                    }
                  : () {
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
              validator: (value) {
                if (value!.isEmpty) {
                  return Strings.pleaseFillOutTheField.tr;
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                hintText: languageController.getTranslation(widget.hintText),
                hintStyle: focusNode!.hasFocus
                    ? CustomStyle.darkHeading4TextStyle.copyWith(
                        color: CustomColor.primaryDarkTextColor.withOpacity(.30))
                    : CustomStyle.darkHeading4TextStyle.copyWith(
                        color: CustomColor.primaryDarkTextColor.withOpacity(.30)),
                labelText: languageController.getTranslation(widget.labelText),
                labelStyle: focusNode!.hasFocus
                    ? CustomStyle.lightHeading4TextStyle
                        .copyWith(
                          fontWeight: FontWeight.w600,
                          color: CustomColor.primaryLightColor)
                    : CustomStyle.darkHeading4TextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                        color: CustomColor.primaryDarkTextColor.withOpacity(.50)),
                alignLabelWithHint: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 2,
                    color: CustomColor.primaryLightTextColor.withOpacity(.30),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    width: 2,
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
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isVisibility ? Iconsax.eye_slash : Iconsax.eye,
                    //color: widget.suffixColor?.withOpacity(0.3),
                    color: focusNode!.hasFocus
                        ? CustomColor.primaryLightColor
                        : CustomColor.primaryLightTextColor.withOpacity(.30),
                    size: Dimensions.iconSizeDefault,
                  ),
                  color: widget.color,
                  onPressed: () {
                    setState(() {
                      isVisibility = !isVisibility;
                    });
                  },
                ),
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: widget.padding,
                      child: Icon(
                        iconData,
                        size: size,
                        color: focusNode!.hasFocus
                            ? CustomColor.primaryLightColor
                            : CustomColor.primaryLightTextColor.withOpacity(.30),
                      ),
                    ),
                  ],
                ),
              ),
              obscureText: isVisibility,
            ),
          ),
        ),
      ],
    );
  }
}