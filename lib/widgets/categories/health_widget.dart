
import '../../utils/basic_screen_imports.dart';

class HeathWidget extends StatelessWidget {
  const HeathWidget({
    super.key,
    required this.title,
    required this.price,
    required this.details,
  });
  final String title, price, details;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.2),
      padding: EdgeInsets.symmetric(
       horizontal: Dimensions.paddingSize,
       vertical: Dimensions.paddingSize*0.4
       
       ),
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
            fontSize: Dimensions.headingTextSize2,
          ),
          verticalSpace(Dimensions.heightSize * 0.4),
          
              Row(mainAxisAlignment: mainCenter,
                children: [
                  TitleHeading3Widget(
                    textAlign: TextAlign.center,
                    text: Strings.price,
                    fontSize: Dimensions.headingTextSize5,
                    color: CustomColor.primaryLightColor,
                  ),
                  horizontalSpace(Dimensions.widthSize * 0.3),
                  TitleHeading3Widget(
                    textAlign: TextAlign.center,
                    text: price,
                    fontSize: Dimensions.headingTextSize5,
                    color: CustomColor.primaryLightColor,
                  ),
                ],
              ),
              verticalSpace(Dimensions.heightSize*0.5),
              TitleHeading3Widget(
                 maxLines: 2,
            textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                text: details,
                fontSize: Dimensions.headingTextSize5,
                color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                fontWeight: FontWeight.w500,
              ),
            
        ],
      ),
    );
  }
}
