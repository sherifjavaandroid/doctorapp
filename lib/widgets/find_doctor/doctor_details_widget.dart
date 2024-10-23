
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/custom_image_widget.dart';

class DoctorDetailsWidget extends StatelessWidget {
  const DoctorDetailsWidget(
      {super.key,
      required this.name,
      required this.image,
      required this.onTap,
      required this.designation,
      required this.qualification,
      required this.categories,
      required this.amount, required this.speciality});
  final String name, designation, qualification, speciality, categories,image, amount;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical*0.2),
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
  
        decoration: ShapeDecoration(
          color: CustomColor.customBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: 134.w,
                height:Dimensions.heightSize*7,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                  ),
                ),
              ),
            ),
            horizontalSpace(Dimensions.widthSize),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: mainCenter,
                crossAxisAlignment: crossStart,
                children: [
                  //name description
                  Row(
                    mainAxisAlignment: mainStart,
                    crossAxisAlignment: crossStart,
                    children: [
                      CustomImageWidget(path: Assets.icon.userIcon),
                      horizontalSpace(Dimensions.widthSize*0.6),
                      TitleHeading2Widget(
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        text: name,
                        color: CustomColor. primaryLightTextColor,
                        fontSize: Dimensions.headingTextSize4,
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                  verticalSpace(Dimensions.heightSize * 0.3),
                  TitleHeading4Widget(
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    text: designation,
                    color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                    fontSize: Dimensions.headingTextSize6,
                    fontWeight: FontWeight.w500,
                  ),
                  verticalSpace(Dimensions.heightSize * 0.3),
                  TitleHeading4Widget(
                    text: qualification,
                    color: CustomColor.primaryLightColor,
                    fontSize: Dimensions.headingTextSize6,
                    fontWeight: FontWeight.w400,
                  ),
                  verticalSpace(Dimensions.heightSize * 0.3),
                  TitleHeading4Widget(
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    text: speciality,
                    color: CustomColor. primaryLightTextColor.withOpacity(0.3),
                    fontSize: Dimensions.headingTextSize6,
                    fontWeight: FontWeight.w600,
                  ),
                  verticalSpace(Dimensions.heightSize * 0.3),
                  //categories
                  Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      Expanded(
                        child: TitleHeading4Widget(
                          text: categories,
                          color: CustomColor.primaryLightColor,
                          fontSize: Dimensions.headingTextSize6,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: TitleHeading3Widget(
                          text: amount,
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                          color: CustomColor.primaryLightColor,
                          fontSize: Dimensions.headingTextSize4,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
