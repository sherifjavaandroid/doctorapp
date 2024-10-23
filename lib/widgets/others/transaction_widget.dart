import 'package:adoctor/utils/basic_widget_imports.dart';

import '../../controller/drawer/history_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../find_doctor/doctor_information_widget.dart';
import '../text_labels/title_heading5_widget.dart';

class TransactionWithExpansionWidget extends StatelessWidget {
  const TransactionWithExpansionWidget(
      {super.key,
      required this.title,
      required this.monthText,
      required this.dateText,
      required this.amount,
      required this.transaction,
      required this.downloadVisible,
      required this.status,
      required this.onTap,
      required this.doctorName,
      required this.schedule,
      required this.patientName,
      required this.mobile,
      required this.email,
      required this.type,
      required this.downloadButton,
      required this.fess,
      required this.statusTile,
      required this.statusTileColor,
      required this.statusColor,
      //
      required this.paymentMethod,
      required this.doctorFees,
      required this.payableAmount});
  final bool downloadVisible;
  final VoidCallback onTap;
  final Widget downloadButton;
  final Color statusTileColor, statusColor;
  final String title, monthText, dateText, amount, transaction, status;
  final String doctorName,
      schedule,
      patientName,
      mobile,
      email,
      type,
      fess,
      statusTile,
      paymentMethod,
      doctorFees,
      payableAmount;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();
    // ignore: deprecated_member_use
    var data = controller.historyModel.data.booking.last.details!.isNull;
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
                  variable: Strings.doctorName,
                  value: doctorName,
                ),
                DoctorInformationWidget(
                  variable: Strings.mobile,
                  value: mobile,
                ),
                DoctorInformationWidget(
                  variable: Strings.email,
                  value: email,
                ),
                DoctorInformationWidget(
                  variable: Strings.appointmentType,
                  value: type,
                ),
                DoctorInformationWidget(
                  variable: Strings.fees,
                  value: fess,
                ),
                Visibility(
                  visible: data == false ? false : true,
                  child: DoctorInformationWidget(
                    variable: Strings.paymentMethod,
                    value: paymentMethod,
                  ),
                ),
                Visibility(
                  visible: data == false ? false : true,
                  child: DoctorInformationWidget(
                    variable: Strings.doctorFees,
                    value: doctorFees,
                  ),
                ),
                Visibility(
                  visible: data == false ? false : true,
                  child: DoctorInformationWidget(
                    variable: Strings.payableAmount,
                    value: payableAmount,
                  ),
                ),
                verticalSpace(Dimensions.heightSize * 0.6),
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    TitleHeading4Widget(
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      text: Strings.status,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                    ),
                    TitleHeading4Widget(
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      text: statusTile,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: Dimensions.marginSizeVertical * 0.2),
                    width: MediaQuery.of(context).size.width,
                    color: CustomColor.primaryLightTextColor.withOpacity(0.5),
                    child: const DottedDivider()),
                Visibility(
                  visible: downloadVisible,
                  child: Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      TitleHeading5Widget(
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        text: Strings.pdf,
                        fontWeight: FontWeight.w500,
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.3),
                      ),
                      Container(
                        child: downloadButton,
                      )
                    ],
                  ),
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
