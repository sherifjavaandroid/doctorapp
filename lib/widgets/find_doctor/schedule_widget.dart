import '../../utils/basic_screen_imports.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({
    super.key,
    required this.day,
    required this.months,
    required this.date,
    required this.hours,
    this.bgColor,
    this.containerColor = CustomColor.primaryLightColor,
    this.onTap,
    this.dayTextColor = CustomColor.whiteColor,
    this.dateTextColor = CustomColor.thirdLightTextColor,
   this.isHours=true,
  });
  final String day, months, date, hours;
  final Color? bgColor, containerColor, dayTextColor, dateTextColor;
  final VoidCallback? onTap;
  final bool? isHours;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize * 0.3,
              vertical: Dimensions.paddingSize * 0.4),
          margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.4),
          decoration: BoxDecoration(
            color: bgColor,
            border: RDottedLineBorder.all(
                width: 1, color: CustomColor.primaryLightColor),
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Column(
            mainAxisAlignment: mainCenter,
            children: [
              TitleHeading4Widget(
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                text: date,
                fontSize: Dimensions.headingTextSize4 + 1,
                fontWeight: FontWeight.w500,
                color: dateTextColor,
              ),
              Visibility(
                visible: isHours!,
                child: TitleHeading1Widget(
                  text: hours,
                  fontSize: Dimensions.headingTextSize2,
                  fontWeight: FontWeight.w600,
                  color: dateTextColor,
                ),
              ),
            ],
          )),
    );
  }
}
