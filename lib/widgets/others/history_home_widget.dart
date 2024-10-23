import '../../utils/basic_screen_imports.dart';
import '../find_doctor/doctor_information_widget.dart';

class HistoryWithExpansionWidget extends StatelessWidget {
  const HistoryWithExpansionWidget({
    super.key,
    required this.title,
    required this.monthText,
    required this.dateText,
    required this.amount,
    required this.transaction,
    required this.status,
    required this.onTap,
    required this.schedule,
    required this.patientName,
    required this.mobile,
    required this.email,
    required this.statusTile,
    required this.statusTileColor,
    required this.statusColor,
  });
  final VoidCallback onTap;
  final Color statusTileColor, statusColor;
  final String title, monthText, dateText, amount, transaction, status;
  final String 
      schedule,
      patientName,
      mobile,
      email,
      statusTile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.6,
        vertical: Dimensions.marginSizeVertical * 0.1,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          color: CustomColor.customBlueAccent),
      child: ExpansionTile(
        backgroundColor: CustomColor.customBlueAccent,
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        trailing: SizedBox(
          width: Dimensions.widthSize * 9,
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, top: 15),
            child: TitleHeading2Widget(
              text: amount,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              fontSize: Dimensions.headingTextSize4,
              fontWeight: FontWeight.w600,
              color: CustomColor.primaryLightColor,
            ),
          ),
        ),
        iconColor: Colors.transparent,
        title: Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.marginSizeVertical * 0.2,
                    top: Dimensions.marginSizeVertical * 0.5,
                    bottom: Dimensions.marginSizeVertical * 0.4,
                    right: Dimensions.marginSizeVertical * 0.1,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: mainCenter,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: crossCenter,
                    children: [
                      TitleHeading1Widget(
                          text: dateText,
                          fontSize: Dimensions.headingTextSize1,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.primaryLightTextColor),
                      TitleHeading1Widget(
                          text: monthText,
                          fontSize: Dimensions.headingTextSize5,
                          fontWeight: FontWeight.w500,
                          color: CustomColor.primaryLightTextColor),
                    ],
                  ),
                )),
            Container(
              height: Dimensions.heightSize * 2.8,
              width: 2,
              color: CustomColor.primaryLightTextColor.withOpacity(0.3),
            ),
            horizontalSpace(Dimensions.widthSize * 0.7),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: TitleHeading1Widget(
                            text: title,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: Dimensions.headingTextSize4 + 1,
                            fontWeight: FontWeight.w600,
                            color: CustomColor.primaryLightTextColor),
                      ),
                      horizontalSpace(Dimensions.widthSize * 0.2),
                      Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(1),
                          width: Dimensions.widthSize * 5.4,
                          height: Dimensions.heightSize * 1.4,
                          decoration: ShapeDecoration(
                            color: statusColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radius * 0.4),
                            ),
                          ),
                          child: TitleHeading3Widget(
                            text: status,
                            color: CustomColor.whiteColor,
                            fontSize: Dimensions.headingTextSize5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(Dimensions.widthSize * 0.3),
                  TitleHeading4Widget(
                    text: transaction,
                    fontSize: Dimensions.headingTextSize5,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.primaryLightTextColor.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ],
        ),
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.3),
            decoration: ShapeDecoration(
                shadows: const [
                  BoxShadow(
                    color: CustomColor.whiteColor,
                    blurRadius: 10,
                  )
                ],
                color: CustomColor.whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.radius * 0.8),
                  bottomRight: Radius.circular(Dimensions.radius * 0.8),
                ))),
            child: Column(
              children: [
                DoctorInformationWidget(
                  variable: Strings.patientName,
                  value: patientName,
                ),
                DoctorInformationWidget(
                  variable: Strings.mobile,
                  value: mobile,
                ),
                DoctorInformationWidget(
                  variable: Strings.email,
                  value: email,
                ),
               
                verticalSpace(Dimensions.heightSize * 0.6),
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    TitleHeading4Widget(
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      text: Strings.status,
                      fontSize: Dimensions.headingTextSize3 + 1,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(Dimensions.paddingSize * 0.07),
                      width: Dimensions.widthSize * 5.4,
                      height: Dimensions.heightSize * 1.4,
                      decoration: ShapeDecoration(
                        color: statusTileColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius * 0.4),
                        ),
                      ),
                      child: TitleHeading3Widget(
                        text: statusTile,
                        color: CustomColor.whiteColor,
                        fontSize: Dimensions.headingTextSize5,
                      ),
                    ),
                  ],
                ),
                verticalSpace(Dimensions.heightSize * 0.5),
              ],
            ),
          )
        ],
      ),
    );
  }
}
