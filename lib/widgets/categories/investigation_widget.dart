import 'package:google_fonts/google_fonts.dart';

import '../../utils/basic_screen_imports.dart';

class InvestigationWidget extends StatelessWidget {
  const InvestigationWidget({
    super.key,
    required this.title,
    required this.price,
    required this.croxPrice,
  });
  final String title, price, croxPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.2),
      padding: EdgeInsets.all(Dimensions.paddingSize),
      decoration: ShapeDecoration(
        color: CustomColor.customBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          TitleHeading3Widget(
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            text: title,
            fontWeight: FontWeight.w700,
          ),
          verticalSpace(Dimensions.heightSize * 0.4),
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              Row(
                children: [
                  TitleHeading3Widget(
                    text: Strings.price,
                    fontSize: Dimensions.headingTextSize5,
                    color: CustomColor.primaryLightColor,
                  ),
                  horizontalSpace(Dimensions.widthSize * 0.3),
                  TitleHeading3Widget(
                    text: price,
                    fontSize: Dimensions.headingTextSize5,
                    color: CustomColor.primaryLightColor,
                  ),
                ],
              ),
              horizontalSpace(Dimensions.widthSize * 0.3),
              Text(
                croxPrice,
                style: GoogleFonts.inter(
                  decoration: TextDecoration.lineThrough,
                  fontSize: Dimensions.headingTextSize5,
                  color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
