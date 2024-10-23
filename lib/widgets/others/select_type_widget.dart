import '../../utils/basic_screen_imports.dart';

class SelectTypeWidget extends StatelessWidget {
  const SelectTypeWidget({
    super.key,
    required this.color,
    required this.textColor,
    required this.title,
    required this.onTap,
  });
  final Color color, textColor;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: Dimensions.marginSizeHorizontal * 0.3),
        width: Dimensions.widthSize * 9.3,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSize * 0.5,
          horizontal: Dimensions.paddingSize * 0.3,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius),
            color: color,
            border: Border.all(
              color: CustomColor.primaryLightColor,
            )),
        child: TitleHeading4Widget(
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
          text: title,
          fontSize: Dimensions.headingTextSize5,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
