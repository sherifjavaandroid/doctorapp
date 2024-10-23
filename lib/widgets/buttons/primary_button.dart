import '../../utils/basic_widget_imports.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.borderWidth = 0,
    this.height,
    this.buttonColor = CustomColor.primaryLightColor,
    this.buttonTextColor = Colors.white,
    this.shape,
    this.icon,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double? borderWidth;
  final double? height;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final OutlinedBorder? shape;
  final Widget? icon;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Dimensions.buttonHeight * 0.91,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: shape ??
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.7)),
          backgroundColor: buttonColor,
          side: BorderSide(
            width: borderWidth ?? Dimensions.widthSize * 0.1,
            color: borderColor ?? CustomColor.primaryLightColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            CustomTitleHeadingWidget(
              text: title,
              style: CustomStyle.darkHeading3TextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  color: buttonTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
